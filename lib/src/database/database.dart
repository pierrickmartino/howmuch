import 'package:howmuch/constant/const.dart';
import 'package:moor/moor.dart';
import 'package:undo/undo.dart';

import 'db_utils.dart';

export 'shared.dart';

part 'database.g.dart';

@DataClassName('Category')
class Categories extends Table {
  // autoIncrement automatically sets this to be the primary key
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
  IntColumn get icon => integer().nullable()();
  TextColumn get iconFamily => text().nullable()();
  TextColumn get iconPackage => text().nullable()();
  IntColumn get color => integer().nullable()();
  IntColumn get performance => integer().nullable()();
  DateTimeColumn get creationDate => dateTime().nullable()();
  DateTimeColumn get lastUpdateDate => dateTime().nullable()();
  BoolColumn get editable => boolean().withDefault(const Constant(true))();
  BoolColumn get active => boolean().withDefault(const Constant(true))();
}

@DataClassName('Account')
class Accounts extends Table {
  // autoIncrement automatically sets this to be the primary key
  IntColumn get id => integer().autoIncrement()();
  TextColumn get code => text().withLength(min: 1, max: 20)();
}

@DataClassName('Transaction')
class Transactions extends Table {
  // autoIncrement automatically sets this to be the primary key
  IntColumn get id => integer().autoIncrement()();
  TextColumn get product => text()();
  TextColumn get iban => text().nullable()();
  TextColumn get transactionId => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get description2 => text().nullable()();
  TextColumn get description3 => text().nullable()();
  TextColumn get currency => text().withLength(min: 3, max: 3)();
  TextColumn get extraInfo => text().nullable()();
  DateTimeColumn get valueDate => dateTime().nullable()();
  DateTimeColumn get transactionDate => dateTime().nullable()();
  DateTimeColumn get accountingDate => dateTime().nullable()();
  IntColumn get category =>
      integer().nullable().customConstraint('NULL REFERENCES categories(id)')();
  RealColumn get debitAmount =>
      real().nullable().withDefault(const Constant(0))();
  RealColumn get creditAmount =>
      real().nullable().withDefault(const Constant(0))();
  RealColumn get transactionAmount =>
      real().nullable().withDefault(const Constant(0))();
}

class CategoryWithInfo {
  CategoryWithInfo(this.category, this.count, this.amount);

  // can be null, in which case we count how many entries don't have a category
  final Category category;
  final int count; // number of transactions in this category
  final double amount;
}

class TransactionWithCategory {
  TransactionWithCategory(this.transaction, this.category);

  final Category category;
  final Transaction transaction;
}

@UseMoor(
  tables: [Transactions, Categories],
  queries: {
    '_resetCategory':
        'UPDATE Transactions SET category = NULL WHERE category = ?',
  },
)
class Database extends _$Database {
  Database(QueryExecutor e) : super(e);
  final cs = ChangeStack();
  // : super(FlutterQueryExecutor.inDatabaseFolder(
  //       path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) {
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from == 1) {
          await m.addColumn(categories, categories.creationDate);
        }
      },
      beforeOpen: (details) async {
        if (details.wasCreated) {
          // init of categories in database based on const.dart
          for (final initCategory in initCategoryList) {
            await into(categories).insert(CategoriesCompanion(
                description: Value(initCategory),
                editable: const Value(false),
                creationDate: Value(DateTime.now()),
                active: const Value(true)));
          }

          await into(transactions).insert(const TransactionsCompanion(
              product: Value('INIT'),
              description: Value('Transaction initiale'),
              currency: Value('CHF'),
              category: Value(1)));
        }
      },
    );
  }

  /// is a duplicate of the column names counter
  Stream<List<CategoryWithInfo>> watchCategoriesWithCount() {
    // select all categories and load how many associated transactions there are for
    // each category
    return customSelect(
      'SELECT c.*, '
      '(SELECT COUNT(*) FROM transactions WHERE category = c.id) AS counter '
      '(SELECT SUM(transactionAmount) FROM transactions WHERE category = c.id) AS amount '
      'FROM categories c '
      'ORDER BY counter DESC',
      readsFrom: {categories, transactions},
    ).map((row) {
      // when we have the result set, map each row to the data class
      final hasId = row.data['id'] != null;

      return CategoryWithInfo(
          hasId ? Category.fromData(row.data, this) : null,
          row.readInt('counter'),
          row.readDouble(
            'amount',
          ));
    }).watch();
  }

  /// Watches all transactions in the given category. If the category is null, all
  /// entries will be shown instead.
  Stream<List<TransactionWithCategory>> watchTransactionsInCategory(
      Category _category) {
    final query = select(transactions).join(
      [
        leftOuterJoin(
            transactions, transactions.id.equalsExp(transactions.category))
      ],
    );

    if (_category != null) {
      query.where(transactions.id.equals(_category.id));
    } else {
      query.where(isNull(transactions.id));
    }

    return query.watch().map((rows) {
      // read both the transaction and the associated category for each row
      return rows.map((row) {
        return TransactionWithCategory(
          row.readTable(transactions),
          row.readTable(categories),
        );
      }).toList();
    });
  }

  Future<List<Category>> get allWatchingCategories => select(categories).get();
  Stream<List<Category>> get watchAllCategories => select(categories).watch();

  /* TODO : Really necessary ??? double-check if auto-increment is not enough */
  Future<dynamic> createCategory(CategoriesCompanion _category) async {
    final _categories = await (select(categories)
          ..orderBy(
            [
              (u) => OrderingTerm(expression: u.id, mode: OrderingMode.desc),
            ],
          ))
        .get();
    _category = _category.copyWith(id: Value(_categories.first.id + 1));
    return insertRow(cs, categories, _category);
  }

  Future<dynamic> updateCategory(Category _category) async {
    return updateRow(cs, categories, _category);
  }

  Future<dynamic> deleteCategory(Category _category) {
    return transaction(() async {
      await _resetCategory(_category.id);
      await deleteRow(cs, categories, _category);
    });
  }

  Future<List<Transaction>> allWatchingTransactions() {
    return (select(transactions)..limit(10)).get();
  }

  Stream<List<Transaction>> watchAllTransactions() {
    return (select(transactions)..limit(10)).watch();
  }

  Future<int> get countTransactions =>
      select(transactions).get().then((value) => value.length);

  Future<int> get countTransactionsThisMonth => (select(transactions)
        ..where((tbl) => tbl._valueDate.year.equals(DateTime.now().year))
        ..where((tbl) => tbl._valueDate.month.equals(DateTime.now().month)))
      .get()
      .then((value) => value.length);

  Future<int> get countTransactionsThisYear => (select(transactions)
        ..where((tbl) => tbl._valueDate.year.equals(DateTime.now().year)))
      .get()
      .then((value) => value.length);

  Future<double> totalAmountTransactions() {
    final transactionTotalAmount = transactions.transactionAmount.sum();
    final query = selectOnly(transactions)
      ..addColumns([transactionTotalAmount]);

    return query.map((row) => row.read(transactionTotalAmount)).getSingle();
  }

  Future<dynamic> insertTransaction(TransactionsCompanion _transaction) async {
    await into(transactions).insert(_transaction);
  }

  Future<dynamic> createTransaction(TransactionsCompanion _transaction) async {
    final _transactions = await (select(transactions)
          ..orderBy(
            [
              (u) => OrderingTerm(expression: u.id, mode: OrderingMode.desc),
            ],
          ))
        .get();
    _transaction = _transaction.copyWith(id: Value(_transactions.first.id + 1));
    return insertRow(cs, transactions, _transaction);
  }

  Future<dynamic> updateTransaction(Transaction _transaction) async {
    return updateRow(cs, transactions, _transaction);
  }

  Future<dynamic> deleteTransaction(Transaction _transaction) async {
    await deleteRow(cs, transactions, _transaction);
  }

  Future<dynamic> deleteAllTransactions() async {
    return transaction(() async {
      await (delete(transactions)).go();
    });
  }
}

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
  BoolColumn get editable => boolean().withDefault(Constant(true))();
  BoolColumn get active => boolean().withDefault(Constant(true))();
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
  TextColumn get description => text()();
  DateTimeColumn get valueDate => dateTime().nullable()();
  IntColumn get category =>
      integer().nullable().customConstraint('NULL REFERENCES categories(id)')();
}

class CategoryWithCount {
  CategoryWithCount(this.category, this.count);

  // can be null, in which case we count how many entries don't have a category
  final Category category;
  final int count; // amount of transactions in this category
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
          for (var initCategory in initCategoryList) {
            await into(categories).insert(CategoriesCompanion(
                description: Value(initCategory),
                editable: const Value(false),
                creationDate: Value(DateTime.now()),
                active: const Value(true)));
          }

          await into(transactions).insert(TransactionsCompanion(
              description: const Value('Transaction'),
              category: const Value(1)));
        }
      },
    );
  }

  /// is a duplicate of the column names counter
  Stream<List<CategoryWithCount>> watchCategoriesWithCount() {
    // select all categories and load how many associated transactions there are for
    // each category
    return customSelect(
      'SELECT c.*, '
      '(SELECT COUNT(*) FROM transactions WHERE category = c.id) AS amount '
      'FROM categories c ',
      readsFrom: {categories, transactions},
    ).map((row) {
      // when we have the result set, map each row to the data class
      final hasId = row.data['id'] != null;

      return CategoryWithCount(
        hasId ? Category.fromData(row.data, this) : null,
        row.readInt('amount'),
      );
    }).watch();
  }

  /// Watches all transactions in the given [category]. If the category is null, all
  /// entries will be shown instead.
  Stream<List<TransactionWithCategory>> watchTransactionsInCategory(
      Category category) {
    final query = select(transactions).join(
      [
        leftOuterJoin(
            transactions, transactions.id.equalsExp(transactions.category))
      ],
    );

    if (category != null) {
      query.where(transactions.id.equals(category.id));
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

  Future createCategory(CategoriesCompanion entry) async {
    final _categories = await (select(categories)
          ..orderBy(
            [
              (u) => OrderingTerm(expression: u.id, mode: OrderingMode.desc),
            ],
          ))
        .get();
    entry = entry.copyWith(id: Value(_categories.first.id + 1));
    return insertRow(cs, categories, entry);
  }

  Future updateCategory(Category entry) async {
    return updateRow(cs, categories, entry);
  }

  Future deleteCategory(Category category) {
    return transaction(() async {
      await _resetCategory(category.id);
      await deleteRow(cs, categories, category);
    });
  }
}

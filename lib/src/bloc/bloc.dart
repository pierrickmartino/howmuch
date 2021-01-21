import 'package:bloc/bloc.dart';
import 'package:moor/moor.dart' as moor;
import 'package:rxdart/rxdart.dart';
import 'package:undo/undo.dart';

import '../database/database.dart';

/// Class that keeps information about a category and whether it's selected at
/// the moment.
class CategoryWithActiveInfo {
  CategoryWithActiveInfo(this.categoryWithCount, this.isActive);

  CategoryWithCount categoryWithCount;
  bool isActive;
}

class HowMuchAppBloc extends Cubit<ChangeStack> {
  HowMuchAppBloc(this.db) : super(db.cs) {
    init();
  }

  final Database db;

  // the tag that is selected at the moment. null means that we show all
  // entries
  final BehaviorSubject<Category> _activeCategory =
      BehaviorSubject.seeded(null);

  // final BehaviorSubject<List<CategoryWithActiveInfo>> _allTags =
  //     BehaviorSubject();

  Stream<List<TransactionWithCategory>> _currentEntries;

  /// A stream of entries that should be displayed on the home screen.
  Stream<List<TransactionWithCategory>> get homeScreenEntries =>
      _currentEntries;
  // Stream<List<CategoryWithActiveInfo>> get tags => _allTags;

  //Stream<List<Category>> _allCategories;
  Stream<List<Category>> get getCategories => db.watchAllCategories;

  Stream<List<CategoryWithCount>> get getCategoriesWithCount =>
      db.watchCategoriesWithCount();

  void init() {
    //_allCategories = db.watchAllCategories;

    // listen for the tag to change. Then display all entries that are in
    // the current tag on the home screen.
    _currentEntries = _activeCategory.switchMap(db.watchTransactionsInCategory);

    // also watch all tags so that they can be displayed in the navigation
    // drawer.
    // Rx.combineLatest2<List<CategoryWithCount>, Category,
    //     List<CategoryWithActiveInfo>>(
    //   db.categoriesWithCount(),
    //   _activeCategory,
    //   (allTags, selected) {
    //     return allTags.map((category) {
    //       final isActive = selected?.code == category.category?.code;

    //       return CategoryWithActiveInfo(category, isActive);
    //     }).toList();
    //   },
    // ).listen(_allTags.add);
    emit(db.cs);
  }

/*
 *
 *  CATEGORY
 * 
 */

  /*
   * Category Update
   */
  void showCategory(Category category) {
    _activeCategory.add(category);
  }

  /*
   * Category Creation
   */
  void createCategory(String content) async {
    await db.createCategory(
      CategoriesCompanion(
        description: moor.Value(content),
        creationDate: moor.Value(
          DateTime.now(),
        ),
      ),
    );
    emit(db.cs);
  }

  /*
   * Category Update unitary
   */
  void updateCategory(Category _category) async {
    db.updateCategory(_category);
    emit(db.cs);
  }

  /*
   * Category Delete unitary
   */
  void deleteCategory(Category _category) async {
    db.deleteCategory(_category);
    emit(db.cs);
  }

/*
 *
 *  TRANSACTION
 *
 */

  /* 
   * Transaction Creation
   * insert a new transaction with a research of the last id in database 
   * use of db_utils
   */
  void createTransaction(
      String product,
      String iban,
      String transactionId,
      String description,
      String description2,
      String description3,
      String currency,
      String extraInfo,
      DateTime valueDate,
      DateTime transactionDate,
      DateTime accountingDate,
      int category,
      double debitAmount,
      double creditAmount,
      double transactionAmount) async {
    await db.createTransaction(
      TransactionsCompanion(
        product: moor.Value(product),
        iban: moor.Value(iban),
        transactionId: moor.Value(transactionId),
        description: moor.Value(description),
        description2: moor.Value(description2),
        description3: moor.Value(description3),
        currency: moor.Value(currency),
        extraInfo: moor.Value(extraInfo),
        valueDate: moor.Value(valueDate),
        transactionDate: moor.Value(transactionDate),
        accountingDate: moor.Value(accountingDate),
        category: moor.Value(category),
        debitAmount: moor.Value(debitAmount),
        creditAmount: moor.Value(creditAmount),
        transactionAmount: moor.Value(transactionAmount),
      ),
    );
    emit(db.cs);
  }

  /* 
   * Transaction Creation
   * insert a new transaction with auto-incremental id
   */
  void insertTransaction(
      String product,
      String iban,
      String transactionId,
      String description,
      String description2,
      String description3,
      String currency,
      String extraInfo,
      DateTime valueDate,
      DateTime transactionDate,
      DateTime accountingDate,
      int category,
      double debitAmount,
      double creditAmount,
      double transactionAmount) async {
    await db.insertTransaction(
      TransactionsCompanion(
        product: moor.Value(product),
        iban: moor.Value(iban),
        transactionId: moor.Value(transactionId),
        description: moor.Value(description),
        description2: moor.Value(description2),
        description3: moor.Value(description3),
        currency: moor.Value(currency),
        extraInfo: moor.Value(extraInfo),
        valueDate: moor.Value(valueDate),
        transactionDate: moor.Value(transactionDate),
        accountingDate: moor.Value(accountingDate),
        category: moor.Value(category),
        debitAmount: moor.Value(debitAmount),
        creditAmount: moor.Value(creditAmount),
        transactionAmount: moor.Value(transactionAmount),
      ),
    );
    emit(db.cs);
  }

  /* 
   * Transaction Update unitary
   */
  void updateTransaction(Transaction _transaction) async {
    db.updateTransaction(_transaction);
    emit(db.cs);
  }

  /* 
   * Transaction Delete unitary
   */
  void deleteTransaction(Transaction _transaction) async {
    db.deleteTransaction(_transaction);
    emit(db.cs);
  }

  /*
   * Transaction Delete all
   */
  void deleteAllTransactions() async {
    db.deleteAllTransactions();
    emit(db.cs);
  }

  /* Transaction COUNT without any filter */
  Future<int> get countTransactions => db.countTransactions;
  /* Transaction SUM without any filter */
  Future<double> get totalAmountTransactions => db.totalAmountTransactions();

  bool get canUndo => db.cs.canUndo;
  void undo() async {
    await db.cs.undo();
    emit(db.cs);
  }

  bool get canRedo => db.cs.canRedo;
  void redo() async {
    await db.cs.redo();
    emit(db.cs);
  }

  void clear() {
    db.cs.clearHistory();
    emit(db.cs);
  }

  // void dispose() {
  //   _allTags.close();
  // }
}

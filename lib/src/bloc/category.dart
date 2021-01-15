import 'package:bloc/bloc.dart';
import 'package:moor/moor.dart';
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

  void showCategory(Category category) {
    _activeCategory.add(category);
  }

  void createCategory(String content) async {
    await db.createCategory(
      CategoriesCompanion(
        description: Value(content),
        creationDate: Value(
          DateTime.now(),
        ),
      ),
    );
    emit(db.cs);
  }

  void updateCategory(Category entry) async {
    db.updateCategory(entry);
    emit(db.cs);
  }

  void deleteCategory(Category entry) async {
    db.deleteCategory(entry);
    emit(db.cs);
  }

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

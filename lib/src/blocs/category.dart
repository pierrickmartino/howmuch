import 'package:bloc/bloc.dart';
import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';
import 'package:undo/undo.dart';

import '../../database/database.dart';

/// Class that keeps information about a tag and whether it's selected at
/// the moment.
class TagWithActiveInfo {
  TagWithActiveInfo(this.tagWithCount, this.isActive);

  TagWithCount tagWithCount;
  bool isActive;
}

class HowMuchAppBloc extends Cubit<ChangeStack> {
  HowMuchAppBloc(this.db) : super(db.cs) {
    init();
  }

  final AppDatabase db;

  // the tag that is selected at the moment. null means that we show all
  // entries
  final BehaviorSubject<Tag> _activeTag = BehaviorSubject.seeded(null);

  final BehaviorSubject<List<TagWithActiveInfo>> _allTags = BehaviorSubject();

  Observable<List<CategoryWithTag>> _currentEntries;

  /// A stream of entries that should be displayed on the home screen.
  Observable<List<CategoryWithTag>> get homeScreenEntries => _currentEntries;

  Observable<List<TagWithActiveInfo>> get tags => _allTags;

  void init() {
    // listen for the tag to change. Then display all entries that are in
    // the current tag on the home screen.
    _currentEntries = _activeTag.switchMap(db.watchEntriesInTag);

    // also watch all tags so that they can be displayed in the navigation
    // drawer.
    Observable.combineLatest2<List<TagWithCount>, Tag, List<TagWithActiveInfo>>(
      db.tagsWithCount(),
      _activeTag,
      (allTags, selected) {
        return allTags.map((tag) {
          final isActive = selected?.name == tag.tag?.name;

          return TagWithActiveInfo(tag, isActive);
        }).toList();
      },
    ).listen(_allTags.add);
    emit(db.cs);
  }

  void showTag(Tag tag) {
    _activeTag.add(tag);
  }

  void addTag(String name) async {
    final name = await db.createTag(name, color);
    emit(db.cs);
    showTag(Tag(name: name, color: null));
  }

  void createCategory(String content) async {
    await db.createCategory(CategoriesCompanion(
      description: Value(content),
      code: Value(content),
      tag_name: Value(_activeTag.value?.name),
    ));
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

  void deleteTag(Tag tag) async {
    // if the tag being deleted is the one selected, reset that db by
    // showing the entries who aren't in any tag
    if (_activeTag.value?.name == tag.name) {
      showTag(null);
    }

    await db.deleteTag(tag);
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

  void dispose() {
    _allTags.close();
  }
}

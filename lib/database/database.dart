import 'package:moor/moor.dart';
import 'package:undo/undo.dart';

import 'db_utils.dart';

part 'database.g.dart';

@DataClassName('Category')
class Categories extends Table {
  // autoIncrement automatically sets this to be the primary key
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
  TextColumn get code => text()();
  // ignore: non_constant_identifier_names
  IntColumn get tag =>
      integer().nullable().customConstraint('NULL REFERENCES tags(id)')();
  TextColumn get icon => text().nullable()();
  IntColumn get color => integer().nullable()();
  DateTimeColumn get creationDate => dateTime().nullable()();
  DateTimeColumn get lastUpdateDate => dateTime().nullable()();
  BoolColumn get active => boolean().withDefault(Constant(true))();
}

@DataClassName('Tag')
class Tags extends Table {
  // autoIncrement automatically sets this to be the primary key
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 20)();
  IntColumn get color => integer().nullable()();

  // @override
  // Set<Column> get primaryKey => {name};
}

class TagWithCount {
  TagWithCount(this.tag, this.count);

  // can be null, in which case we count how many entries don't have a tag
  final Tag tag;
  final int count; // amount of entries in this tag
}

class CategoryWithTag {
  CategoryWithTag(this.category, this.tag);

  final Category category;
  final Tag tag;
}

//@UseMoor(tables: [Categories, Tags], daos: [CategorieDao, TagDao])
@UseMoor(
  tables: [Categories, Tags],
  queries: {
    '_resetTag': 'UPDATE Categories SET tag = NULL WHERE tag = ?',
  },
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);
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
          // create default categories and entries
          final workId =
              await into(tags).insert(const TagsCompanion(name: Value('Work')));

          await into(categories).insert(CategoriesCompanion(
            code: const Value('INIT'),
            description: const Value('A first category entry'),
            creationDate: Value(DateTime.now()),
          ));

          await into(categories).insert(
            CategoriesCompanion(
              code: const Value('Rework persistence code'),
              tag: Value(workId),
              creationDate: Value(
                DateTime.now().add(const Duration(days: 4)),
              ),
            ),
          );
        }
      },
    );
  }

  Stream<List<TagWithCount>> tagsWithCount() {
    // select all tags and load how many associated entries there are for
    // each tag
    return customSelect(
      'SELECT c.name, c.desc, '
      '(SELECT COUNT(*) FROM categories WHERE category = c.id) AS amount '
      'FROM tags c '
      'UNION ALL SELECT null, null, '
      '(SELECT COUNT(*) FROM categories WHERE tag IS NULL)',
      readsFrom: {categories, tags},
    ).map((row) {
      // when we have the result set, map each row to the data class
      final hasId = row.data['id'] != null;

      return TagWithCount(
        hasId ? Tag.fromData(row.data, this) : null,
        row.readInt('amount'),
      );
    }).watch();
  }

  /// Watches all entries in the given [tag]. If the tag is null, all
  /// entries will be shown instead.
  Stream<List<CategoryWithTag>> watchEntriesInTag(Tag tag) {
    final query = select(categories)
        .join([leftOuterJoin(tags, tags.id.equalsExp(categories.tag))]);

    if (tag != null) {
      query.where(tags.id.equals(tag.id));
    } else {
      query.where(isNull(tags.id));
    }

    return query.watch().map((rows) {
      // read both the category and the associated tag for each row
      return rows.map((row) {
        return CategoryWithTag(
          row.readTable(categories),
          row.readTable(tags),
        );
      }).toList();
    });
  }

  Future createCategory(CategoriesCompanion entry) async {
    final _categories = await (select(categories)
          ..orderBy([
            (u) => OrderingTerm(expression: u.id, mode: OrderingMode.desc),
          ]))
        .get();
    entry = entry.copyWith(id: Value(_categories.first.id + 1));
    return insertRow(cs, categories, entry);
  }

  /// Updates the row in the database represents this entry by writing the
  /// updated data.
  Future updateCategory(Category entry) async {
    return updateRow(cs, categories, entry);
  }

  Future deleteCategory(Category entry) {
    return deleteRow(cs, categories, entry);
  }

  Future<int> createTag(String name) {
    return insertRow(
      cs,
      tags,
      TagsCompanion(name: Value(name)),
    );
  }

  Future deleteTag(Tag tag) {
    return transaction(() async {
      await _resetTag(tag.id);
      await deleteRow(cs, tags, tag);
    });
  }
}

// @UseDao(
//   tables: [Categories, Tags],
// )
// class CategoryDao extends DatabaseAccessor<AppDatabase>
//     with _$CategoryDaoMixin {
//   final AppDatabase db;

//   CategoryDao(this.db) : super(db);

//   Stream<List<CategoryWithTag>> watchAllCategories() {
//     return (select(categories)
//           ..orderBy(
//             [
//               (t) => OrderingTerm(expression: t.description),
//             ],
//           ))
//         .join(
//           [
//             leftOuterJoin(tags, tags.name.equalsExp(categories.tag_name)),
//           ],
//         )
//         .watch()
//         .map((rows) => rows.map(
//               (row) {
//                 return CategoryWithTag(
//                   category: row.readTable(categories),
//                   tag: row.readTable(tags),
//                 );
//               },
//             ).toList());
//   }

//   Future insertCategory(Insertable<Category> category) =>
//       into(categories).insert(category);
//   Future updateCategory(Insertable<Category> category) =>
//       update(categories).replace(category);
//   Future deleteCategory(Insertable<Category> category) =>
//       delete(categories).delete(category);
// }

// @UseDao(tables: [Tags])
// class TagDao extends DatabaseAccessor<AppDatabase> with _$TagDaoMixin {
//   final AppDatabase db;

//   TagDao(this.db) : super(db);

//   Stream<List<Tag>> watchTags() => select(tags).watch();
//   Future insertTag(Insertable<Tag> tag) => into(tags).insert(tag);
// }

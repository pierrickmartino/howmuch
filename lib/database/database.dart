import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

class Categories extends Table {
  // autoIncrement automatically sets this to be the primary key
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
  TextColumn get code => text()();
  TextColumn get icon => text()();
  TextColumn get color => text()();
  DateTimeColumn get creationDate => dateTime().nullable()();
  DateTimeColumn get lastUpdateDate => dateTime().nullable()();
  BoolColumn get active => boolean().withDefault(Constant(true))();
}

@UseMoor(tables: [Categories])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<Categorie>> getAllCategorie() => select(categories).get();
  Stream<List<Categorie>> watchAllCategorie() => select(categories).watch();
  Future insertNewCategorie(Categorie categorie) =>
      into(categories).insert(categorie);
  Future deleteCategorie(Categorie categorie) =>
      delete(categories).delete(categorie);
}

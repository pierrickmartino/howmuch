import 'package:get_it/get_it.dart';
import '../../database/database.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  final db = AppDatabase();

  locator.registerLazySingleton<CategorieDao>(() => CategorieDao(db));
  locator.registerLazySingleton<TagDao>(() => TagDao(db));
}

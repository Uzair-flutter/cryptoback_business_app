import 'package:get_it/get_it.dart';

import 'storage_service.dart';

final GetIt locator = GetIt.instance;

Future<void> initializeServices() async {
  await locator.reset();
  locator.registerLazySingleton(() => StorageService());
}

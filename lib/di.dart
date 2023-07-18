import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:search_cep/search_cep.dart';

import 'di.config.dart';

final sl = GetIt.instance;

@InjectableInit(preferRelativeImports: false)
Future<void> configureDependencies() async => sl.init();

@module
abstract class AppModule {
  const AppModule();

  @lazySingleton
  ViaCepSearchCep get viaCep => ViaCepSearchCep();
}


import 'package:check_my_news/config/endpoint.dart';
import 'package:check_my_news/services/news/newsServices.dart';
import 'package:get_it/get_it.dart';

GetIt injector = GetIt.instance;

void setupInjector() {
  /// Registering api endpoint
  injector.registerSingleton(Endpoint());

  /// Registering services
  injector.registerSingleton(NewsServices());
}
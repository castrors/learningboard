import 'package:get_it/get_it.dart';
import 'package:learningboard/core/viewmodels/content_model.dart';

GetIt dependencyInjection = GetIt.instance;

void setupDependencyInjection() {
  dependencyInjection.registerFactory(() => ContentModel());
}

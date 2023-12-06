import 'package:checkout/src/views/home/home.dart';
import 'package:checkout/src/views/receipt/receipt.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: Home, initial: true),
  MaterialRoute(page: Receipt),
], dependencies: [
  Singleton(classType: NavigationService),
  Singleton(classType: SnackbarService),
])
class App {}

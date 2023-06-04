import 'package:get/get.dart';
import 'package:timer/modules/home_binding.dart';
import 'package:timer/modules/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeView(),
        binding: HomeBinding()),

   
  ];
}

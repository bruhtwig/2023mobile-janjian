import 'package:get/get.dart';
import '../bindings/home_binding.dart';
import '../pages/homepage/my_home_page.dart';
import '../pages/login_register/login_page.dart';
import '../pages/login_register/register_page.dart';
import '../pages/onboard/my_onboard.dart';
import '../pages/splash_screen/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.initial, page: () => const SplashScreen()),
    GetPage(name: Routes.onboard, page: () => OnBoardPage()),

    GetPage(name: Routes.home, page: () => const MyHomePage(), binding: HomeBinding()),
    GetPage(name: Routes.login, page: () => LoginPage()),
    GetPage(name: Routes.register, page: () => RegisterPage()),
  ];
}
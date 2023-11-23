import 'package:get/get.dart';
import '../controller/agenda_controller.dart';
import '../controller/home_controller.dart';
import '../controller/spare_time_controller.dart';
import '../controller/user_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AgendaController());
    Get.put(SpareTimeController());
    Get.put(UserController());
    Get.put(HomeController());
  }
}
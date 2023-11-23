import 'package:get/get.dart';
import '../pages/agenda/my_inbox_agenda.dart';
import '../pages/agenda/my_outbox_agenda.dart';
import '../pages/agenda/add_agenda.dart';
import '../pages/spare_time/my_spare_time.dart';
import '../pages/user_profile/user_profile.dart';

class HomeController extends GetxController {
  dynamic page = MyOutboxAgenda();
  String title = 'Undangan dari Saya';

  void setPage(page) {
    switch(page.runtimeType) {
      case MyOutboxAgenda : title = "Undangan dari Saya";
      break;
      case MyInboxAgenda : title = "Undangan untuk Saya";
      break;
      case AddAgenda : title = "Buat Undangan Baru";
      break;
      case MySpareTime : title = "Waktu Luang Saya";
      break;
      case UserProfile : title = "Pengaturan Profil";
      break;
    }
    this.page = page;
    update();
  }
}
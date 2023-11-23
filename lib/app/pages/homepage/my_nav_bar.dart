import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../agenda/my_outbox_agenda.dart';
import '../agenda/my_inbox_agenda.dart';
import '../spare_time/my_spare_time.dart';
import '../user_profile/user_profile.dart';

class MyNavBar extends StatelessWidget {
  const MyNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Color(0xFF78BAE5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            navBarButton(MyOutboxAgenda(), Icons.outbox),
            navBarButton(MyInboxAgenda(), Icons.move_to_inbox),
            Expanded(
              flex: 2,
              child: Container(),
            ),
            navBarButton(MySpareTime(), Icons.access_time_filled),
            navBarButton(UserProfile(), Icons.person),
          ],
        ),
      ),
    );
  }

  Widget navBarButton(page, icon) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Expanded(
        flex: 3,
        child: IconTheme(
          data: IconThemeData(
            size: 35,
            color: controller.page.runtimeType == page.runtimeType
                ? Colors.white
                : const Color(0xFF0E4568),
          ),
          child: IconButton(
            icon: Icon(icon),
            onPressed: () {
              controller.setPage(page);
            },
          ),
        ),
      );
    });
  }
}

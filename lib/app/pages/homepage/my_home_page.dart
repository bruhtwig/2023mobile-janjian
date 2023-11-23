import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'my_app_bar.dart';
import 'my_nav_bar.dart';
import '../../controller/home_controller.dart';
import '../agenda/add_agenda.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
      return GetBuilder<HomeController>(builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xFFF3F5F5),
          appBar: MyAppBar(
            title: controller.title,
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
            child: controller.page,
          ),
          bottomNavigationBar: const MyNavBar(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            child: const Icon(
              color: Colors.orange,
              Icons.add,
              size: 40,
            ),
            onPressed: () {
              controller.setPage(AddAgenda());
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation
              .centerDocked,
        );
      });
  }
}

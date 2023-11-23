import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'user_profile_field.dart';
import '../../controller/home_controller.dart';
import '../../controller/user_controller.dart';
import '../../routes/app_routes.dart';
import '../agenda/my_outbox_agenda.dart';
// import 'package:janjian/app/data/provider/tracker_service.dart';

class UserProfile extends StatelessWidget {
  UserProfile({Key? key}) : super(key: key);

  final userC = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserProfileField(title: 'Nama', controller: userC.name, isEnable: true),
        UserProfileField(title: 'Email', controller: userC.email, isEnable: false),
        const SizedBox(height: 30),
        SizedBox(
          width: double.infinity,
          height: 41,
          child: ElevatedButton(
            onPressed: () {
              if (userC.name.text == '') {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Nama tidak boleh kosong',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.red,
                    elevation: 0,
                  ),
                );
              } else {
                // (TrackerService()).track('update_user', content: {'type': 'button'});
                // userC.editUser();
                final homeC = Get.find<HomeController>();
                homeC.setPage(MyOutboxAgenda());
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff78BBE6),
            ),
            child: const Text(
              'Simpan',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: double.infinity,
          height: 41,
          child: ElevatedButton(
            onPressed: () {
              // (TrackerService()).track('logout', content: {'type': 'button'});
              Get.dialog(AlertDialog(
                title: const Center(child: Text('Keluar')),
                content: const Text('Yakin nih keluar dari aplikasi?'),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        child: const Text('Tidak'),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          userC.logout();
                          Get.offAllNamed(Routes.initial);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text('Iya'),
                      ),
                    ],
                  ),
                ],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffFF9711),
            ),
            child: const Text(
              'Keluar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

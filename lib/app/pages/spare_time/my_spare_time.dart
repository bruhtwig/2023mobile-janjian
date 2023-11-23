import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/spare_time_controller.dart';
import 'add_spare_time.dart';
import 'empty_spare_time.dart';
import 'spare_time_card.dart';

class MySpareTime extends StatelessWidget {
  MySpareTime({Key? key}) : super(key: key);

  final spareTimeC = Get.find<SpareTimeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MaterialButton(
          height: 41,
          color: const Color(0xFF78BBE6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          onPressed: () async {
            Get.dialog(
              Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: AddSpareTime(),
              ),
            );
          },
          child: const Center(
            child: Text(
              'Tambah Waktu Luang',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
          child: const Text(
            'Daftar waktu luang saya',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        Expanded(child: Obx(() => spareTimeC.userSpareTimes.isEmpty ?
        const EmptySpareTime() :
        ListView.builder(
            itemCount: spareTimeC.userSpareTimes.length,
            itemBuilder: (context, index) => SpareTimeCard(index: index),
          )),
        ),
      ],
    );
  }
}

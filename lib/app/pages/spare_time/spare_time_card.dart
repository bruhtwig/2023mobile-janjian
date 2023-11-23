import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controller/spare_time_controller.dart';
import 'spare_time_detail.dart';
// import 'package:janjian/app/services/tracker_service.dart';

class SpareTimeCard extends StatelessWidget {
  SpareTimeCard({super.key, required this.index});

  final int index;
  final spareTimeC = Get.find<SpareTimeController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Waktu Luang ${index + 1}',
                    style: const TextStyle(fontSize: 12, color: Color(0xFF696969),),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      FittedBox(fit: BoxFit.fitWidth,
                        child: Text(
                          DateFormat.yMd().add_Hm().format(spareTimeC.userSpareTimes[index].startDate!.toLocal()),
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12,
                          ),
                        ),
                      ),
                      const Text(" - "),
                      FittedBox(fit: BoxFit.fitWidth,
                        child: Text(
                          DateFormat.yMd().add_Hm().format(spareTimeC.userSpareTimes[index].endDate!.toLocal()),
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            spareTimeIconButton(() {
              spareTimeC.userSpareTime.value =
              spareTimeC.userSpareTimes[index];
              spareTimeC.deleteSpareTime();
              // (TrackerService()).track('delete_sparetime',content: {'type': 'button'});
            }, Icons.delete_outline),
            spareTimeIconButton(() {
              spareTimeC.userSpareTime.value = spareTimeC.userSpareTimes[index];
              spareTimeC.setForm();
              Get.dialog(Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: SpareTimeDetail(),
              ));
            }, Icons.drive_file_rename_outline),
          ],
        ),
      ),
    );
  }

  Widget spareTimeIconButton(Function buttonPressed, IconData icon) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => buttonPressed(),
            icon: Icon(
              icon,
              color: Colors.black,
              size: 27.0,
            ),
          ),
        ],
      ),
    );
  }
}

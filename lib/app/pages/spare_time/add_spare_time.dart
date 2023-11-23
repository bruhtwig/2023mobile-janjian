import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/spare_time_controller.dart';

class AddSpareTime extends StatelessWidget {
  AddSpareTime({super.key});

  final spareTimeC = Get.find<SpareTimeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white,),
      child: Padding(padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Waktu Luang',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,),
            ),
            const SizedBox(height: 10),
            const Text(
              'Tanggal Mulai',
              style: TextStyle(fontSize: 12,),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(flex: 7,
                    child: Obx(() {
                      return DateTimePicker(
                        type: DateTimePickerType.dateTime,
                        firstDate: DateTime.now(),
                        lastDate: spareTimeC.endDate.value ?? DateTime.now().add(const Duration(days: 365 * 100)),
                        onChanged: (val) {spareTimeC.startDate.value = DateTime.parse(val);},
                      );
                    }),
                  ),
                  const Expanded(flex: 1, child: Icon(Icons.date_range_outlined, size: 30.0,),),
                ],
              ),
            ),
            const Text(
              'Tanggal Selesai',
              style: TextStyle(fontSize: 12,),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(flex: 7,
                    child: Obx(() {
                      return DateTimePicker(
                        type: DateTimePickerType.dateTime,
                        initialDate: spareTimeC.startDate.value ?? DateTime.now(),
                        firstDate: spareTimeC.startDate.value ?? DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365 * 100)),
                        onChanged: (val) {spareTimeC.endDate.value = DateTime.parse(val);},
                      );
                    }),
                  ),
                  const Expanded(flex: 1, child: Icon(Icons.date_range_outlined, size: 30.0,),),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            MaterialButton(
              height: 40,
              color: const Color(0xFF78BBE6),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
              onPressed: () {
                if (spareTimeC.startDate.value == null || spareTimeC.endDate.value == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Mohon isi semua data',
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
                } else if (spareTimeC.endDate.value!.isBefore(spareTimeC.startDate.value!)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Waktu selesai tidak boleh mendahului waktu mulai',
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
                } else if (spareTimeC.startDate.value!.isBefore(DateTime.now())) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Waktu mulai tidak boleh kurang dari waktu saat ini',
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
                  spareTimeC.addSpareTime();
                  Get.back();
                  // (TrackerService()).track('add_sparetime', content: {'type': 'button'});
                }
              },
              child: const Center(
                child: Text(
                  'Simpan',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
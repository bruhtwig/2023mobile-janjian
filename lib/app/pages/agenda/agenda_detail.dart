import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/agenda_controller.dart';
import 'agenda_form_field.dart';
// import 'package:janjian/app/data/provider/tracker_service.dart';

class AgendaDetail extends StatelessWidget {
  AgendaDetail({super.key});

  final agendaC = Get.find<AgendaController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        width: double.infinity,
        height: MediaQuery
            .of(context)
            .size
            .height * 0.7,
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AgendaFormField(
                controller: agendaC.name,
                title: "Nama Acara",
                hintText: "Tuliskan judul acaramu",
              ),
              AgendaFormField(
                controller: agendaC.description,
                title: "Deskripsi",
                hintText: "Tuliskan deskripsi acaramu",
              ),
              const Text(
                'Tanggal Mulai',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              Padding(padding: const EdgeInsets.only(bottom: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(flex: 7,
                      child: SizedBox(height: 37,
                        child: DateTimePicker(
                          type: DateTimePickerType.dateTime,
                          firstDate: DateTime.now(),
                          lastDate: agendaC.endDate.value ?? DateTime.now().add(const Duration(days: 365 * 100)),
                          onChanged: (val) {agendaC.startDate.value = DateTime.parse(val);},
                          style: const TextStyle(fontSize: 15,),
                        ),
                      ),
                    ),
                    const Expanded(flex: 1,
                      child: Icon(Icons.date_range_outlined, size: 30.0,),
                    ),
                  ],
                ),
              ),
              const Text(
                'Tanggal Selesai',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              Padding(padding: const EdgeInsets.only(bottom: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(flex: 7,
                      child: SizedBox(height: 37,
                        child: DateTimePicker(
                          type: DateTimePickerType.dateTime,
                          initialDate: agendaC.startDate.value ?? DateTime.now(),
                          firstDate: agendaC.startDate.value ?? DateTime.now(),
                          lastDate: DateTime.now().add(const Duration(days: 365 * 100)),
                          onChanged: (val) {agendaC.endDate.value = DateTime.parse(val);},
                          style: const TextStyle(fontSize: 15,),
                        ),
                      ),
                    ),
                    const Expanded(flex: 1,
                      child: Icon(Icons.date_range_outlined, size: 30.0,),
                    ),
                  ],
                ),
              ),
              AgendaFormField(
                controller: agendaC.location,
                title: "Tempat",
                hintText: "Tuliskan lokasi acaramu",
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              MaterialButton(
                height: 40,
                color: const Color(0xFF78BAE5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {
                  if (agendaC.name.text == '' || agendaC.description.text == '' || agendaC.location.text == '' || agendaC.startDate.value == null || agendaC.endDate.value == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Semua data harus terisi',
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
                  } else if (agendaC.endDate.value!.isBefore(agendaC.startDate.value!)) {
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
                  } else if (agendaC.startDate.value!.isBefore(DateTime.now())) {
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
                    agendaC.editAgenda();
                    Get.back();
                  }
                },
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Simpan",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              MaterialButton(
                height: 40,
                color: const Color(0xFFFD9611),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                onPressed: () {
                  agendaC.deleteAgenda();
                  Get.back();
                  // (TrackerService()).track('delete_agenda', content: {'type': 'button'});
                },
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Hapus",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              MaterialButton(
                height: 40,
                color: const Color(0xFFEFEFEF),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                onPressed: () {
                  Get.back();
                },
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Kembali",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1DA1F2)),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/agenda_controller.dart';
import '../../controller/home_controller.dart';
import 'add_shared_user.dart';
import 'agenda_form_field.dart';
import 'my_outbox_agenda.dart';
// import 'package:janjian/app/data/provider/tracker_service.dart';

class AddAgenda extends StatelessWidget {
  AddAgenda({super.key});

  final agendaC = Get.find<AgendaController>();

  final ScrollController scrollController = ScrollController();

  final List<String> users = [];

  final RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*\.com$');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Obx(() {
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
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
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Dibagikan kepada",
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.dialog(Dialog(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                child: AddSharedUser()),
                              );
                            },
                            style: ButtonStyle(minimumSize:
                              MaterialStateProperty.all<Size>(const Size(25, 25)),
                            ),
                            child: const Icon(Icons.person_add,),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
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
                  agendaC.addAgenda();
                  final homeC = Get.find<HomeController>();
                  homeC.setPage(MyOutboxAgenda());
                  // (TrackerService()).track('add_agenda', content: {'type': 'button'});
                }
              },
              child: const Center(
                child: Text(
                  "Simpan",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

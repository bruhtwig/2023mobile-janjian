import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:janjian/app/controller/agenda_controller.dart';
import 'package:janjian/app/data/model/agenda.dart';
import 'package:janjian/app/pages/agenda/agenda_detail.dart';

class AgendaCard extends StatelessWidget {
  const AgendaCard({super.key, required this.agenda});

  final Agenda agenda;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      child: MaterialButton(
        onPressed: () {
          final agendaC = Get.find<AgendaController>();
          agendaC.agenda.value = agenda;
          agendaC.setForm();
          Get.dialog(Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: AgendaDetail(),
          ));
        },
        minWidth: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                agenda.name!,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(height: 10),
              Text(
                agenda.description!,
                style: const TextStyle(fontSize: 14),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    DateFormat.yMd().add_Hm().format(agenda.startDate!.toLocal()),
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                  const Text(
                    ' - ',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                  Text(
                    DateFormat.yMd().add_Hm().format(agenda.endDate!.toLocal()),
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

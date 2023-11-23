import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/agenda_controller.dart';
import 'agenda_card.dart';
import 'empty_agenda.dart';

class MyInboxAgenda extends StatelessWidget {
  MyInboxAgenda({super.key});

  final agendaC = Get.find<AgendaController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => agendaC.inboxAgendas.isEmpty ?
    const EmptyAgenda() :
    ListView.builder(
      itemCount: agendaC.inboxAgendas.length,
      itemBuilder: (context, index) => AgendaCard(agenda:agendaC.inboxAgendas[index]),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/agenda_controller.dart';
import 'agenda_card.dart';
import 'empty_agenda.dart';

class MyOutboxAgenda extends StatelessWidget {
  MyOutboxAgenda({super.key});

  final agendaC = Get.find<AgendaController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => agendaC.outboxAgendas.isEmpty ?
      const EmptyAgenda() :
      ListView.builder(
        itemCount: agendaC.outboxAgendas.length,
        itemBuilder: (context, index) => AgendaCard(agenda:agendaC.outboxAgendas[index]),
      ));
  }
}

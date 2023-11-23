import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../data/model/agenda.dart';
import '../data/provider/agenda_provider.dart';

class AgendaController extends GetxController {
  Rx<Agenda> agenda = Agenda().obs;
  RxList<Agenda> outboxAgendas = <Agenda>[].obs;
  RxList<Agenda> inboxAgendas = <Agenda>[].obs;

  final idCount = 0.obs;

  final name = TextEditingController();
  final description = TextEditingController();
  final location = TextEditingController();

  final startDate = Rxn<DateTime>();
  final endDate = Rxn<DateTime>();

  final agendaP = Get.put(AgendaProvider());
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    box.hasData('outbox_agendas')
        ? outboxAgendas.value = (box.read('outbox_agendas') as List)
            .map((item) => Agenda.fromJson(item))
            .toList()
        // : getOutboxAgenda();
        : null;
    box.hasData('inbox_agendas')
        ? inboxAgendas.value = (box.read('inbox_agendas') as List)
            .map((item) => Agenda.fromJson(item))
            .toList()
        // : getInboxAgenda();
        : null;
  }

  Agenda setAgenda() {
    var data = {
      "id": idCount.value,
      "name": name.text,
      "description": description.text,
      "location": location.text,
      "start_date": startDate.value!.toIso8601String(),
      "end_date": endDate.value!.toIso8601String(),
    };
    return Agenda.fromJson(data);
  }

  void addAgenda() async {
    // var response = await agendaP.postData(setAgenda().toJson());
    // outboxAgendas.add(response.body['data']);
    outboxAgendas.add(setAgenda());
    box.write('outbox_agendas', outboxAgendas);
    idCount.value++;
    resetForm();
  }

  void getOutboxAgenda() async {
    // var response = await agendaP.getOutboxData();
    // outboxAgendas = response.body['data'];
    box.write('outbox_agendas', outboxAgendas);
  }

  void getInboxAgenda() async {
    // var response = await agendaP.getInboxData();
    // inboxAgendas = response.body['data'];
    box.write('inbox_agendas', inboxAgendas);
  }

  void editAgenda() async {
    // var response = await agendaP.putData(agenda.value.id, setAgenda().toJson());
    outboxAgendas[outboxAgendas.indexWhere((element) => element.id == agenda.value.id)] = setAgenda();
    box.write('outbox_agendas', outboxAgendas);
    resetForm();
  }

  void deleteAgenda() async {
    // var response = await agendaP.deleteData(agenda.value.id);
    outboxAgendas.removeWhere((element) => element.id == agenda.value.id);
    box.write('outbox_agendas', outboxAgendas);
    resetForm();
  }

  void setForm() {
    name.text = agenda.value.name!;
    description.text = agenda.value.description!;
    location.text = agenda.value.location!;
    startDate.value = agenda.value.startDate;
    endDate.value = agenda.value.endDate;
  }

  void resetForm() {
    name.text = '';
    description.text = '';
    location.text = '';
    startDate.value = null;
    endDate.value = null;
  }
}

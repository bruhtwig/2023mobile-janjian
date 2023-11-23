import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../data/model/user_spare_time.dart';
import '../data/provider/spare_time_provider.dart';

class SpareTimeController extends GetxController {
  Rx<UserSpareTime> userSpareTime = UserSpareTime().obs;
  RxList<UserSpareTime> userSpareTimes = <UserSpareTime>[].obs;

  final idCount = 0.obs;

  final startDate = Rxn<DateTime>();
  final endDate = Rxn<DateTime>();

  final spareTimeP = Get.put(SpareTimeProvider());
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    box.hasData('user_spare_times')
        ? userSpareTimes.value = (box.read('user_spare_times') as List)
            .map((item) => UserSpareTime.fromJson(item)).toList()
        // : getSpareTime();
        : null;
  }

  UserSpareTime setSpareTime() {
    var data = {
      "id": idCount.value,
      "start_date": startDate.value!.toIso8601String(),
      "end_date": endDate.value!.toIso8601String(),
    };
    return UserSpareTime.fromJson(data);
  }

  void addSpareTime() async {
    // var response = await spareTimeP.postData(setSpareTime().toJson());
    // userSpareTimes.add(response.body['data']);
    userSpareTimes.add(setSpareTime());
    box.write('user_spare_times', userSpareTimes);
    idCount.value++;
    resetForm();
  }

  void getSpareTime() async {
    // var response = await spareTimeP.getData();
    // userSpareTimes = response.body['data'];
    box.write('user_spare_times', userSpareTimes);
  }

  void editSpareTime() async {
    // var response = await spareTimeP.patchData(userSpareTime.value.id, setSpareTime().toJson());
    userSpareTimes[userSpareTimes.indexWhere((element) => element.id == userSpareTime.value.id)] = setSpareTime();
    box.write('user_spare_times', userSpareTimes);
    resetForm();
  }

  void deleteSpareTime() async {
    // var response = await spareTimeP.deleteData(userSpareTime.value.id);
    userSpareTimes.removeWhere((element) => element.id == userSpareTime.value.id);
    box.write('user_spare_times', userSpareTimes);
  }

  void setForm() {
    startDate.value = userSpareTime.value.startDate;
    endDate.value = userSpareTime.value.endDate;
  }

  void resetForm() {
    startDate.value = null;
    endDate.value = null;
  }
}

import 'package:get/get.dart';
import 'package:statemixin_tutorial/statemanagement/statemanagement.dart';

class MakeUpController extends GetxController
    with StateMixin<List<MakeupModel>> {
  final provider = Get.find<MakeupModelProvider>();

  Future<void> fetchList() async {
    final Response res = await provider.getMakeupModel();
    if (res.hasError) {
      change(null, status: RxStatus.error(res.statusText));
    } else {
      change(res.body, status: RxStatus.success());
    }
  }

  @override
  void onInit() {
    fetchList();
    super.onInit();
  }
}

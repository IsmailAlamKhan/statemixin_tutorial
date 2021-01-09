import 'package:get/get.dart';

import 'package:statemixin_tutorial/statemanagement/statemanagement.dart';
import 'package:statemixin_tutorial/utills/utils.dart';

class MakeupModelProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = MakeupModel.fromJson;
    httpClient.baseUrl = APIADDRESS;
  }

  Future<Response<List<MakeupModel>>> getMakeupModel() async =>
      await get('?brand=maybelline');
}

///get generate model from http://makeup-api.herokuapp.com/api/v1/products.json

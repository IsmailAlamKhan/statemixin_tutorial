import 'package:get/get.dart';

import 'package:statemixin_tutorial/app/data/models/maas_model.dart';

class MaasProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => Maas.fromJson(map);
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Response<Maas>> getMaas(int id) async => await get('maas/$id');
  Future<Response<Maas>> postMaas(Maas maas) async => await post('maas', maas);
  Future<Response> deleteMaas(int id) async => await delete('maas/$id');
}

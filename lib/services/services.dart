import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../model/model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_rx/get_rx.dart';

class Controller extends GetxController {
  var model = Model().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    method();
  }

  Future<void> method() async {
    try {
      Map<String, String> _header = <String, String>{
        'X-Api-Key': 'f6d646a6c2f2df883ea0cccaa4097358ede98284',
        'Content-Type': 'application/json',
        'Cookie': 'ci_session=pbu3itk1puv3fcmq336qibv4fp5i414l'
      };
      String url =
          'https://www.qubehealth.com/qube_services/api/testservice/getListOfUserFeeling';
      var data =
          json.encode({"user_id": 3206161992, "feeling_date": "15-04-2021"});
      final response =
          await http.post(Uri.parse(url), headers: _header, body: data);

      isLoading.value = false;
      if (response.statusCode == 200) {
        var bod = json.decode(response.body);

        model.value = Model.fromJson(bod);
      }
    } catch (e) {
      isLoading.value = false;
      log(e.toString());

    }
  }
}

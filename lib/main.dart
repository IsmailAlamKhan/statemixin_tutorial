import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemixin_tutorial/statemanagement/statemanagement.dart';

import 'ui/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Getx State Mixin',
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark(),
      initialBinding: BindingsBuilder(() {
        Get.put(MakeupModelProvider());
        Get.put(MakeUpController());
      }),
      home: Home(),
    );
  }
}

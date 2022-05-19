import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
        appBar: AppBar(
          title: Text('Api Get'),
          centerTitle: true,
        ),
        body: controller.obx(
          (state) {
            return ListTile(
              title: Text("${state?.body}"),
              subtitle: Text("${state?.title}"),
              leading: Text("${state?.id}"),
            );
          },
          onLoading: const Center(child: CircularProgressIndicator()),
          onError: (error) => Center(child: Text(error.toString())),
          onEmpty: const Center(child: Text("No Data")),
        ));
  }
}

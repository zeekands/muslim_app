import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/developer_controller.dart';

class DeveloperView extends GetView<DeveloperController> {
  const DeveloperView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penganggung Jawab'),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => const Card(
          child: ListTile(
            title: Text("Welly Eka C"),
          ),
        ),
      ).paddingOnly(top: 20),
    );
  }
}

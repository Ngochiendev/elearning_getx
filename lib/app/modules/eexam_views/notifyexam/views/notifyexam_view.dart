import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notifyexam_controller.dart';

class NotifyexamView extends GetView<NotifyexamController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotifyexamView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'NotifyexamView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

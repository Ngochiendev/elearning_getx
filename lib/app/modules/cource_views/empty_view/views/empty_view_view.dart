import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/empty_view_controller.dart';

class EmptyViewView extends GetView<EmptyViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EmptyViewView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EmptyViewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

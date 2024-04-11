import 'dart:convert';

import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/config/event.dart';
import 'package:elearning/app/data/models/teacher_model.dart';
import 'package:elearning/app/data/models/user_model.dart';
import 'package:elearning/app/services/live_class_service.dart';
import 'package:event_bus/event_bus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'globals.dart' as globals;

class UserService extends GetxService {
  final user = UserModel().obs;
  final teahcer = TeacherModel().obs;
  final eventBus = EventBus();

  Future<void> setCurrentToken(String token) async {
    globals.accessToken = token;
    await GetStorage().write(StorageBox.CurrentToken, token);
  }

  Future<void> setCurrentId(String id) async {
    globals.idUser = id;
    await GetStorage().write(StorageBox.IdUser, id);
  }

  Future<void> setUserNamePass(String username, String password) async {
    await GetStorage().write(StorageBox.CurrentUser, username);
    await GetStorage().write(StorageBox.CurrentPass, password);
  }

  Future<void> setSavePassword(String isSavePassword) async {
    await GetStorage().write(StorageBox.CurrentSaved, isSavePassword);
  }

  Future<void> setSecurePassword(String isSecurePassword) async {
    await GetStorage().write(StorageBox.CurrentSecure, isSecurePassword);
  }

  bool isAuthentication() {
    return globals.accessToken.isNotEmpty;
  }

  void setUsers(UserModel u) {
    user.value = u;
    setCurrentId(u.id ?? "");
    final dataJson = jsonEncode(user.value.toJson());
    StorageBox.dataStorage.write(StorageBox.User, dataJson);
    eventBus.fire(UserChangeEvent(u));
  }

  void setTeacher(TeacherModel t) {
    teahcer.value = t;
    setCurrentId(t.id ?? "");
    final dataJson = jsonEncode(teahcer.value.toJson());
    StorageBox.dataStorage.write(StorageBox.Teacher, dataJson);
    // eventBus.fire(UserChangeEvent(t));
  }

  void signOut() async {
    StorageBox.dataStorage.write(StorageBox.Teacher, null);
    StorageBox.dataStorage.write(StorageBox.User, null);
    // Get.delete<LiveClassService>();
    globals.accessToken = '';
    globals.idUser = '';
    await GetStorage().write(StorageBox.CurrentToken, null);
    await GetStorage().write(StorageBox.IdUser, null);
  }
}

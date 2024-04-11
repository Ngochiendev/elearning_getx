import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:elearning/app/components/app_dialog.dart';
import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_snack_bar.dart';
import 'package:elearning/app/components/multi_dialog.dart';
import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/config/event.dart';
import 'package:elearning/app/data/models/liveclass_models/list_notification.dart';
import 'package:elearning/app/data/models/liveclass_models/message_models.dart';
import 'package:elearning/app/data/models/liveclass_models/room_model.dart';
import 'package:elearning/app/data/models/teacher_model.dart';
import 'package:elearning/app/data/models/user_model.dart';
import 'package:elearning/app/data/providers/liveclass_provider.dart';
import 'package:elearning/app/modules/live_class_pages/live_class_home/components/drop_heart_dialog.dart';
import 'package:elearning/app/modules/live_class_pages/live_class_home/components/require_join_room_multistudent_view.dart';
import 'package:elearning/app/modules/live_class_pages/live_class_home/components/require_join_room_view.dart';
import 'package:elearning/app/modules/live_class_pages/live_class_home/components/roll_call_view.dart';
import 'package:elearning/app/modules/live_class_pages/live_class_home/controllers/live_class_home_controller.dart';
import 'package:elearning/app/modules/live_class_pages/live_class_members/controllers/live_class_members_controller.dart';
import 'package:elearning/app/modules/live_class_pages/live_class_message/controllers/live_class_message_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elearning/app/services/globals.dart' as globals;
// import 'package:socket_io_client/socket_io_client.dart' as IO;

class LiveClassService extends GetxService {
  late SocketIO socket;
  final isConnectedSocket = false.obs;
  final isJoinedRoom = false.obs;
  final isStudentAcceptedJoinRoom = false.obs;
  final userCurrent = UserModel().obs;
  final teachCurrent = TeacherModel().obs;
  final eventBus = EventBus();
  final tokenUser = "".obs;
  final room = RoomModel().obs;
  ChatModel? currentChatting;
  ListNotificationModel? currentNotification;
  UserModel? user;
  final name = "".obs;
  final isCamera = false.obs;
  Timer? timer;
  final isTeacher = false.obs;
  // final idUser = "".obs;
  final listRequireJoinClass = List<ListNotificationModel>.empty(growable: true).obs;
  final members = List<UserModel>.empty(growable: true).obs;
  final listNotis = List<ListNotificationModel>.empty(growable: true).obs;
  final isDisplayMultiAlert = false.obs;
  final isStudentJoined = false.obs;
  final isShowRollCall = false.obs;
  final isShowTurnOnCamera = false.obs;
  final isShowTurnOnMic = false.obs;
  // final isCanceledJoinRoom = false.obs;
  final isTurnOnMic = false.obs;
  GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
  BuildContext? dialogContext;

  checkIsTeacher() {
    isTeacher.value = StorageBox.dataStorage.read<bool>(StorageBox.IsStudent) ?? false;
    //   final value = StorageBox.dataStorage.read<String>(StorageBox.User);
    //   if (value != null) {
    //     final user = jsonDecode(value);
    //     userCurrent.value = UserModel.fromJson(user);
    //   }
    //   final teacher = StorageBox.dataStorage.read<String>(StorageBox.Teacher);
    //   if (teacher != null) {
    //     final teacherValue = jsonDecode(teacher);
    //     teachCurrent.value = TeacherModel.fromJson(teacherValue);
    //   }
    //   globals.idUser = isTeacher.value == false ? userCurrent.value.id ?? "0" : teachCurrent.value.id ?? "0";
  }

  connectSocket() async {
    // disconnectSocket();
    checkIsTeacher();
    final token = globals.accessToken;
    final socketOptions = SocketOptions(
      "http://liveclass-socket.flextech.asia",
      transports: [Transports.webSocket],
      query: {
        "authorization": token,
        "trace_thread": globals.idUser,
      },
    );
    socket = await SocketIOManager().createInstance(socketOptions);
    await socket.connect();
    isConnectedSocket.value = true;
    if (isConnectedSocket.value == true) {
      if (room.value.id == null) {
        return;
      }
      // if (!isJoinedRoom.value) {

      // }
      await joinRoom(room.value.id!);
    }
    socket.on('NOTIFICATION').listen((data) async {
      try {
        Map<String, dynamic> json = new Map<String, dynamic>.from(data[0]);
        print(json);
        currentNotification = ListNotificationModel.fromJson(json);
        if (currentNotification?.roomId != room.value.id) {
          return;
        }
        if (currentNotification != null &&
            currentNotification!.roomId != null &&
            room.value.id != null &&
            currentNotification!.roomId! == room.value.id!) {
          if (currentNotification!.action == "ROLL_CALL" && isTeacher.value == true) {
            return;
          }
          final item = listNotis.firstWhere((element) => element.id == currentNotification!.id,
              orElse: () => ListNotificationModel());
          if (item.id != null) {
            return;
          }
          listNotis.add(currentNotification!);
          eventBus.fire(StudentNotificationChangeEvent(currentNotification));
        } else {
          currentNotification = ListNotificationModel();
          return;
        }
        final idRoom = data[0]["room_id"];
        if (currentNotification!.extraData != null) {
          user = currentNotification!.extraData!.sender;
        }

        switch (currentNotification!.action) {
          case "CLAP":
            if (isStudentJoined.value && isTurnOnMic.value == true) {
              Get.dialog(
                  ActionDialog(
                    name: user?.id == globals.idUser ? "Bạn" : "${user?.firstName ?? ""} ${user?.lastName ?? ""}",
                    icon: "clap",
                    action: "Vỗ tay",
                    time: "1s trước",
                  ),
                  barrierDismissible: false);
              Future.delayed(Duration(seconds: 1), () {
                Get.back();
              });
            }
            break;
          case "HAND_UP":
            if (isStudentJoined.value) {
              Get.dialog(
                  ActionDialog(
                    name: user?.id == globals.idUser ? "Bạn" : "${user?.firstName ?? ""} ${user?.lastName ?? ""}",
                    icon: "handup",
                    action: "Giơ tay",
                    time: "1s trước",
                  ),
                  barrierDismissible: false);
              Future.delayed(Duration(seconds: 1), () {
                Get.back();
              });
            }
            break;
          case "LOVE":
            if (isStudentJoined.value && isTurnOnMic.value == true) {
              Get.dialog(
                  ActionDialog(
                    name: user?.id == globals.idUser ? "Bạn" : "${user?.firstName ?? ""} ${user?.lastName ?? ""}",
                    icon: "heart",
                    action: "Thả tim",
                    time: "1s trước",
                  ),
                  barrierDismissible: false);
              Future.delayed(Duration(seconds: 1), () {
                Get.back();
              });
            }
            break;
          case "LIKE":
            print("LIKE");
            break;
          case "ANGRY":
            print("ANGRY");
            break;
          case "ROLL_CALL":
            print("ROLL_CALL");
            if (isShowRollCall.value) {
              return;
            }
            if (isStudentJoined.value) {
              Get.dialog(
                  RollCallView(
                    idRollcall: idRoom,
                  ),
                  barrierDismissible: false);
              isShowRollCall.value = true;
            }

            // Future.delayed(Duration(seconds: 5), () {
            //   Get.back();
            // });

            break;
          case "REQUEST_TURN_ON_MIC":
            if (isShowTurnOnMic.value) {
              return;
            }
            eventBus.fire(RequestTurnOnMicEvent(true));
            isShowTurnOnMic.value = true;
            print("REQUEST_TURN_ON_MIC");
            break;

          case "REQUEST_TURN_ON_CAMERA":
            if (isShowTurnOnCamera.value) {
              return;
            }
            eventBus.fire(RequestTurnOnCameraEvent(true));
            isShowTurnOnCamera.value = true;
            print("REQUEST_TURN_ON_CAMERA");
            break;

          case "REQUEST_JOIN_ROOM":
            // Get.until((route) => route.isFirst);
            if (isTeacher.value == false) {
              return;
            }
            if (listNotis.length > 0) {
              listRequireJoinClass.value =
                  // ignore: unrelated_type_equality_checks
                  listNotis.where((e) => e.action == "REQUEST_JOIN_ROOM").toList();
              if (listRequireJoinClass.isEmpty) {
                return;
              }
              print("Notifii listttt ${listRequireJoinClass.length}");

              if (listRequireJoinClass.length > 1) {
                if (dialogContext != null) {
                  Navigator.pop(dialogContext!);
                  // dialogContext = context1;
                }
                Get.dialog(
                  RequestJoinRoomMultilStudentView(
                    listNotisRequest: listRequireJoinClass,
                    idRoom: currentNotification!.roomId ?? 0,
                  ),
                  barrierDismissible: false,
                );

                //  Get.close(times)
              } else if (listRequireJoinClass.length == 1) {
                // Get.back(closeOverlays: true);
                // dialogContext = context1;
                showDialog(
                    context: Get.overlayContext!, // <<----
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      dialogContext = context;
                      return RequestJoinRoomView(
                        studentNoti: listRequireJoinClass.first,
                      );
                    });
              }
//----------------------

              // if (listRequireJoinClass.length > 1) {
              //   Get.dialog(
              //
              //       RequestJoinRoomMultilStudentView(
              //
              //     listNotisRequest: listRequireJoinClass,
              //     idRoom: currentNotification!.roomId ?? 0,
              //   ),barrierDismissible: false);
              //   return;
              // } else if (listRequireJoinClass.length == 1) {
              //   Get.back(closeOverlays: true);
              //   Get.dialog(
              //     RequestJoinRoomView(
              //       studentNoti: listRequireJoinClass.first,
              //     ),barrierDismissible: false,
              //   );
              // }
              // final student = listNotis.firstWhere((element) => element.userId == idUserCurrent,
              //     orElse: () => ListNotificationModel());

            }

            print("REQUEST_JOIN_ROOM");
            break;
          case "ACCEPT_JOIN_ROOM":
            print("ACCEPT_JOIN_ROOM");
            await studentJoinRoom();

            break;
          case "ACCEPT":
            print("ACCEPT_STUDENT_JOIN_ROOM");

            break;
          case "CANCEL_JOIN_ROOM":
            print("CANCEL_JOIN_ROOM");
            // if (isCanceledJoinRoom.value == true) {
            //   return;
            // }

            eventBus.fire(CancelRequireEvent(true));
            // isCanceledJoinRoom.value = true;
            Future.delayed(Duration(seconds: 1), () {
              Get.back();
              appSnackbar("Giáo viên đã từ chối tham gia phòng", type: SnackbarType.error);
            });

            break;
          case "VERIFIED_ROLL_CODE":
            print("VERIFIED_ROLL_CODE");
            break;

          case "END_ROOM":
            print("END_ROOM");
            break;

          default:
            print("default");
            break;
        }
      } catch (e) {
        print(e);
      }
    });
    // socket.on('ROOM_CONTROL', ({ action, payload }) => this.handleRoomControl(action, payload));
    socket.on('PUSH_MESSAGE').listen((data) {
      Map<String, dynamic> json = new Map<String, dynamic>.from(data[0]['message']);
      currentChatting = ChatModel.fromJson(json);
      if (currentChatting != null) {
        eventBus.fire(ChatChangeEvent(currentChatting));
      }
    });
    socket.on('ROOM_CONTROL').listen((data) {
      print("data");

      switch (data[0]["action"]) {
        case "MUTE_SELF":
          eventBus.fire(RequestTurnOnMicEvent(false));
          print("REQUEST_TURN_ON_MIC");
          break;
        case "HOST_FORCE_MUTE":
          eventBus.fire(RequestTurnOnCameraEvent(false));
          print("REQUEST_TURN_ON_CAMERA");
          break;
        default:
          print("default");
          break;
      }
    });

    socket.on('ROOM_TRACE').listen((data) async {
      try {
        final id = data[0]["payload"]["user_id"];
        if (id == globals.idUser) {
          await studentJoinRoom();
          return;
        } else {
          return;
        }
      } catch (e) {
        print(e);
      }
    });
    socket.on('ERROR_CONNECTION').listen((data) {
      print(data);
    });
    socket.on('error').listen((event) {
      print(" Error: $event");
    });
  }

  joinRoom(int idroom) async {
    // isJoinedRoom.value = true;

    if (isTeacher.value == false) {
      if (room.value.isParticipated == false) {
        await socket.emit("join-room", [
          {"room_id": idroom}
        ]);
        appSnackbar("Vui lòng đợi giáo viên đồng ý tham gia phòng", type: SnackbarType.error);

        await pushRequestNotification(idroom, "REQUEST_JOIN_ROOM");
        return;
      } else {
        await socket.emit("join-room", [
          {"room_id": idroom}
        ]);
      }
    } else {
      await socket.emit("join-room", [
        {"room_id": idroom}
      ]);
      await getMembersRoom(idroom);

      if (members.length > 0) {
        final list = members;
        final member = members.firstWhere((element) => element.userID == globals.idUser, orElse: () => UserModel());
        isStudentJoined.value = true;
        // Get.until((route) => route.isFirst);
        await Get.toNamed(Routes.LIVE_CLASS_HOME, arguments: {
          "name": name.value,
          "token": tokenUser.value,
          "roomInfor": room.value,
          "idUser": member.id ?? 0,
          "isCamera": isCamera.value
        });
      }
    }
  }

  Future pushRequestNotification(int idRoom, String action) async {
    final response = await LiveClassProvider.instance.pushRequestNotification(idRoom, action);
    if (response.error.isEmpty) {
      final statusCode = response.data['status'];
      if (statusCode != 200) {
        room.value = RoomModel();
        showDialog(
          context: Get.context!,
          builder: (BuildContext context) => dialogAlert(
            context,
            message: "Yêu cầu không thành công, vui lòng thử lại",
          ),
        );
        return;
      }
      if (action == "CLAP") {
        print("CLAPESD");
      }
    } else {
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) => dialogAlert(context, message: "Yêu cầu không thành công, vui lòng thử lại"),
      );
      return;
    }
  }

  Future teacherRollCall(int idRoom) async {
    final listInt = members.map((e) => e.userID).toList();

    final response = await LiveClassProvider.instance.teacherRollCall(listInt, idRoom);
    if (response.error.isEmpty) {
      print("teacherRollCall ${response.data}");
    } else {
      // showDialog(
      //   context: Get.context!,
      //   builder: (BuildContext context) => dialogAlert(
      //     context,
      //     message: "Chấp nhận điểm danh không thành công, vui lòng thử lại",
      //   ),
      // );
      return;
    }
  }

  Future acceptRollCall(int idRollcall) async {
    final response = await LiveClassProvider.instance.acceptRollCall(idRollcall);
    if (response.error.isEmpty) {
      print("idRollcall");
    } else {
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) => dialogAlert(
          context,
          message: "Chấp nhận điểm danh không thành công, vui lòng thử lại",
        ),
      );
      return;
    }
  }

  Future acceptJoinRoom(int idRoom, String type, {String typeB = "SINGER"}) async {
    final listNoti = listNotis.where((e) => e.action == "REQUEST_JOIN_ROOM").toList();
    final response = await LiveClassProvider.instance.handleJoinRoom(idRoom, type);
    await getMembersRoom(room.value.id!);
    if (response.error.isEmpty) {
      final statusCode = response.data['status'];
      print(response.data);
      if (listNoti.length == 1) {
        listNotis.removeWhere((e) => e.action == "REQUEST_JOIN_ROOM");
        Get.find<LiveClassHomeController>().listRequireJoinClass.value =
            listNotis.where((e) => e.action == "REQUEST_JOIN_ROOM").toList();
      } else if (typeB == "CANCELMULTI") {
        listNotis.removeWhere((e) => e.action == "REQUEST_JOIN_ROOM");
        Get.find<LiveClassHomeController>().listRequireJoinClass.value =
            listNotis.where((e) => e.action == "REQUEST_JOIN_ROOM").toList();
      }
      print(listNotis.length);

      if (statusCode != 200) {
        room.value = RoomModel();
        showDialog(
          context: Get.context!,
          builder: (BuildContext context) => dialogAlert(
            context,
            message: "Chấp nhận tham gia phòng không thành công, vui lòng thử lại",
          ),
        );
        return;
      }
    } else {
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) => dialogAlert(
          context,
          message: "Hệ thống bận 2",
        ),
      );
      return;
    }
  }

  Future getListNotification(int id) async {
    listNotis.clear();
    listRequireJoinClass.clear();
    final response = await LiveClassProvider.instance.getListNotification(id);
    if (response.error.isEmpty) {
      for (var item in response.data['data']) {
        listNotis.add(ListNotificationModel.fromJson(item));
      }
      return listNotis;
    }
  }

  studentJoinRoom() async {
    if (isStudentJoined.value == true) {
      return;
    }

    await getMembersRoom(room.value.id!);
    if (members.length > 0) {
      isStudentJoined.value = true;

      final member = members.firstWhere((element) => element.userID == globals.idUser, orElse: () => UserModel());
      print(member.userID);

      // Get.until((route) => route.isFirst);
      await Get.toNamed(Routes.LIVE_CLASS_HOME, arguments: {
        "name": name.value,
        "token": tokenUser.value,
        "roomInfor": room.value,
        "idUser": member.id ?? 0,
        "isCamera": isCamera.value
      });
      return;
    } else {
      return;
    }
  }

  getMembersRoom(int id) async {
    members.clear();
    final response = await LiveClassProvider.instance.getMembersRoom(id);
    if (response.error.isEmpty) {
      for (var data in response.data["data"]) {
        members.add(UserModel.fromJson(data));
      }
    }
  }

  disconnectSocket() async {
    isConnectedSocket.value = false;
    isStudentJoined.value = false;
    // isJoinedRoom.value = false;
    // isCanceledJoinRoom.value = false;
    socket.emit('leave-room', [
      {'room_id': room.value.id ?? 0}
    ]);
    timer?.cancel();
    if (socket != null && socket.id > 0) {
      await SocketIOManager().clearInstance(socket);
    }

    // if (kDebugMode) {
    //   socket.close();
    //   socket.clearListeners();
    //   socket.dispose();
    // } else {
    //   if (Platform.isAndroid) {
    //     socket.disconnect();
    //     socket.close();
    //     socket.dispose();
    //   } else if (Platform.isIOS) {
    //     socket.dispose();
    //     socket.disconnect();
    //   }
    // }
  }
}


// ==================================================
//   connectSocket() async {
//     await disconnectSocket();
//     checkIsTeacher();
//     final token = globals.accessToken;
//     // final idUser = globals.idUser;
//     print("token socket: $token");
//     socket = IO.io(
//         'http://liveclass-socket.flextech.asia',
//         IO.OptionBuilder()
//             .setTransports(['websocket']) // for Flutter or Dart VM
//             .disableAutoConnect()
//             // .setExtraHeaders({'authorization': globals.accessToken, 'trace_thread': userCurrent.value.id})
//             .setQuery({
//               "authorization": token,
//               "trace_thread": globals.idUser,
//             })
//             .build());
//     socket.connect();

//     socket.onDisconnect((_) {
//       print('disconnect');
//     });
//     // var nsp = io.of('/some');
//     socket.onConnect((_) async {
//       isConnectedSocket.value = true;
//       print('connected');
//       if (room.value.id == null) {
//         return;
//       }
//       if (!isJoinedRoom.value) {
//         await joinRoom(room.value.id!);
//       }

//       //  socket.emit('msg', 'test');
//     });
//     socket.on('NOTIFICATION', (data) async {
//       Map<String, dynamic> json = new Map<String, dynamic>.from(data);
//       print(json);
//       currentNotification = ListNotificationModel.fromJson(json);
//       if (currentNotification?.roomId != room.value.id) {
//         return;
//       }
//       if (currentNotification != null &&
//           currentNotification!.roomId != null &&
//           room.value.id != null &&
//           currentNotification!.roomId! == room.value.id!) {
//         if (currentNotification!.action == "ROLL_CALL" && isTeacher.value == true) {
//           return;
//         }
//         final item = listNotis.firstWhere((element) => element.id == currentNotification!.id,
//             orElse: () => ListNotificationModel());
//         if (item.id != null) {
//           return;
//         }
//         listNotis.add(currentNotification!);
//         eventBus.fire(StudentNotificationChangeEvent(currentNotification));
//       } else {
//         currentNotification = ListNotificationModel();
//         return;
//       }
//       final idRoom = data["room_id"];
//       if (currentNotification!.extraData != null) {
//         user = currentNotification!.extraData!.sender;
//       }

//       switch (currentNotification!.action) {
//         case "CLAP":
//           if (isStudentJoined.value && isTurnOnMic.value == true) {
//             Get.dialog(
//                 ActionDialog(
//                   name: user?.id == globals.idUser ? "Bạn" : "${user?.firstName ?? ""} ${user?.lastName ?? ""}",
//                   icon: "clap",
//                   action: "Vỗ tay",
//                   time: "1s trước",
//                 ),
//                 barrierDismissible: false);
//             Future.delayed(Duration(seconds: 1), () {
//               Get.back();
//             });
//           }
//           break;
//         case "HAND_UP":
//           if (isStudentJoined.value) {
//             Get.dialog(
//                 ActionDialog(
//                   name: user?.id == globals.idUser ? "Bạn" : "${user?.firstName ?? ""} ${user?.lastName ?? ""}",
//                   icon: "handup",
//                   action: "Giơ tay",
//                   time: "1s trước",
//                 ),
//                 barrierDismissible: false);
//             Future.delayed(Duration(seconds: 1), () {
//               Get.back();
//             });
//           }
//           break;
//         case "LOVE":
//           if (isStudentJoined.value && isTurnOnMic.value == true) {
//             Get.dialog(
//                 ActionDialog(
//                   name: user?.id == globals.idUser ? "Bạn" : "${user?.firstName ?? ""} ${user?.lastName ?? ""}",
//                   icon: "heart",
//                   action: "Thả tim",
//                   time: "1s trước",
//                 ),
//                 barrierDismissible: false);
//             Future.delayed(Duration(seconds: 1), () {
//               Get.back();
//             });
//           }
//           break;
//         case "LIKE":
//           print("LIKE");
//           break;
//         case "ANGRY":
//           print("ANGRY");
//           break;
//         case "ROLL_CALL":
//           print("ROLL_CALL");
//           if (isShowRollCall.value) {
//             return;
//           }
//           if (isStudentJoined.value) {
//             Get.dialog(
//                 RollCallView(
//                   idRollcall: idRoom,
//                 ),
//                 barrierDismissible: false);
//             isShowRollCall.value = true;
//           }

//           // Future.delayed(Duration(seconds: 5), () {
//           //   Get.back();
//           // });

//           break;
//         case "REQUEST_TURN_ON_MIC":
//           if (isShowTurnOnMic.value) {
//             return;
//           }
//           eventBus.fire(RequestTurnOnMicEvent(true));
//           isShowTurnOnMic.value = true;
//           print("REQUEST_TURN_ON_MIC");
//           break;

//         case "REQUEST_TURN_ON_CAMERA":
//           if (isShowTurnOnCamera.value) {
//             return;
//           }
//           eventBus.fire(RequestTurnOnCameraEvent(true));
//           isShowTurnOnCamera.value = true;
//           print("REQUEST_TURN_ON_CAMERA");
//           break;

//         case "REQUEST_JOIN_ROOM":
//           // Get.until((route) => route.isFirst);
//           if (isTeacher.value == false) {
//             return;
//           }
//           if (listNotis.length > 0) {
//             listRequireJoinClass.value =
//                 // ignore: unrelated_type_equality_checks
//                 listNotis.where((e) => e.action == "REQUEST_JOIN_ROOM").toList();
//             if (listRequireJoinClass.isEmpty) {
//               return;
//             }
//             print("Notifii listttt ${listRequireJoinClass.length}");

//             if (listRequireJoinClass.length > 1) {
//               if (dialogContext != null) {
//                 Navigator.pop(dialogContext!);
//                 // dialogContext = context1;
//               }
//               Get.dialog(
//                 RequestJoinRoomMultilStudentView(
//                   listNotisRequest: listRequireJoinClass,
//                   idRoom: currentNotification!.roomId ?? 0,
//                 ),
//                 barrierDismissible: false,
//               );

//               //  Get.close(times)
//             } else if (listRequireJoinClass.length == 1) {
//               // Get.back(closeOverlays: true);
//               // dialogContext = context1;
//               showDialog(
//                   context: Get.overlayContext!, // <<----
//                   barrierDismissible: false,
//                   builder: (BuildContext context) {
//                     dialogContext = context;
//                     return RequestJoinRoomView(
//                       studentNoti: listRequireJoinClass.first,
//                     );
//                   });
//             }
// //----------------------

//             // if (listRequireJoinClass.length > 1) {
//             //   Get.dialog(
//             //
//             //       RequestJoinRoomMultilStudentView(
//             //
//             //     listNotisRequest: listRequireJoinClass,
//             //     idRoom: currentNotification!.roomId ?? 0,
//             //   ),barrierDismissible: false);
//             //   return;
//             // } else if (listRequireJoinClass.length == 1) {
//             //   Get.back(closeOverlays: true);
//             //   Get.dialog(
//             //     RequestJoinRoomView(
//             //       studentNoti: listRequireJoinClass.first,
//             //     ),barrierDismissible: false,
//             //   );
//             // }
//             // final student = listNotis.firstWhere((element) => element.userId == idUserCurrent,
//             //     orElse: () => ListNotificationModel());

//           }

//           print("REQUEST_JOIN_ROOM");
//           break;
//         case "ACCEPT_JOIN_ROOM":
//           print("ACCEPT_JOIN_ROOM");
//           await studentJoinRoom();

//           break;
//         case "ACCEPT":
//           print("ACCEPT_STUDENT_JOIN_ROOM");

//           break;
//         case "CANCEL_JOIN_ROOM":
//           print("CANCEL_JOIN_ROOM");
//           if (isCanceledJoinRoom.value == true) {
//             return;
//           }

//           eventBus.fire(CancelRequireEvent(true));
//           isCanceledJoinRoom.value = true;
//           Future.delayed(Duration(seconds: 1), () {
//             appSnackbar("Giáo viên đã từ chối tham gia phòng", type: SnackbarType.error);
//           });
//           break;
//         case "VERIFIED_ROLL_CODE":
//           print("VERIFIED_ROLL_CODE");
//           break;

//         case "END_ROOM":
//           print("END_ROOM");
//           break;

//         default:
//           print("default");
//           break;
//       }
//     });
//     // socket.on('ROOM_CONTROL', ({ action, payload }) => this.handleRoomControl(action, payload));
//     socket.on('PUSH_MESSAGE', (data) {
//       Map<String, dynamic> json = new Map<String, dynamic>.from(data['message']);
//       currentChatting = ChatModel.fromJson(json);
//       if (currentChatting != null) {
//         eventBus.fire(ChatChangeEvent(currentChatting));
//       }
//     });
//     socket.on('ROOM_CONTROL', (data) {
//       print("data");

//       switch (data["action"]) {
//         case "MUTE_SELF":
//           eventBus.fire(RequestTurnOnMicEvent(false));
//           print("REQUEST_TURN_ON_MIC");
//           break;
//         case "HOST_FORCE_MUTE":
//           eventBus.fire(RequestTurnOnCameraEvent(false));
//           print("REQUEST_TURN_ON_CAMERA");
//           break;
//         default:
//           print("default");
//           break;
//       }
//     });

//     socket.on('ROOM_TRACE', (data) async {
//       final id = data["payload"]["user_id"];
//       if (id == globals.idUser) {
//         await studentJoinRoom();
//         return;
//       } else {
//         return;
//       }
//     });
//     socket.on('ERROR_CONNECTION', (err) {
//       // Get.find<LiveClassMessageController>().buttonState.value =
//       //     AppElevatedButtonState.active;
//       print(err);
//     });
//     socket.onError((data) {
//       print(data);
//     });
//   }
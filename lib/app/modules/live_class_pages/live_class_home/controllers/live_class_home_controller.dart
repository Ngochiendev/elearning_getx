import 'dart:async';

import 'package:agora_rtc_engine/rtc_channel.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:elearning/app/components/app_dialog.dart';
import 'package:elearning/app/components/app_snack_bar.dart';
import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/config/event.dart';
import 'package:elearning/app/data/models/liveclass_models/list_notification.dart';
import 'package:elearning/app/data/models/liveclass_models/room_model.dart';
import 'package:elearning/app/data/models/user_model.dart';
import 'package:elearning/app/data/providers/liveclass_provider.dart';
import 'package:elearning/app/modules/live_class_pages/live_class_home/components/request_turnon_camera_dialog.dart';
import 'package:elearning/app/modules/live_class_pages/live_class_home/components/request_turnon_mic_dialog.dart';
import 'package:elearning/app/modules/live_class_pages/live_class_home/components/require_join_room_multistudent_view.dart';
import 'package:elearning/app/modules/live_class_pages/live_class_home/components/require_join_room_view.dart';
import 'package:elearning/app/services/live_class_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:agora_rtm/agora_rtm.dart';
import 'package:permission_handler/permission_handler.dart';

enum ActionNotification {
  CLAP,
  HAND_UP,
  LOVE,
  LIKE,
  ANGRY,
  ROLL_CALL,
  REQUEST_TURN_ON_MIC,
  REQUEST_JOIN_ROOM,
  ACCEPT_JOIN_ROOM,
  CANCEL_JOIN_ROOM,
  VERIFIED_ROLL_CODE,
  REQUEST_TURN_ON_CAMERA,
  END_ROOM
}

class RemoteMicro {
  StatefulWidget stateFull;
  bool? mutedMicro;
  RemoteMicro({required this.stateFull, this.mutedMicro});
}

// class UserLiveClass {
//   int? idUser;
//   bool? mutedMicro;
//   bool? isHandup;
//   bool? mutedVideo;
//   UserLiveClass({this.idUser, this.isHandup, this.mutedMicro, this.mutedVideo});
// }

class LiveClassHomeController extends GetxController {
  //TODO: Implement LiveClassHomeController
  final idUser = 0.obs;
  final channel = "".obs;
  final token = "".obs;
  final users = <int>[].obs;
  var myID = 0;
  final listUserLives = List<UserModel>.empty(growable: true).obs;
  final members = List<UserModel>.empty(growable: true).obs;
  final roomMember = UserModel().obs;
  final memberFirstRoom = UserModel().obs;
  final muted = false.obs;
  final localUserJoined = false.obs;
  final hasVideo = true.obs;
  final room = RoomModel().obs;
  final listNotis = List<ListNotificationModel>.empty(growable: true).obs;
  final listRequireJoinClass = List<ListNotificationModel>.empty(growable: true).obs;
  final listHandUp = List<ListNotificationModel>.empty(growable: true).obs;
  final listReadHandUp = List<ListNotificationModel>.empty(growable: true).obs;
  final hasNotification = (Get.find<LiveClassService>().currentNotification != null).obs;
  final isAcceptJoinRoom = false.obs;
  final isTeach = false.obs;
  final remoteUidFirstSelected = 0.obs;
  final remoteUidSecondSelected = 0.obs;
  final remoteUidThirdSelected = 0.obs;
  final idUserOffline = 0.obs;
  final mutedAllRemote = false.obs;
  final isActiveMicro = true.obs;
  // final isActiveCamera = true.obs;
  final isHandown = false.obs;
  // final members = List<UserModel>.empty(growable: true).obs;
  final isVisibleBottom = true.obs;
  GlobalKey<ScaffoldState>? scaffoldKey;
  final PageController pageController = PageController();
  final itemList = [1, 2, 3];

  RtcEngine? _engine;
  // AgoraRtmClient? rtmClient;
  // AgoraRtmChannel? rtmChannel;
  RtcChannel? rtcChannel;
  final count = 0.obs;
  Timer? timer;
  int _start = 10;

  @override
  void onInit() async {
    super.onInit();
    scaffoldKey = GlobalKey<ScaffoldState>();
    startTimer();
    Get.find<LiveClassService>().eventBus.on<StudentNotificationChangeEvent>().listen((event) async {
      hasNotification.value = event.notification != null;
      if (event.notification != null) {
        listNotis.add(event.notification!);
        listRequireJoinClass.value =
            // ignore: unrelated_type_equality_checks
            listNotis.where((e) => e.action == "REQUEST_JOIN_ROOM").toList();
        update();
      }
    });
    Get.find<LiveClassService>().eventBus.on<RequestTurnOnMicEvent>().listen((event) async {
      if (event.isOnMic != null) {
        if (event.isOnMic == true) {
          Get.dialog(
              RequestTurnOnMicDialog(
                  // studentNoti: listRequireJoinClass.first,
                  ),
              barrierDismissible: false);
        } else {
          await tapMicro();
          isActiveMicro.value = true;
          Get.find<LiveClassService>().isShowTurnOnMic.value = false;
          appSnackbar("Giáo viên đã tắt Micro bạn", type: SnackbarType.error);
        }
      }
    });
    Get.find<LiveClassService>().eventBus.on<RequestTurnOnCameraEvent>().listen((event) async {
      if (event.isOnCamera != null) {
        if (event.isOnCamera == true) {
          Get.dialog(
              RequestTurnOnCameraDialog(
                  // studentNoti: listRequireJoinClass.first,
                  ),
              barrierDismissible: false);
        } else {
          await tapVideo();
          // isActiveCamera.value = true;
          appSnackbar("Giáo viên đã tắt Camera bạn", type: SnackbarType.error);
        }
      }
    });
  }

  @override
  void onReady() async {
    super.onReady();
    isTeach.value = StorageBox.dataStorage.read<bool>(StorageBox.IsStudent) ?? false;
    channel.value = Get.arguments["name"] ?? "";
    token.value = Get.arguments["token"] ?? "";
    room.value = Get.arguments["roomInfor"] ?? "";
    idUser.value = Get.arguments["idUser"] ?? "";
    hasVideo.value = Get.arguments["isCamera"] ?? "";

    await initAgora();
    await getListNotification(room.value.id ?? 0);
    getListHandUp(room.value.id ?? 0);
    members.value = Get.find<LiveClassService>().members;
    Get.find<LiveClassService>().eventBus.on<RequestJoinRoom>().listen((event) async {
      update();
    });
  }

  @override
  void onClose() {
    super.onClose();
    // if (users.length > 0) {
    //   users.clear();
    // }

    // destroy sdk
    _engine?.leaveChannel();
    _engine?.destroy();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          isVisibleBottom.value = !isVisibleBottom.value;
          timer.cancel();
        } else {
          _start--;
        }
      },
    );
  }

  tapBody() {
    isVisibleBottom.value = !isVisibleBottom.value;
    _start = 10;
    startTimer();
  }

  void oncloseDialog() {
    Get.back();
  }

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = await RtcEngine.create(AgoraLiveClass.APP_ID);
    // _engine
    await _engine?.enableVideo();
    await _engine?.enableAudio();
    await _engine?.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine?.setClientRole(ClientRole.Broadcaster);
    await _engine?.muteLocalVideoStream(hasVideo.value);
    await _engine?.enableAudioVolumeIndication(10, 3, true);

    // await _engine?.enableLocalVideo(true);
    // await _engine?.setRemoteSubscribeFallbackOption (true);
    if (Get.find<LiveClassService>().isTeacher.value == false) {
      muted.value = true;
      await _engine?.muteLocalAudioStream(muted.value);
    }

    _engine?.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          localUserJoined.value = true;
          roomMember.value.id = uid;
          // listUserLives.add(UserModel(id: uid, mutedMicro: false, mutedVideo: false));
          print("local user $uid joined");
        },
        userJoined: (int uid, int elapsed) async {
          print("remote user $uid joined");
          await getMembersRoom(room.value.id ?? 0);
          users.add(uid);
          listUserLives.add(UserModel(id: uid, mutedMicro: false, mutedVideo: false));
          await Get.find<LiveClassService>().getMembersRoom(room.value.id ?? 0);
        },
        audioPublishStateChanged: (channel, oldState, newState, elapseSinceLastState) {
          print(channel);
          print(oldState);
          print(newState);
        },
        leaveChannel: (stats) {
          users.clear();
          listUserLives.clear();
        },
        audioVolumeIndication: (List activeSpeaker, int volumn) {
          if (volumn > 10) {
            if (activeSpeaker.length > 0) {
              final userSpeaking = activeSpeaker.first;
              if (userSpeaking.uid > 0) {
                final user =
                    listUserLives.firstWhere((element) => element.id == userSpeaking.uid, orElse: () => UserModel());
                listUserLives.remove(user);
                listUserLives.insert(0, user);
              }
            }
          }
          // print(activeSpeaker);
          // print(uid);
        },
        activeSpeaker: (int uid) {
          print(uid);
        },
        // userSpeakers: (List speakers, int total) {

        // },
        userMuteAudio: (int uid, bool? muted) {
          final user = listUserLives.firstWhere((element) => element.id == uid, orElse: () => UserModel());
          final member = members.firstWhere((element) => element.id == uid, orElse: () => UserModel());
          listUserLives.remove(user);
          members.remove(member);
          user.id = uid;
          user.mutedMicro = muted ?? false;
          member.id = uid;
          member.mutedMicro = muted ?? false;
          listUserLives.add(user);
          members.add(member);

          update();
          print(uid);
        },
        userMuteVideo: (int uid, bool? muted) {
          final user = listUserLives.firstWhere((element) => element.id == uid, orElse: () => UserModel());
          final member = members.firstWhere((element) => element.id == uid, orElse: () => UserModel());
          listUserLives.remove(user);
          members.remove(member);
          user.id = uid;
          user.mutedVideo = muted ?? false;
          member.id = uid;
          member.mutedVideo = muted ?? false;
          listUserLives.add(user);
          members.add(member);

          update();
          print(uid);
        },
        userOffline: (int uid, UserOfflineReason reason) {
          print("remote user $uid left channel");
          users.remove(uid);
          final user = listUserLives.firstWhere((element) => element.id == uid, orElse: () => UserModel());

          listUserLives.remove(user);

          idUserOffline.value = uid;
        },
      ),
    );

    await _engine?.joinChannel(token.value, channel.value, "", idUser.value);
  }

  Future getListNotification(int id) async {
    listNotis.clear();
    listRequireJoinClass.clear();
    final response = await LiveClassProvider.instance.getListNotification(id);
    if (response.error.isEmpty) {
      for (var item in response.data['data']) {
        listNotis.add(ListNotificationModel.fromJson(item));
      }
      listRequireJoinClass.value =
          // ignore: unrelated_type_equality_checks
          listNotis.where((e) => e.action == "REQUEST_JOIN_ROOM").toList();
      update();
    }
  }

  Future getListHandUp(int id) async {
    listHandUp.clear();
    final response = await LiveClassProvider.instance.getListHandUp(id);
    if (response.error.isEmpty) {
      for (var item in response.data['data']) {
        listHandUp.add(ListNotificationModel.fromJson(item));
      }
      listReadHandUp.value = listHandUp.where((e) => e.read == false).toList();

      update();
    }
  }

  void onToggleMute() async {
    if (Get.find<LiveClassService>().isTeacher.value == false && muted.value == false) {
      return;
    }
    muted.value = !muted.value;

    await _engine?.muteLocalAudioStream(muted.value);
    roomMember.value.mutedMicro = muted.value;
  }

  tapMicro() async {
    muted.value = !muted.value;

    await _engine?.muteLocalAudioStream(muted.value);
    roomMember.value.mutedMicro = muted.value;
    muted.value == true
        ? Get.find<LiveClassService>().isTurnOnMic.value = false
        : Get.find<LiveClassService>().isTurnOnMic.value = true;
  }

  void onSwitchCamera() async {
    await _engine?.switchCamera();
  }

  // onTapDelete() async {
  //   if (listReadHandUp != null && listReadHandUp.length > 0) {
  //     final data = listReadHandUp.first;
  //     final listDown = listReadHandUp.map((element) => "${element.id}").toList();
  //     final response = await LiveClassProvider.instance.deleteHandDown(data.roomId ?? 0, listDown);
  //     if (response.error.isEmpty) {
  //       isHandown.value = true;
  //       update();
  //     }
  //   }
  // }

  tapVideo() async {
    // if (isActiveCamera.value == true) {
    //   return;
    // }
    hasVideo.value = !hasVideo.value;
    await _engine?.muteLocalVideoStream(hasVideo.value);
    roomMember.value.mutedVideo = hasVideo.value;
  }

  onChangePage(int id) {
    switch (id) {
      case 0:
        remoteUidFirstSelected.value = remoteUidSecondSelected.value;
        remoteUidSecondSelected.value = 0;
        break;
      case 1:
        if (listUserLives.length > 0) {
          memberFirstRoom.value = listUserLives.first;
        }
        remoteUidSecondSelected.value = remoteUidFirstSelected.value;

        remoteUidFirstSelected.value = 0;
        break;
      default:
        remoteUidFirstSelected.value = remoteUidSecondSelected.value;
        remoteUidSecondSelected.value = 0;
        break;
    }

    // if (listUserLives.length == 0) {
    //   return;
    // }
  }

  getMembersRoom(int id) async {
    members.clear();
    final response = await LiveClassProvider.instance.getMembersRoom(id);
    if (response.error.isEmpty) {
      for (var data in response.data["data"]) {
        members.add(UserModel.fromJson(data));
      }
      update();
    }
  }
}

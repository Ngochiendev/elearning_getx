import 'dart:io';

import 'package:async/async.dart';
import 'package:elearning/app/data/models/liveclass_models/upload_image_model.dart';
import 'package:elearning/app/data/providers/api_result.dart';
import 'package:elearning/app/data/providers/base_provider.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class LiveClassProvider extends BaseProvider {
  static final LiveClassProvider instance = LiveClassProvider._internal();
  factory LiveClassProvider() => instance;
  LiveClassProvider._internal() {
    initProvider("BASE_API_LIVECLASS");
  }

  Future<ApiResult> getRoom(int idRoom) async => await GET('room?id=$idRoom');
  Future<ApiResult> getMembersRoom(int idRoom) async => await GET('room/members?room_id=$idRoom');
  Future<ApiResult> deleteAllNotification() async => await DELETE('notification/all', null);
  Future<ApiResult> deleteHandDown(int idRoom, List? listHandDown) async =>
      await POST('notification/room/hand-down', {"room_id": idRoom, "notification_ids": listHandDown});
  Future<ApiResult> getChats(int idConversation) async =>
      await GET('conversation/{conversation_id}/messages?conversation_id=r-$idConversation');
  Future<ApiResult> sendMessgae(int? idConversation, String? msg, List<UploadImageModel>? images) async {
    final list = [];
    if (images != null && images.length > 0) {
      for (var data in images) {
        list.add({"id": data.id, "type": "image", "url": data.url});
      }
    }
    return await POST('conversation/r-$idConversation/message', {"text": msg, "attachments": list});
  }

  Future<ApiResult> getUserRtcToken(int idRoom) async => await POST('agora/room/user-rtc-token', {
        "room_id": idRoom,
      });
  Future<ApiResult> getHostRtcToken(int idRoom) async => await POST('agora/room/host-rtc-token', {
        "room_id": idRoom,
      });
  Future<ApiResult> getListNotification(int idRoom) async => await GET('notification/room/list?room_id=$idRoom');
  Future<ApiResult> getListHandUp(int idRoom) async => await GET('notification/room/hand-up?room_id=$idRoom');

  Future<ApiResult> teacherPushRequestNotification(int idRoom, String action, String? userId) async =>
      await POST('notification/room', {"room_id": idRoom, "user_id": userId, "action": action});
  Future<ApiResult> pushRequestNotification(int idRoom, String action) async =>
      await POST('notification/room', {"room_id": idRoom, "action": action});
  Future<ApiResult> roomControl(int idRoom, String action, String userId) async => await POST('room/control', {
        "room_id": idRoom,
        "payload": {"user_id": userId},
        "action": action,
      });
  Future<ApiResult> teacherRollCall(List? id, int roomId) async =>
      await POST('room/roll-call', {"room_id": roomId, "attendant_user_ids": id});
  Future<ApiResult> acceptRollCall(int id) async => await POST('room/verify-roll-call', {"roll_call_id": id});
  Future<ApiResult> handleJoinRoom(int idRoom, String type) async =>
      await POST('notification/room/join-handle', {"id": idRoom, "type": type});
  Future<ApiResult> uploadImageChat(List files) async {
    final forms = FormData({});
    List<MultipartFile> newList = [];
    for (var image in files) {
      forms.files.add(MapEntry(
        "files",
        MultipartFile(File(image.path), filename: basename(image.path)),
      ));
    }

    return await POST('file-storage/file', forms);
  }
}

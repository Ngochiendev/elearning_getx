import 'package:elearning/app/data/models/liveclass_models/list_notification.dart';
import 'package:elearning/app/data/models/liveclass_models/message_models.dart';
import 'package:elearning/app/data/models/user_model.dart';
import 'package:elearning/app/data/models/minigame_content_model.dart';

enum MiniGameFlipCardState { open, close, lock, reset }

class EventMinigameFlipCardState {
  MiniGameFlipCardState state;
  Sets value;

  EventMinigameFlipCardState(this.state, this.value);
}

enum MinigameChooseOptionState { open, close, lock, reset }

class EventMinigameChooseOptionState {
  MinigameChooseOptionState state;
  Sets value;

  EventMinigameChooseOptionState(this.state, this.value);
}

class UserChangeEvent {
  UserModel user;
  UserChangeEvent(this.user);
}

class ChatChangeEvent {
  ChatModel? chat;
  ChatChangeEvent(this.chat);
}

class CancelRequireEvent {
  bool? isCannceled;
  CancelRequireEvent(this.isCannceled);
}

class RequestTurnOnMicEvent {
  bool? isOnMic;
  RequestTurnOnMicEvent(this.isOnMic);
}

class RequestTurnOnCameraEvent {
  bool? isOnCamera;
  RequestTurnOnCameraEvent(this.isOnCamera);
}

class StudentNotificationChangeEvent {
  ListNotificationModel? notification;
  StudentNotificationChangeEvent(this.notification);
}

class RequestJoinRoom {
  bool? isRequest;
  RequestJoinRoom(this.isRequest);
}

// class NotificationEvent {
//   ActionNotification state;
//   bool value;
//   NotificationEvent(this.state, this.value);
// }

import 'package:get_storage/get_storage.dart';

class ErrorMessage {
  static const INVALID_LOGIN_CREDENTIALS = "INVALID_LOGIN_CREDENTIALS";
  static const INVALID_OR_EXPIRED_TOKEN = "INVALID_OR_EXPIRED_TOKEN";
}

/// sentry dns
const String SENTRY_DNS = '';
const String ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVXWYZ';

class AgoraLiveClass {
  AgoraLiveClass._();
  static const String APP_ID = "5631fe7af4c145e8936d4641698215ca";
}

/// storage
class StorageBox {
  StorageBox._();
  static GetStorage dataStorage = GetStorage();
  static const String DBVersion = 'DBVersion';
  static const String User = 'User';
  static String isExpired = '';
  static const String Teacher = 'Teacher';
  static const String IdUser = 'IdUser';
  static const String SearchHistory = 'SearchHistory';
  static const String IsStudent = 'IsTeacher';
  static const String ShowOnboarding = 'ShowOnboarding';
  static const String CurrentToken = 'CurrentToken';
  static const String CurrentPhone = 'CurrentPhone';
  static const String CurrentUser = 'CurrentPhone';
  static const String CurrentPass = 'CurrentPass';
  static const String CurrentSaved = 'CurrentSaved';
  static const String CurrentSecure = 'CurrentSecure';
}

// exercise & minigame
class ExerciseTypes {
  ExerciseTypes._();
  static const String miniGame = 'miniGame';
  static const String question = 'question';
}

class QuestionTypes {
  QuestionTypes._();
  static const String leadingQuestion = 'leadingQuestion';
  static const String singleChoice = 'singleChoice';
  static const String multipleChoice = 'multipleChoice';
  static const String fillInTheBlank = 'fillInTheBlank';
  static const String essay = 'essay';
  static const String speaking = 'speaking';
  static const String textAnswer = 'textAnswer';
}

class MiniGameType {
  MiniGameType._();
  static const String reorder = 'reorder';
  static const String textAnswer = 'textAnswer';
  static const String listening = 'listening';
  static const String matchingHidden = 'matchingHidden';
  static const String dragAndDrop = 'dragAndDrop';
  static const String matchingShow = 'matchingShow';
}

enum ExerciseState { pending, correct, wrong }

class PaymentMethod {
  PaymentMethod._();
  static const String wallet = 'wallet';
  static const String banking = 'banking';
  static const String vnpay = 'vnpay';
}

class BalanceType {
  BalanceType._();
  static const String VND = 'VND';
  static const String USD = 'USD';
  static const String EPOINT = 'EPOINT';
}

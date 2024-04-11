import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:html/parser.dart';
import 'package:logger/logger.dart';
import 'dart:ui' as ui;
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/services.dart';

String numberFormat(int num) {
  final formatter = NumberFormat("#,###");
  return formatter.format(num);
}

String baseUrlImage =
    "https://flextech-dev.s3-ap-southeast-1.amazonaws.com/images/content/";

bool checkFormat(String regex, String checkedString) {
  return RegExp(regex).hasMatch(checkedString);
}

String fullStringTimeFormat(String? stringTime) {
  final date = DateTime.tryParse(stringTime ?? '');
  return date != null ? DateFormat('dd/MM/yyyy').format(date) : '';
}

String fullStringTimeFormatCetificate(String? stringTime) {
  final date = DateTime.tryParse(stringTime ?? '');
  return date != null ? DateFormat('dd/MM/yy').format(date) : '';
}

String fullStringTimerFormat(String? stringTime) {
  final date = DateTime.tryParse(stringTime ?? '');
  return date != null ? DateFormat('hh:mm').format(date) : '';
}

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

int checkTypeButton(String type) {
  if (type == "video") {
    return 1;
  } else if (type == "audio") {
    return 2;
  } else if (type == "audio_text") {
    return 3;
  } else if (type == "html") {
    return 4;
  }
  return 0;
}

String fullStringTimerAMPMFormat(String? stringTime) {
  final date = DateTime.tryParse(stringTime ?? '');
  var dateParse;
  if (date != null) {
    dateParse =
        DateTime(date.year, date.month, date.day, date.hour + 7, date.minute);
  }
  return dateParse != null ? DateFormat('hh:mm a').format(dateParse) : "";
}

String convertStringTimetoTimeAgo(String timeStamp) {
  final date = DateTime.tryParse(timeStamp);
  final secondAgo =
      date != null ? date.subtract(const Duration(milliseconds: 0)) : null;
  final time = timeago.format(secondAgo ?? DateTime.now(), locale: 'en_short');
  return time == " now" ? "Vừa xong" : "$time trước";
}

String fullStringDateTimerFormat(String? stringTime) {
  final date = DateTime.tryParse(stringTime ?? '');
  return date != null
      ? "${DateFormat('hh:mm').format(date)} ngày ${fullStringTimeFormat(stringTime)}"
      : '';
}

String fullStringDateTimerFormat2(String? stringTime) {
  final date = DateTime.tryParse(stringTime ?? '');
  return date != null ? "${DateFormat('hh:mm:ss').format(date)}" : '';
}

String fullStringDateTimerFormatLearn(String? stringTime) {
  if (Duration(seconds: int.parse(stringTime ?? "0")).inDays.remainder(60) ==
      0) {
    return "${Duration(seconds: int.parse(stringTime ?? "0")).inHours.remainder(60)} giờ ${Duration(seconds: int.parse(stringTime ?? "0")).inMinutes.remainder(60)} phút ${Duration(seconds: int.parse(stringTime ?? "0")).inSeconds.remainder(60)} giây";
  }
  return "${Duration(seconds: int.parse(stringTime ?? "0")).inDays.remainder(60)} ngày ${Duration(seconds: int.parse(stringTime ?? "0")).inHours.remainder(60)} giờ ${Duration(seconds: int.parse(stringTime ?? "0")).inMinutes.remainder(60)} phút ${Duration(seconds: int.parse(stringTime ?? "0")).inSeconds.remainder(60)} giây";
}

String fullStringDateTimerCommentFormat(String? stringTime) {
  final date = DateTime.tryParse(stringTime ?? '');
  return date != null
      ? "${fullStringTimeFormat(stringTime)} - ${DateFormat('hh:mm').format(date)}"
      : '';
}

bool checkPassLength(String passWord) {
  if (passWord.length >= 8) {
    return false;
  } else {
    return true;
  }
}

var formatter = NumberFormat('#,##0');

List splitName(String fullName) {
  var names = fullName.trim().split(" ");
  if (names.length == 0) {
    return ["", ""];
  }

  if (names.length == 1) {
    return [names[0], ""];
  }

  return [names[0], names.skip(1).join(' ')];
}

Widget html2Widget(String content) {
  var document = parse(content);

  final elAudios = document.getElementsByTagName('audio');
  if (elAudios.length > 0 &&
      elAudios[0].children.length > 0 &&
      elAudios[0].children[0].attributes["src"] != null) {
    final audioSrc = elAudios[0].children[0].attributes["src"]!;
    final audioPlayer = AssetsAudioPlayer();
    audioPlayer.open(
      Audio.network(audioSrc),
      showNotification: false,
      loopMode: LoopMode.single,
    );
    return GestureDetector(
      onTap: () {
        audioPlayer.playOrPause();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        alignment: Alignment.center,
        child: Image.asset(
          R.ASSETS_MINIGAME_LISTEN_SPEAKER_PNG,
        ),
      ),
    );
  }
  final elMaths = document.getElementsByTagName('math');
  if (elMaths.length > 0) {
    return Html(
      data: content,
      style: {
        "p": Style(
          color: Color(0xff96440C),
          padding: EdgeInsets.all(16),
          fontSize: FontSize(16),
          fontWeight: FontWeight.w900,
        ),
        "span": Style(
          color: Color(0xff96440C),
          padding: EdgeInsets.all(16),
          fontSize: FontSize(16),
          fontWeight: FontWeight.w900,
        ),
      },
    );
  }
  final elImages = document.getElementsByTagName('img');
  if (elImages.length > 0 && elImages[0].attributes["src"] != null) {
    final imgSrc = elImages[0].attributes["src"]!;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      alignment: Alignment.center,
      child: Image.network(imgSrc),
    );
  }
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    alignment: Alignment.center,
    child: Html(
      data: content,
      style: {
        "p": Style(
          color: Color(0xff96440C),
          fontSize: FontSize(14),
          fontWeight: FontWeight.w900,
        ),
        "span": Style(
          color: Color(0xff96440C),
          fontSize: FontSize(14),
          fontWeight: FontWeight.w900,
        ),
      },
    ),
  );
}

Future<ui.Image> loadImage(String assetPath) async {
  ByteData data = await rootBundle.load(assetPath);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
  ui.FrameInfo fi = await codec.getNextFrame();
  return fi.image;
}

Widget html2WidgetDragDrop(String content, {double width = 100, int type = 0}) {
  var document = parse(content);
  final elImages = document.getElementsByTagName('img');
  if (elImages.length > 0 && elImages[0].attributes["src"] != null) {
    final imgSrc = elImages[0].attributes["src"]!;
    if (type == 2) {
      return Stack(
        children: [
          Image.asset(
            R.ASSETS_MINIGAME_BOX_MATCHED_PNG,
            width: width,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            width: width,
            alignment: Alignment.center,
            child: Image.network(imgSrc),
          )
        ],
      );
    }
    Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      width: width,
      alignment: Alignment.center,
      child: Image.network(imgSrc),
    );
  }
  final elp = document.getElementsByTagName('p');
  if (elp.length > 0) {
    final content = elp[0].text;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: EdgeInsets.only(top: type == 3 ? 40 : 0),
      width: width * 2,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        color: type == 2 ? Colors.orange[100] : Colors.orange[50],
      ),
      child: Text(
        content,
        style: typoBold12.copyWith(decoration: TextDecoration.none),
      ),
    );
  }
  return Container(
    alignment: Alignment.center,
    width: width,
    child: Html(
      data: content,
      style: {
        "p": Style(
          color: Color(0xff96440C),
          fontSize: FontSize(14),
          fontWeight: FontWeight.w900,
        ),
        "span": Style(
          color: Color(0xff96440C),
          fontSize: FontSize(14),
          fontWeight: FontWeight.w900,
        ),
      },
    ),
  );
}

String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  return htmlText.replaceAll(exp, '');
}

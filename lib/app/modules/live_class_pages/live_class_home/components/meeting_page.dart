import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:elearning/app/config/constant.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;

import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

// ignore: must_be_immutable
class MeetingPage extends StatefulWidget {
  String name;
  String token;
  MeetingPage({required this.name, required this.token, Key? key})
      : super(key: key);

  @override
  _MeetingPageState createState() =>
      _MeetingPageState(nameChannel: this.name, token: this.token);
}

class _MeetingPageState extends State<MeetingPage> {
  final _users = <int>[];
  var myID = 0;
  int? _remoteUid;
  String? nameChannel;
  bool muted = false;
  bool localUserJoined = false;
  String? token;
  RtcEngine? _engine;
  _MeetingPageState({this.nameChannel, this.token});

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await initAgora();
    });
  }

  @override
  void dispose() {
    super.dispose();
    //  if _debug != null {

    //  }
    if (_users.length > 0) {
      _users.clear();
    }

    // destroy sdk
    _engine?.leaveChannel();
    _engine?.destroy();
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
    await _engine?.enableLocalVideo(true);
    // await _engine?.setRemoteSubscribeFallbackOption (true);
    await _engine?.muteLocalVideoStream(true);
    _engine?.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          setState(() {
            localUserJoined = true;
            // _users.add(uid);
          });
          print("local user $uid joined");
        },
        userJoined: (int uid, int elapsed) {
          print("remote user $uid joined");
          setState(() {
            _users.add(uid);
            // _remoteUid = uid;
          });
        },
        leaveChannel: (stats) {
          setState(() {
            _users.clear();
          });
        },
        userOffline: (int uid, UserOfflineReason reason) {
          print("remote user $uid left channel");
          setState(() {
            _remoteUid = null;
            _users.remove(uid);
          });
        },
      ),
    );

    await _engine?.joinChannel(
        token, nameChannel ?? "channel_345", "baooovip", 0);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: localUserJoined
              ? RtcLocalView.SurfaceView()
              : CircularProgressIndicator(),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: Container(
            height: 120,
            child: _viewRows(),
          ),
        ),
      ],
    );
  }

  remoteVideo() {
    if (_remoteUid != null) {
      return RtcRemoteView.SurfaceView(uid: _remoteUid!);
    } else {
      return Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }

  Widget _viewRows() {
    final views = _getRenderViews();
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: views.length,
        itemBuilder: (context, id) => Container(
                child: Column(
              children: <Widget>[_videoView(views[id])],
            )));
  }

  List<Widget> _getRenderViews() {
    final List<StatefulWidget> list = [];
    // if (widget.role == ClientRole.Broadcaster) {
    //   list.add(RtcLocalView.SurfaceView());
    // }
    _users.forEach((int uid) => list.add(RtcRemoteView.SurfaceView(uid: uid)));
    return list;
  }

  Widget _videoView(view) {
    return Expanded(
        child: Container(
            width: 130, margin: EdgeInsets.only(right: 16), child: view));
  }

  void onToggleMute() {
    setState(() {
      muted = !muted;
    });
    _engine?.muteLocalAudioStream(muted);
  }

  void onSwitchCamera() {
    _engine?.switchCamera();
  }

  turnOnVideo() {
    _engine?.enableVideo();
  }

  turnOffVideo() {
    _engine?.disableVideo();
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kronosme/core/models/podcast.dart';

class PodcastPlayer extends StatefulWidget {
  @override
  _PodcastPlayerState createState() => _PodcastPlayerState();
}

class _PodcastPlayerState extends State<PodcastPlayer> {
  Duration duration;
  Duration position;

  Podcast podcast;
  AudioPlayer audioPlayer;

  PlayerState playerState;

  get durationText =>
      duration != null ? duration.toString().split('.').first : '';

  get positionText =>
      position != null ? position.toString().split('.').first : '';

  bool isMuted = false;

  StreamSubscription _positionSubscription;
  StreamSubscription _audioPlayerStateSubscription;

  @override
  void initState() {
    initAudioPlayer();
    super.initState();
  }

  @override
  void dispose() {
    _positionSubscription.cancel();
    _audioPlayerStateSubscription.cancel();
    audioPlayer.stop();
    super.dispose();
  }

  void initAudioPlayer() async {
    audioPlayer = AudioPlayer();

    audioPlayer.durationStream.listen((dur) {
      setState(() {
        duration = dur;
      });
    });

    audioPlayer.positionStream.listen((p) {
      setState(() {
        position = p;
      });
    });

    audioPlayer.playerStateStream.listen((state) {
      setState(() {
        playerState = state;
      });
    });

    // audioPlayer = AudioPlayer();
    // audioPlayer.setVolume(1);

    // audioPlayer.

    // audioPlayer.onAudioPositionChanged.listen((p) {
    //   print("Position ${p.inMilliseconds}");
    //   setState(() => position = p);
    // });

    // audioPlayer.onPlayerError.listen((err) {
    //   print("Error occurred: $err");
    // });

    // audioPlayer.onDurationChanged.listen((dur) {
    //   if (!mounted) return;

    //   print("Duration is ${dur.inMilliseconds} ms");
    //   setState(() {
    //     duration = dur;
    //   });
    // });

    // audioPlayer.onPlayerStateChanged.listen((s) async {
    //   print("New state is ${s.toString()}");
    //   if (s == AudioPlayerState.PLAYING) {
    //     int duration = await Future.delayed(
    //         Duration(seconds: 2), () => audioPlayer.getDuration());
    //     print("Duration is $duration");
    //   } else if (s == AudioPlayerState.STOPPED) {
    //     onComplete();
    //     setState(() {
    //       position = duration;
    //     });
    //   }
    // }, onError: (msg) {
    //   print("Error occurred: $msg");
    //   setState(() {
    //     playerState = PlayerState.stopped;
    //     duration = Duration(seconds: 0);
    //     position = Duration(seconds: 0);
    //   });
    // });
  }

  Future play(String path) async {
    var tmp = await audioPlayer.setUrl(
      path,
      initialPosition: Duration.zero,
      preload: true,
    );

    print("Duration is " + tmp.inMilliseconds.toString());

    setState(() {
      duration = tmp;
    });

    await audioPlayer.play();
  }

  Future pause() async {
    await audioPlayer.pause();
  }

  Future stop() async {
    await audioPlayer.stop();
    setState(() {
      position = Duration.zero;
    });
  }

  Future mute(bool muted) async {
    await audioPlayer.setVolume(muted ? 0 : 0.30);
    setState(() {
      isMuted = muted;
    });
  }

  @override
  Widget build(BuildContext context) {
    podcast = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 100.0),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    podcast.title ?? "Podcast Title",
                    style: TextStyle(
                      fontFamily: 'Montserrat Bold',
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 7.0),
                  Text(
                    podcast.category ?? "Category",
                    style: TextStyle(
                      color: Color(0xFFFE0000),
                      fontFamily: 'Montserrat SemiBold',
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
              Container(
                width: 300.0,
                height: 300.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      podcast.hero(),
                    ),
                  ),
                ),
              ),
              Slider(
                value: position?.inMilliseconds?.toDouble() ?? 0.0,
                onChanged: (double value) {
                  return audioPlayer
                      .seek(Duration(milliseconds: (value / 1000).round()));
                },
                min: 0.0,
                max: duration?.inMilliseconds?.toDouble() ?? 0.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      audioPlayer.playerState.playing
                          ? Icons.pause_circle_outline
                          : Icons.play_circle_outline,
                    ),
                    iconSize: 70.0,
                    color: Colors.black87,
                    onPressed: () async {
                      audioPlayer.playerState.playing
                          ? pause()
                          : play(podcast.audio());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

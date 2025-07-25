import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
// ignore: depend_on_referenced_packages
import 'package:audioplayers/audioplayers.dart';
import 'package:vibration/vibration.dart';

class PromodoraT extends StatefulWidget {
  const PromodoraT({super.key});

  @override
  State<PromodoraT> createState() => _PromodoraTState();
}

class _PromodoraTState extends State<PromodoraT> {
  int _workDuration = 25 * 60; // 25 minutes in seconds
  int _breakDuration = 5 * 60; // 5 minutes in seconds
  late int _remainingTime;
  bool _isRunning = false;
  bool _isWorkPhase = true;
  int _pomodorosCompleted = 0;
  late Timer _timer;
  AudioPlayer _audioCache = AudioPlayer();
  bool _isVibrationSupported = false;

  @override
  void initState() {
    super.initState();
    _remainingTime = _workDuration;
    Vibration.hasVibrator().then((value) {
      setState(() {
        _isVibrationSupported = value!;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _isRunning = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _isRunning = false;
          _audioCache.play('notification.mp3' as Source);
          if (_isWorkPhase) {
            setState(() {
              _isWorkPhase = false;
              _pomodorosCompleted++;
              _remainingTime = _breakDuration;
            });
          } else {
            setState(() {
              _isWorkPhase = true;
              _remainingTime = _workDuration;
            });
          }
          if (_isVibrationSupported) {
            Vibration.vibrate(duration: 1000);
          }
        }
      });
    });
  }

  void _pauseTimer() {
    _isRunning = false;
    _timer.cancel();
  }

  void _resetTimer() {
    _isRunning = false;
    _timer.cancel();
    setState(() {
      _isWorkPhase = true;
      _pomodorosCompleted = 0;
      _remainingTime = _workDuration;
    });
  }

  String _formatDuration(int duration) {
    int minutes = duration ~/ 60;
    int seconds = duration % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    double percent =
        _remainingTime / (_isWorkPhase ? _workDuration : _breakDuration);
    return Scaffold(
       resizeToAvoidBottomInset: false,
       backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 30,
                color: Color(0xFF9C3FE4),
              )),
          title: Text(
            "Pomodoro Timer :",
            style: TextStyle(color: Color(0xFF9C3FE4), fontSize: 24),
          ),
        ),
        body: Container(
           constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/PomodoroBackground.png"),
            fit: BoxFit.fill,
          )),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 10 , bottom: 30),
                    width: 314,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF9C3FE4),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Color(0xFF9C3FE4),
                              width: 1,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Color(0xFF9C3FE4),
                              width: 1,
                            )),
                        suffixIcon: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        hintText: "Task" ,
                        hintStyle: TextStyle(color: Colors.white , fontSize: 20),
                      ),
                      autocorrect: true,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
            Text(
              _isWorkPhase ? 'Work' : 'Break',
              style: TextStyle(fontSize: 30 ,color: Color(0xFF9C3FE4)),
            ),
            SizedBox(height: 20),
            CircularPercentIndicator(
              radius: 150,
              lineWidth: 10,
              percent: percent,
              center: Text(
                _formatDuration(_remainingTime),
                style: TextStyle(fontSize: 50 , color: Color(0xFF9C3FE4),),
              ),
              backgroundColor: Colors.grey,
              progressColor: _isWorkPhase ? Color(0xffFBC2EB) : Color(0xffA7AEF9),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: _isRunning ? _pauseTimer : _startTimer,
                  icon: Icon(
                    color: Color(0xFF9C3FE4),
                    _isRunning ? Icons.pause : Icons.play_arrow,
                    size: 40,
                  ),
                ),
                IconButton(
                  onPressed: _resetTimer,
                  icon: Icon(
                    Icons.refresh,
                    color: Color(0xFF9C3FE4),
                    size: 40,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Pomodoros completed: $_pomodorosCompleted',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

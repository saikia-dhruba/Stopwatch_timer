import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final PageController pageController = PageController();
  Rx<Duration> duration = const Duration(seconds: 0).obs;
  Rx<Duration> durationSwatch = const Duration(seconds: 0).obs;
  Timer? _timer;
  Timer? stopwatch;
  RxInt currentIndex = 0.obs;

  int remainingSeconds = 1;
  final time = '00:00'.obs;

  RxInt secondsSwatch = 0.obs;
  RxInt minutesSwatch = 0.obs;
  RxInt hoursSwatch = 0.obs;
  String twoDigitNumber(int n) => n.toString().padLeft(2, '0');
  RxBool isRunning = RxBool(false);
  RxBool isRunningSw = RxBool(false);
  var header = "Timer".obs;
  RxList<String> timeLaps = <String>[].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }

  void changePage(int index) {
    currentIndex.value = index;
    if (currentIndex.value == 0) {
      header.value = "Timer";
    } else {
      header.value = "Stopwatch";
    }
  }



  void startTimer(int seconds) {
    isRunning.value = true;
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
      } else {
        // int hours = minutes ~/ 60;
        int minutes = remainingSeconds ~/ 60;
        int seconds = (remainingSeconds % 60);
        time.value = minutes.toString().padLeft(2, "0") +
            ":" +
            seconds.toString().padLeft(2, "0");
        remainingSeconds--;
      }
    });
  }

 

  void resetTimer() {
    isRunning.value = false;
    _timer?.cancel();
    time.value = '00:00';
  }

  void pauseTimer() {
    isRunning.value = false;
    _timer?.cancel();
  }

  // Stopwatch

  void pauseSwatch() {
    isRunningSw.value = false;
    stopwatch?.cancel();
  }

  void restSwatch() {
    isRunningSw.value = false;
    stopwatch?.cancel();
    durationSwatch.value = const Duration();
  }

  void startSwatch() {
    isRunningSw.value = true;
    stopwatch = Timer.periodic(const Duration(seconds: 1), (_) => remSec());
  }

  void remSec() {
    const addSeconds = 1;
    secondsSwatch.value = durationSwatch.value.inSeconds + addSeconds;
    durationSwatch.value = Duration(seconds: secondsSwatch.value);
  
  }

  void addlaps() {
    String timelap = "$hoursSwatch:$minutesSwatch:$secondsSwatch";
    timeLaps.add(timelap);
  }
}

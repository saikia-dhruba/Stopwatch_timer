import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer/modules/home_controller.dart';

class Timer extends StatelessWidget {
  final HomeController controller;
  const Timer({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildTime(),
          const SizedBox(
            height: 80,
          ),
          buttons()
        ],
      ),
    );
  }

  Widget buildTime() {
    return Obx(() {
      

      return Text(
        controller.time.value,
        style: const TextStyle(fontSize: 80),
      );
    });
  }

  Widget buttons() {
    return Obx(() {
      if (controller.isRunning.value) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                controller.pauseTimer();
              },
              child: const Text("STOP"),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: () {
                controller.resetTimer();
              },
              child: const Text("RESET"),
            ),
          ],
        );
      } else {
        return ElevatedButton(
          onPressed: () {
            controller.startTimer(900);
          },
          child: const Text("START"),
        );
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer/modules/home_controller.dart';

class StopWatch extends StatelessWidget {
  final HomeController controller;
  const StopWatch({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          buildStopWatch(),
          Container(
            height: 300.0,
            padding: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              color: Colors.deepPurple[300],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Obx(() => ListView.builder(
                  itemCount: controller.timeLaps.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Lap ${index + 1}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Lap ${controller.timeLaps[index]}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    );
                  },
                )),
          ),
          const SizedBox(
            height: 20.0,
          ),
          buttons()
        ],
      ),
    ));
  }

  Widget buildStopWatch() {
    return Obx(() {
      final hours = controller.twoDigitNumber(
          controller.durationSwatch.value.inHours.remainder(60));
      final minutes = controller.twoDigitNumber(
          controller.durationSwatch.value.inMinutes.remainder(60));
      final seconds = controller.twoDigitNumber(
          controller.durationSwatch.value.inSeconds.remainder(60));

      return Text(
        '$hours:$minutes:$seconds',
        style: const TextStyle(fontSize: 50),
      );
    });
  }

  Widget buttons() {
    return Obx(() {
      if (controller.isRunningSw.value) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                controller.pauseSwatch();
              },
              child: const Text("STOP"),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: () {
                controller.addlaps();
              },
              child: const Text("LAP"),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: () {
                controller.restSwatch();
              },
              child: const Text("RESET"),
            ),
          ],
        );
      } else {
        return ElevatedButton(
          onPressed: () {
            controller.startSwatch();
          },
          child: const Text("START"),
        );
      }
    });
  }
}

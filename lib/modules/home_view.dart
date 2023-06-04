import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:timer/modules/components/stopwatch.dart';
import 'package:timer/modules/components/timer.dart';
import 'package:timer/modules/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: 
      Obx(() => 
      Container(
              color:Colors.deepPurple[200],
              child: CurvedNavigationBar(
                  onTap: (index) {
                    controller.changePage(index);
                    controller.currentIndex.value = index;
                  },
                  index: controller.currentIndex.value,
                  backgroundColor: Colors.transparent.withOpacity(0),
                  animationDuration: const Duration(milliseconds: 300),
                  items: const [
                    Icon(
                      Icons.timer,
                      size: 40,
                      color: Colors.deepPurple,
                    ),
                    Icon(
                      Icons.stop,
                      size: 40,
                      color: Colors.deepPurple,
                    ),
                  ]),
            )
            )
            ,
      appBar: AppBar(
        title: Obx(() => Text(controller.header.value)),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.deepPurple[200],
        child: Expanded(
                child: Obx(
                  () => IndexedStack(
                    index: controller.currentIndex.value,
                    children: [
                      Timer(controller: controller),
                      StopWatch(controller: controller),
                      // Container(
                      //   color: orange,
                      // ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

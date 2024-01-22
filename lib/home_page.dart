import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game/wheel.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  late SlotMachineController _controller;

  @override
  void initState() {
    super.initState();
  }

  void onButtonTap({required int index}) {
    _controller.stop(reelIndex: index);
  }

  void onStart() {
    final index = Random().nextInt(20);
    _controller.start(hitRollItemIndex: index < 5 ? index : null);
    Future.delayed(Duration(milliseconds: 900), () {
      _controller.stop(reelIndex: 0);
    });
    Future.delayed(Duration(milliseconds: 1000), () {
      _controller.stop(reelIndex: 1);
    });
    Future.delayed(Duration(milliseconds: 1100), () {
      _controller.stop(reelIndex: 2);
    });
    Future.delayed(Duration(milliseconds: 1200), () {
      _controller.stop(reelIndex: 3);
    });
    Future.delayed(Duration(milliseconds: 1300), () {
      _controller.stop(reelIndex: 4);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              height: 350,
              child: Image.asset(
                'assets/images/backgrounds.jpg',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SlotMachine(
                  rollItems: [
                    RollItem(
                        index: 0, child: Image.asset('assets/images/dog.png')),
                    RollItem(
                        index: 1, child: Image.asset('assets/images/cat.png')),
                    RollItem(
                        index: 2,
                        child: Image.asset('assets/images/dolphin.png')),
                    RollItem(
                        index: 3,
                        child: Image.asset('assets/images/eagle.png')),
                    RollItem(
                        index: 4,
                        child: Image.asset('assets/images/Layer.png')),
                    RollItem(
                        index: 5, child: Image.asset('assets/images/lion.png')),
                    RollItem(
                        index: 6,
                        child: Image.asset('assets/images/monkey.png')),
                    RollItem(
                        index: 7,
                        child: Image.asset('assets/images/OBJECTS.png')),
                    RollItem(
                        index: 8,
                        child: Image.asset('assets/images/panda.png')),
                    RollItem(
                        index: 9,
                        child: Image.asset('assets/images/rabit.png')),
                  ],
                  onCreated: (controller) {
                    _controller = controller;
                  },
                  onFinished: (resultIndexes) {
                    print('Result: $resultIndexes');
                  },
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 280,
              right: 65,
              child: SizedBox(
                  width: 340, child: Image.asset('assets/images/Asset 5.png'))),
          Positioned(
              bottom: 294,
              left: 112,
              child: SizedBox(
                  height: 16,
                  child: Image.asset('assets/images/Asset 10.png'))),
          Positioned(
              bottom: 294,
              left: 10,
              child: SizedBox(
                  height: 16,
                  child: Image.asset('assets/images/Asset 11.png'))),
          Positioned(
              bottom: 294,
              left: 133,
              child: SizedBox(
                  height: 16,
                  child: Image.asset('assets/images/Asset 11.png'))),
          Positioned(
              bottom: 294,
              left: 133,
              child: SizedBox(
                  height: 16,
                  child: Image.asset('assets/images/Asset 11.png'))),
          Positioned(
              bottom: 294,
              left: 225,
              child: SizedBox(
                  height: 16,
                  child: Image.asset('assets/images/Asset 10.png'))),
          Positioned(
              bottom: 290,
              right: 105,
              child: SizedBox(
                  height: 25, child: Image.asset('assets/images/Asset 4.png'))),
          Positioned(
            bottom: 293,
            left: 65,
            child: Text(
              '1',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 293,
            left: 183,
            child: Text(
              '1',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 280,
            right: 1,
            child: ElevatedButton(
              onPressed: () {
                onStart();
              },
              child: Text('START'),
            ),
          ),
        ],
      ),
    );
  }
}

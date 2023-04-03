import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSeconds = 1500;
  // 타이머 불러오기
  late Timer timer;

  void onTick(Timer timer) {
    setState(() {
      if (totalSeconds > 0) {
        totalSeconds = totalSeconds - 1;
      } else {
        timer.cancel();
      }
    });
  }

  void onStartPreesed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "$totalSeconds",
                  style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontSize: 89,
                      fontWeight: FontWeight.w600),
                )),
          ),
          //엄청 큰 아이콘 버튼이 될 예정
          Flexible(
            flex: 3,
            child: Center(
                child: IconButton(
              iconSize: 120,
              color: Theme.of(context).cardColor,
              onPressed: onStartPreesed,
              icon: const Icon(Icons.play_circle_outline),
            )),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pomodoros",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                        Text(
                          "0",
                          style: TextStyle(
                            fontSize: 68,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

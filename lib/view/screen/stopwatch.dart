import 'dart:async';
import 'dart:io';
import 'package:reliable_interval_timer/reliable_interval_timer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:premium_clock_app/utils/times.dart';

import 'home.dart';

class stopwatch extends StatefulWidget {
  const stopwatch({super.key});

  @override
  State<stopwatch> createState() => _stopwatchState();
}

class _stopwatchState extends State<stopwatch> {
  bool isRunning = false;
  late Timer _timer;
  late Stopwatch _stopwatch;
  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _timer = new Timer.periodic(new Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void StartStop() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
    } else {
      _stopwatch.start();
    }
    setState(() {}); // re-render the page
  }

  // void start() {
  //   timer = Timer.periodic(Duration(seconds: 1), (timer) {
  //     if (second > 58) {
  //       minute++;
  //       second = 0;
  //     } else {
  //       second++;
  //     }
  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff120F14),
        appBar: AppBar(
          backgroundColor: const Color(0xff120F14),
          leading: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icon/list.svg',
                color: Colors.grey.shade700,
                height: 30,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xffFC9AA2)),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                formatTime(_stopwatch.elapsedMilliseconds),
                style:
                    GoogleFonts.lato(color: Colors.grey.shade500, fontSize: 50),
              ),
              // SizedBox(
              //   height: 5,
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      formatmili(_stopwatch.elapsedMilliseconds),
                      style: GoogleFonts.lato(
                          color: Color((0xffFC9AA2)), fontSize: 40),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.amber)),
                      onPressed: () {
                        // start();
                        _stopwatch.start();
                      },
                      child: Text("click")),
                  SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        // timer.cancel();
                        _stopwatch.stop();
                      },
                      child: Text("stop"))
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    // timer.cancel();
                    _stopwatch.reset();
                    _stopwatch.stop();
                  },
                  child: Text(
                    "Reset",
                  ))
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...List.generate(
                icons.length,
                (index) => InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    setState(() {
                      click = index;
                      (index == 0)
                          ? Navigator.of(context).pushNamed('/home')
                          : null;
                    });
                  },
                  child: (click == index)
                      ? Container(
                          height: 50,
                          width: 120,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xff29282D),
                              borderRadius: BorderRadius.circular(50)),
                          child: SvgPicture.asset(
                            icons[index],
                            color: Color(0xffFC9AA2),
                          ),
                        )
                      : Container(
                          height: 50,
                          width: 90,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)),
                          child: SvgPicture.asset(icons[index]),
                        ),
                ),
              )
            ],
          ),
        ));
  }
}

int startclick = 0;
String formatTime(int milliseconds) {
  // var mili = (milliseconds % 1000).toString().padLeft(3, '0');

  var secs = milliseconds ~/ 1000;
  var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  var seconds = (secs % 60).toString().padLeft(2, '0');
  return "$hours:$minutes:$seconds";
}

String formatmili(int milliseconds) {
  var milli = (milliseconds % 1000).toString().padLeft(3, '0');
  return milli;
}

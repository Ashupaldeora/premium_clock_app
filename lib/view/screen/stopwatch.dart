import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:premium_clock_app/utils/times.dart';
import 'package:premium_clock_app/view/screen/timer.dart';

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
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
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
      isStop = true;
      _stopwatch.stop();
    } else {
      isStop = false;
      _stopwatch.start();
    }
  }

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
                height: 27,
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
              CupertinoButton(
                onPressed: () {
                  StartStop();
                },
                child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        color: const Color(0xff120F14),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white.withOpacity(0.1),
                              offset: const Offset(
                                -10,
                                -10,
                              ),
                              blurRadius: 15),
                          const BoxShadow(
                              color: Colors.black,
                              offset: Offset(
                                -10,
                                -10,
                              ),
                              blurStyle: BlurStyle.inner,
                              blurRadius: 15),
                          const BoxShadow(
                              color: Colors.black,
                              offset: Offset(
                                10,
                                10,
                              ),
                              blurRadius: 15)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (!isStop)
                            ? Text(
                                formatTime(_stopwatch.elapsedMilliseconds),
                                style: GoogleFonts.lato(
                                    color: Colors.grey.shade400, fontSize: 50),
                              )
                            : BlinkText(
                                formatTime(_stopwatch.elapsedMilliseconds),
                                beginColor: const Color(0xffFC9AA2),
                                // endColor: Colors.grey.shade400,
                                textScaleFactor: 20,
                                style: GoogleFonts.lato(
                                    color: Colors.grey.shade400, fontSize: 50),
                              ),

                        // SizedBox(
                        //   height: 5,
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 105),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                formatmili(_stopwatch.elapsedMilliseconds),
                                style: GoogleFonts.lato(
                                    color: const Color((0xffFC9AA2)),
                                    fontSize: 40),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            enableFeedback: true,
                            backgroundColor: (!_stopwatch.isRunning)
                                ? MaterialStateProperty.all(Colors.white)
                                : MaterialStateProperty.all(Colors.grey),
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent)),
                        onPressed: () {
                          isReset = false;
                          isStop = false;
                          _stopwatch.start();
                        },
                        child: Text(
                          "Start",
                          style: GoogleFonts.lato(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        )),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: (_stopwatch.isRunning)
                              ? MaterialStateProperty.all(Colors.white)
                              : MaterialStateProperty.all(Colors.grey),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: () {
                          // timer.cancel();
                          isStop = true;
                          _stopwatch.stop();
                        },
                        child: Text(
                          "Stop",
                          style: GoogleFonts.lato(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 75,
                width: 80,
                child: (!isReset)
                    ? InkWell(
                        onTap: () {
                          _stopwatch.reset();

                          isReset = true;
                          isStop = false;

                          _stopwatch.stop();
                        },
                        child: Container(
                          height: 70,
                          width: 80,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffFC9AA2),
                          ),
                          child: const Icon(
                            Icons.refresh,
                            size: 40,
                          ),
                        ),
                      )
                    : Container(),
              ),
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
                      switch (click) {
                        case 0:
                          Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return const homescreen();
                              },
                              transitionDuration: Duration.zero));
                          break;
                        case 3:
                          Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return const timerwatch();
                              },
                              transitionDuration: Duration.zero));
                          break;
                      }
                    });
                  },
                  child: (click == index)
                      ? Container(
                          height: 50,
                          width: 120,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color(0xff29282D),
                              borderRadius: BorderRadius.circular(50)),
                          child: SvgPicture.asset(
                            icons[index],
                            color: const Color(0xffFC9AA2),
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
bool isReset = false, isStop = false;
String formatTime(int milliseconds) {
  // var mili = (milliseconds % 1000).toString().padLeft(3, '0');

  var secs = milliseconds ~/ 1000;
  var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  var seconds = (secs % 60).toString().padLeft(2, '0');
  return "$hours:$minutes:$seconds";
}

String formatmili(int milliseconds) {
  var milli = (milliseconds % 1000).toString().padRight(3, '0');

  if (milli.length > 1) {
    milli = milli.substring(0, milli.length - 1);
  }
  return milli;
}

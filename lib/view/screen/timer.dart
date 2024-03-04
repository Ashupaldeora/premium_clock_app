import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:premium_clock_app/view/screen/stopwatch.dart';
import 'package:glass/glass.dart';

import 'home.dart';

class timerwatch extends StatefulWidget {
  const timerwatch({super.key});

  @override
  State<timerwatch> createState() => _timerwatchState();
}

bool isCreatenew = false, isPlayed = false;
int Timerclick = 0;

class _timerwatchState extends State<timerwatch> {
  late Timer timerr;

  void starttimer() {
    if ((Timersec != 0 || Timerminute != 0 || Timerhour != 0) && (isPlayed)) {
      timerr = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          Timersec--;
        });
      });
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
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Container(
                  height: 350,
                  width: 350,
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                            height: 350,
                            width: 350,
                            child: CircularProgressIndicator(
                              value: 1,
                              strokeWidth: 8,
                              strokeCap: StrokeCap.round,
                              color: const Color(0xffFC9AA2),
                            )),
                      ),
                      Center(
                        child: Text(
                          formatTimer(Timersec),
                          style: GoogleFonts.lato(
                              color: Colors.white, fontSize: 40),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Expanded(
                  child: Container(
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  Timerhour = 0;
                                  Timerminute = 0;
                                  Timersec = 0;
                                  timerr.cancel();
                                  setState(() {
                                    isPlayed = false;
                                  });
                                });
                              },
                              icon: const Icon(
                                Icons.refresh_rounded,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (Timersec != 0 ||
                                      Timerminute != 0 ||
                                      Timerhour != 0) {
                                    Timerclick++;
                                    if (Timerclick % 2 == 1) {
                                      isPlayed = true;
                                    } else {
                                      isPlayed = false;
                                    }
                                  }
                                  (isPlayed) ? starttimer() : timerr.cancel();
                                });
                              },
                              icon: (!isPlayed)
                                  ? const Icon(
                                      Icons.play_arrow_rounded,
                                      color: Color(0xffFC9AA2),
                                      size: 80,
                                    )
                                  : const Icon(
                                      Icons.pause,
                                      color: Color(0xffFC9AA2),
                                      size: 80,
                                    ),
                            ),
                            IconButton(
                              onPressed: () {
                                timerr.cancel();
                                setState(() {
                                  isPlayed = false;
                                });
                              },
                              icon: const Icon(
                                Icons.stop_rounded,
                                color: Colors.white,
                                size: 35,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CupertinoButton(
                                      onPressed: () {
                                        setState(() {
                                          isCreatenew = true;
                                        });
                                      },
                                      child: Text(
                                        "+ create new",
                                        style: GoogleFonts.lato(
                                            color: const Color(0xffFC9AA2),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                        (isCreatenew)
                            ? Center(
                                child: Positioned(
                                  bottom: 150,
                                  child: AnimatedContainer(
                                    duration: const Duration(seconds: 1),
                                    height: 300,
                                    width: 350,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.white.withOpacity(0.1)),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  isCreatenew = false;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.close,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            OutlinedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    Timersec = 60;
                                                  });
                                                },
                                                child: Text(
                                                  "1 Minute",
                                                  style: GoogleFonts.lato(
                                                      color: const Color(
                                                          0xffFC9AA2),
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )),
                                            OutlinedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    Timersec = 60 * 3;
                                                  });
                                                },
                                                child: Text(
                                                  "3 Minute",
                                                  style: GoogleFonts.lato(
                                                      color: const Color(
                                                          0xffFC9AA2),
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ))
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            OutlinedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    Timersec = 60 * 5;
                                                  });
                                                },
                                                child: Text(
                                                  "5 Minute",
                                                  style: GoogleFonts.lato(
                                                      color: const Color(
                                                          0xffFC9AA2),
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )),
                                            OutlinedButton(
                                                onPressed: () {
                                                  Timersec = 60 * 10;
                                                },
                                                child: Text(
                                                  "10 Minute",
                                                  style: GoogleFonts.lato(
                                                    color:
                                                        const Color(0xffFC9AA2),
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ))
                                          ],
                                        )
                                      ],
                                    ),
                                  ).asGlass(
                                    tintColor: Colors.black,
                                    clipBorderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
                        case 2:
                          Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return const stopwatch();
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

int Timerhour = 0, Timerminute = 0, Timersec = 0;
String formatTimer(int Tseconds) {
  // var mili = (milliseconds % 1000).toString().padLeft(3, '0');

  var secs = Tseconds;
  var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  var seconds = (secs % 60).toString().padLeft(2, '0');

  return "$hours:$minutes:$seconds";
}

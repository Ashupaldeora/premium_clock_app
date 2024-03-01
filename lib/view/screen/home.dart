import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:premium_clock_app/utils/times.dart';
import 'package:premium_clock_app/view/screen/stopwatch.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.now();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        time = DateTime.now();
      });
    });

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Scaffold(
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
              children: [
                Text(
                  "Patrakar Colony, Surat | IST",
                  style: GoogleFonts.lato(
                      color: Colors.grey.shade700, fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      (time.hour <= 12)
                          ? (time.minute < 10)
                              ? "${time.hour} : 0${time.minute}"
                              : "${time.hour} : ${time.minute}"
                          : (time.minute < 10)
                              ? "${time.hour % 12} : 0${time.minute}"
                              : "${time.hour % 12} : ${time.minute}",
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 60),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Transform.rotate(
                      angle: 270 * pi / 180,
                      child: Text(
                        (time.hour < 12) ? "AM" : "PM",
                        style: GoogleFonts.lato(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w500,
                            fontSize: 17),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.maxFinite,
                  height: 350,
                  child: Center(
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            height: 350,
                            width: 300,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Color(0xff222126),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Center(
                          child: Transform.rotate(
                            angle: time.second * 6 * pi / 180,
                            child: const VerticalDivider(
                              color: Color(0xffFC9AA2),
                              thickness: 1.5,
                              indent: 60,
                              endIndent: 170,
                            ),
                          ),
                        ),
                        Center(
                          child: Transform.rotate(
                            angle: time.minute * 6 * pi / 180,
                            child: const VerticalDivider(
                              color: Color(0xff4E4E4E),
                              thickness: 10,
                              indent: 65,
                              endIndent: 170,
                            ),
                          ),
                        ),
                        Center(
                          child: Transform.rotate(
                            angle:
                                (time.hour * 30 + time.minute * 0.5) * pi / 180,
                            child: const VerticalDivider(
                              color: Color(0xff404040),
                              thickness: 10,
                              indent: 85,
                              endIndent: 170,
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            height: 30,
                            width: 30,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff3A3A3A),
                            ),
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff222222),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          height: 180,
                          width: 250,
                          decoration: BoxDecoration(
                              color: const Color(0xff222126),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "New York, USA",
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 17,
                                    letterSpacing: 1),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "-11 HRS | EST",
                                style: GoogleFonts.lato(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    letterSpacing: 1),
                              ),
                              const Spacer(),
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icon/Liberty.svg',
                                      color: Colors.grey.shade800,
                                    ),
                                    const Spacer(),
                                    Text(
                                      (time.minute < 10)
                                          ? "${(time.hour - 10) % 12} : 0${time.minute}"
                                          : "${(time.hour - 10) % 12} : ${time.minute}",
                                      style: GoogleFonts.lato(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 30),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    RotatedBox(
                                      quarterTurns: 3,
                                      child: Text(
                                        (time.hour >= 23) ? "   PM" : "    AM",
                                        style: GoogleFonts.lato(
                                            color: Colors.grey.shade600,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          height: 180,
                          width: 250,
                          decoration: BoxDecoration(
                              color: const Color(0xff222126),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sydney, AUS",
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 17,
                                    letterSpacing: 1),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "+6 HRS | AEST",
                                style: GoogleFonts.lato(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    letterSpacing: 1),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icon/Sydney.svg',
                                    color: Colors.grey.shade800,
                                  ),
                                  const Spacer(),
                                  Text(
                                    (time.minute < 10)
                                        ? "${(time.hour + 6) % 12} : 0${time.minute}"
                                        : "${(time.hour + 6) % 12} : ${time.minute}",
                                    style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 30),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  RotatedBox(
                                    quarterTurns: 3,
                                    child: Text(
                                      (time.hour >= 18) ? "AM" : "PM",
                                      style: GoogleFonts.lato(
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Container(
                //   height: 80,
                //   width: double.maxFinite,
                //   decoration: BoxDecoration(color: Colors.pink),
                // )
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
                        (click == 2)
                            ? Navigator.of(context).pushNamed('/stopwatch')
                            : null;
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
          )),
    );
  }
}

List icons = [
  'assets/icon/clock.svg',
  'assets/icon/world.svg',
  'assets/icon/stop_watch.svg',
  'assets/icon/watch_2.svg'
];
int click = 0;

import 'dart:async';

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
  @override
  Widget build(BuildContext context) {
    int hour = 0, minute = 0, second = 0, milisecond = 0;
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        second++;
      });
    });

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
                "${hour} : ${minute} : ${second}",
                style:
                    GoogleFonts.lato(color: Colors.grey.shade500, fontSize: 50),
              ),
              Text(
                "${milisecond}",
                style:
                    GoogleFonts.lato(color: Colors.grey.shade500, fontSize: 45),
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

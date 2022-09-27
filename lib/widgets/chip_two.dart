import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import 'gradian_icon.dart';

class ChipTwo extends StatefulWidget {
  const ChipTwo({super.key});

  @override
  State<ChipTwo> createState() => _ChipTwoState();
}

int activeIndex = 0;

class _ChipTwoState extends State<ChipTwo> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  activeIndex = index;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: activeIndex == index
                      ? Border.all(
                          color: HexColor(
                            "#6A58D0",
                          ),
                        )
                      : Border.all(
                          color: HexColor(
                          "#050B18",
                        )),
                  color: HexColor(
                    "#2B2D47",
                  ),
                  borderRadius: BorderRadius.circular(
                    18,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                    13,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      activeIndex == index
                          ? GradientIcon(
                              iconData[index],
                              20,
                              const LinearGradient(
                                colors: <Color>[
                                  Color.fromRGBO(
                                    255,
                                    0,
                                    0,
                                    1,
                                  ),
                                  Color.fromRGBO(
                                    255,
                                    214,
                                    0,
                                    1,
                                  ),
                                  Color.fromRGBO(
                                    255,
                                    214,
                                    0,
                                    1,
                                  ),
                                ],
                                // begin: Alignment.topLeft,
                                // end: Alignment.bottomCenter,
                              ),
                            )
                          : Icon(
                              iconData[index],
                            ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        label[index],
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, index) {
            return const SizedBox(
              width: 14,
            );
          },
          itemCount: 4),
    );
  }

  final List<String> label = [
    "All",
    "Action",
    "Adventure",
    "Puzzle",
  ];
  final List<IconData> iconData = [
    FontAwesomeIcons.boltLightning,
    FontAwesomeIcons.boltLightning,
    FontAwesomeIcons.boltLightning,
    FontAwesomeIcons.squarePollVertical
  ];
}



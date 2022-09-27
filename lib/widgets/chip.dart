import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';

class ChipWidget extends StatefulWidget {
  const ChipWidget({super.key});

  @override
  State<ChipWidget> createState() => _ChipWidgetState();
}
    int activeIndex = 0;


class _ChipWidgetState extends State<ChipWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
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
                  color: activeIndex == index
                      ? HexColor("#6A58D0")
                      : HexColor(
                          "#2B2D47",
                        ),
                  borderRadius: BorderRadius.circular(
                    18,
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 17),
                  child: Text(
                    label[index],
                    style: const TextStyle(
                      color: Colors.white,
                    ),
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
          itemCount: 6),
    );
  }

  final List<String> label = [
    "All",
    "PlayStation",
    "Nintedo",
    "X-Box",
    "PC",
    "Mobile Phone"
  ];
}

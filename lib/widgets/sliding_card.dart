import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';

class SlidingCard extends StatefulWidget {
  const SlidingCard({super.key,required this.gamename});
  final String gamename;
  @override
  State<SlidingCard> createState() => _SlidingCardState();
}

class _SlidingCardState extends State<SlidingCard> {
  final CarouselController _carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 272,
        height: 214,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider.builder(
                    carouselController: _carouselController,
                    itemCount: 10,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                      int realIndex,
                    ) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                        width: 272,
                        height: 159,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          child: Image.asset(
                            "assets/images/game.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {},
                      height: 200,
                      viewportFraction: 1,
                      enableInfiniteScroll: false,
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 95,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      _carouselController.previousPage();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 95,
                    left: 245,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      _carouselController.nextPage();
                    },
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 154,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: HexColor(
                          "#2B2D47",
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(
                            12,
                          ),
                          bottomRight: Radius.circular(
                            12,
                          ),
                        )),
                    width: 273,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Expanded(
                           child: Padding(
                            padding: const EdgeInsets.all(
                              8.0,
                            ),
                            child: Text(
                              widget.gamename,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                                                 ),
                         ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(
                              8.0,
                            ),
                            child: Icon(
                              Icons.favorite_outline,
                              color: HexColor(
                                "#6A58D0",
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

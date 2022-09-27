import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:game_database/widgets/chip_two.dart';
import 'package:hexcolor/hexcolor.dart';

import 'gradian_icon.dart';

class GameCard extends StatelessWidget {
  const GameCard({super.key, required this.imageUrl,required this.gamename});
  final String imageUrl;
  final String gamename;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 352,
        height: 370,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                  width: 352,
                  height: 170,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 170,
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
                    width: 354,
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                            top: 14,
                            bottom: 10,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text(
                                gamename,
                                style: const TextStyle(
                                  fontFamily: "Josefin",
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Icon(
                                Icons.favorite_outline,
                                color: HexColor(
                                  "#6A58D0",
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: HexColor(
                                    "#1F2137",
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    18,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                    10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        size: 18,
                                        color: HexColor("6A58D0"),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        "12 Feb 2021",
                                        style: TextStyle(
                                          fontSize: 9,
                                          fontFamily: "Josefin",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: HexColor(
                                    "#1F2137",
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    18,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                    10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GradientIcon(
                                        FontAwesomeIcons.boltLightning,
                                        13,
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
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        "Action",
                                        style: TextStyle(
                                          fontSize: 9,
                                          fontFamily: "Josefin",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: HexColor(
                                    "#1F2137",
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    18,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                    10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GradientIcon(
                                        FontAwesomeIcons.boltLightning,
                                        13,
                                        const LinearGradient(
                                          colors: <Color>[
                                            Color.fromRGBO(
                                              5,
                                              104,
                                              252,
                                              1,
                                            ),
                                            Color.fromRGBO(
                                              250,
                                              0,
                                              255,
                                              1,
                                            ),
                                            Color.fromRGBO(
                                              255,
                                              255,
                                              255,
                                              1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        "Adventure",
                                        style: TextStyle(
                                          fontSize: 9,
                                          fontFamily: "Josefin",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                            top: 8,
                          ),
                          child: Container(
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                              color: HexColor(
                                "#1F2137",
                              ),
                              borderRadius: BorderRadius.circular(
                                18,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(
                                10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(
                                    FontAwesomeIcons.tag,
                                    color: Color.fromRGBO(254, 179, 78, 1),
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "30% OFF ",
                                    style: TextStyle(
                                      fontSize: 9,
                                      fontFamily: "Josefin",
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                            top: 8,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Download",
                                style: TextStyle(
                                  fontFamily: "Josefin",
                                  color: HexColor(
                                    "#696C75",
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 30,
                                  width: 10,
                                  child: Image.asset(
                                    "assets/images/Vector(12).png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  child: Image.asset(
                                    "assets/images/android.png",
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Image.asset(
                                  "assets/images/Vector(7).png",
                                ),
                              ),
                              Expanded(
                                child: Image.asset(
                                  "assets/images/Vector(8).png",
                                ),
                              ),
                              Expanded(
                                child: Image.asset(
                                  "assets/images/Vector(9).png",
                                ),
                              ),
                              Expanded(
                                child: Image.asset(
                                  "assets/images/Vector(10).png",
                                ),
                              ),
                              Expanded(
                                child: Image.asset(
                                  "assets/images/Vector(11).png",
                                ),
                              ),
                            ],
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

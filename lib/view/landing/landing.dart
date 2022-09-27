import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:game_database/view/calender/calender.dart';
import 'package:game_database/view/favorite/favorite.dart';
import 'package:game_database/view/homescreen/homescreen.dart';
import 'package:hexcolor/hexcolor.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

TabController? _controller;

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  var currentIndex = 0;

  final screens = [
    const HomeScreen(),
    const Calender(),
  ];
  @override
  void initState() {
    _controller = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: HexColor("#050B18"),
        ),
        child: TabBar(
          controller: _controller,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: HexColor("#6249DE"),
                width: 5.0,
              ),
            ),
          ),
          overlayColor: MaterialStateProperty.all(
            Colors.white,
          ),
          labelStyle: const TextStyle(
            fontSize: 0,
          ),
          labelColor: HexColor("#6249DE"),
          unselectedLabelColor: Colors.grey,
          unselectedLabelStyle:
              const TextStyle(fontSize: 0, color: Colors.grey),
          tabs: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 5,
                ),
                Tab(
                  icon: FaIcon(
                    FontAwesomeIcons.listUl,
                  ),
                  text: '',
                ),
              ],
            ),
            Tab(
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.calendar_month,
                  ),
                ],
              ),
              text: '',
            ),
            Tab(
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    width: 5,
                  ),
                  FaIcon(
                    FontAwesomeIcons.heart,
                  ),
                ],
              ),
              text: '',
            ),
          ],
        ),
      ),

      // BottomNavigationBar(
      //   showSelectedLabels: false,
      //   selectedItemColor: HexColor("#6249DE"),
      //   unselectedItemColor: Colors.grey,
      //   showUnselectedLabels: false,
      //   backgroundColor: HexColor("#050B18"),
      //   type: BottomNavigationBarType.fixed,
      //   currentIndex: currentIndex,
      //   onTap: (index) {
      //     setState(() {
      //       currentIndex = index;
      //     });
      //   },
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: FaIcon(
      //           FontAwesomeIcons.listUl,
      //         ),
      //         label: "Home"),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.calendar_month,
      //       ),
      //       label: "OverView",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: FaIcon(
      //         FontAwesomeIcons.heart,
      //       ),
      //       label: "Category",
      //     ),
      //   ],
      // ),
      body: TabBarView(
        controller: _controller,
        children: [HomeScreen(), const Calender(), const Favorite()],
      ),
    );
  }
}


//i failed to get more api with photo and more details of the game from IGDB. so just put the game name only


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_database/view/homescreen/bloc/gamebloc_bloc.dart';
import 'package:game_database/widgets/chip.dart';
import 'package:game_database/widgets/chip_two.dart';
import 'package:game_database/widgets/game_card.dart';
import 'package:game_database/widgets/sliding_card.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(
        "#050B18",
      ),
      appBar: AppBar(
        title: const Text(
          "Jhon",
          style: TextStyle(
            fontFamily: "Josefin",
            fontStyle: FontStyle.normal,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(
                  8.0,
                ),
                child: Icon(
                  Icons.search,
                  color: HexColor("#6A58D0"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(
                  8.0,
                ),
                child: Icon(
                  Icons.notifications_none_outlined,
                  color: HexColor("#6A58D0"),
                ),
              )
            ],
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(
            8.0,
          ),
          child: CircleAvatar(
            foregroundColor: Colors.purple,
            backgroundColor: Colors.purple,
            child: SizedBox(
              height: 40,
              width: 40,
              child: Image.asset(
                "assets/images/Ellipse 2.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(
              1.0,
            ),
            child: Container(
              color: HexColor(
                "#2B2D47",
              ),
              height: 2.0,
            )),
        backgroundColor: HexColor(
          "#050B18",
        ),
      ),
      body: BlocBuilder<GameblocBloc, GameblocState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: const Center(child: CircularProgressIndicator()),
            );
          }
          if (state is DataLoaded) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 19,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Popular",
                      style: TextStyle(
                        fontSize: 23,
                        fontFamily: "Josefin",
                        color: HexColor(
                          "#7560E3",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, index) {
                          return SlidingCard(
                            gamename: state.gameModel[index].name!,
                          );
                        },
                        itemCount: state.gameModel.length,
                        separatorBuilder: ((context, index) => const SizedBox(
                              width: 30,
                            )),
                      ),
                    ),
                  ),
                  Divider(
                    color: HexColor(
                      "#2B2D47",
                    ),
                    thickness: 3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ChipWidget(),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ChipTwo(),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Today",
                      style: TextStyle(
                        fontSize: 23,
                        fontFamily: "Josefin",
                        color: HexColor(
                          "#7560E3",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   GameCard(
                    imageUrl: "assets/images/farcry.jpg",
                    gamename: state.gameModel[0].name!,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                   GameCard(
                    imageUrl: "assets/images/farcry.jpg",
                    gamename: state.gameModel[1].name!,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "This Week",
                      style: TextStyle(
                        fontSize: 23,
                        fontFamily: "Josefin",
                        color: HexColor(
                          "#7560E3",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   GameCard(
                    imageUrl: "assets/images/game.jpg",
                    gamename: state.gameModel[2].name!,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                   GameCard(
                    imageUrl: "assets/images/game.jpg",
                    gamename: state.gameModel[3].name!,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            );
          }
          if (state is ErrorState) {
            return Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          } else {
            return const Text(
              "Error",
              style: TextStyle(color: Colors.amber),
            );
          }
        },
      ),
    );
  }
}

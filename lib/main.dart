import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_database/view/homescreen/HomeScreen.dart';
import 'package:game_database/view/homescreen/bloc/gamebloc_bloc.dart';
import 'package:game_database/view/landing/landing.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        // fontFamily: "Josefin"
      ),
      home: BlocProvider(
        create: (context) => GameblocBloc()
          ..add(
            const LoadData(),
          ),
        child: const LandingPage(),
      ),
    );
  }
}

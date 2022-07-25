import 'package:chess_game/screens/loading_chess.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChessApp());
}

class ChessApp extends StatelessWidget {
  const ChessApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: const ChessSplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:chess_game/screens/home.dart';
import 'package:flutter/material.dart';

class ChessSplashScreen extends StatefulWidget {
  const ChessSplashScreen({Key? key}) : super(key: key);

  @override
  State<ChessSplashScreen> createState() => _ChessSplashScreenState();
}

class _ChessSplashScreenState extends State<ChessSplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/chess4.jpg"),
                      fit: BoxFit.fill)),
            ),
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: CircularProgressIndicator(
                color: Colors.lightGreen,
              ),
            )
          ],
        ),
      ),
    );
  }
}

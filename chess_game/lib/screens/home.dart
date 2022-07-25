import 'package:chess_game/screens/a.dart';
import 'package:chess_game/screens/exit.dart';
import 'package:chess_game/screens/play_chess.dart';
import 'package:chess_game/screens/v.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Exit oyundan_cikis_yap = Exit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Satranç Oyunu",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/chess2.jpeg"), fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.30,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: Card(
                    color: Colors.green,
                    child: IconButton(
                      color: Colors.white,
                      icon: const Icon(
                        Icons.play_arrow,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlayChess(
                                      mate: false,
                                    )));
                      },
                    ),
                  ),
                ),
                const Text(
                  "Oyna",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.30,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: Card(
                    color: Colors.green,
                    child: IconButton(
                      color: Colors.white,
                      icon: const Icon(Icons.settings),
                      onPressed: () {},
                    ),
                  ),
                ),
                const Text(
                  "Ayarlar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.30,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: Card(
                    color: Colors.green,
                    child: IconButton(
                      color: Colors.white,
                      icon: const Icon(Icons.exit_to_app),
                      onPressed: () {
                        oyundan_cikis_yap.oyundan_cik();
                      },
                    ),
                  ),
                ),
                const Text(
                  "Çıkış",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: buildDrawer(context),
    );
  }

  Drawer createMenuItems(BuildContext context) {
    Colors.green;
    createNavigationItem(var icon, String page, String routeName) {
      return Container(
        child: ListTile(
          leading: Icon(icon),
          title: Text(page),
          onTap: () {
            setState(() {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(routeName);
            });
          },
        ),
      );
    }

    var navigationList = [
      createNavigationItem(
          Icons.play_arrow, "Satranç Oyna", CustomerScreen.routeName),
      createNavigationItem(Icons.cast_for_education_outlined, "Satranç Öğren",
          ProductScreen.routeName),
      createNavigationItem(
          Icons.sports_score, "Satranç Tarihi", CustomerScreen.routeName),
      createNavigationItem(Icons.campaign_rounded, "Satranç Haberleri", "/"),
      createNavigationItem(
          Icons.exit_to_app_outlined, "Çıkış", CustomerScreen.routeName),
    ];
    ListView menuItems = ListView(
      children: navigationList,
    );
    return Drawer(
        child: Container(
            color: Colors.green,
            child:
                menuItems)); // buradaki renk bütün drawer in arkaplanını boyamaya yarar
  }

  buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.green,
      child: createMenuItems(context),
    );
  }
}

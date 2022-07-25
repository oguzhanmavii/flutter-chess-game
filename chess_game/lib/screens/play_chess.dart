import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

class PlayChess extends StatefulWidget {
  bool mate;

  PlayChess({Key? key, required this.mate}) : super(key: key);

  @override
  State<PlayChess> createState() => _PlayChessState();
}

class _PlayChessState extends State<PlayChess> {
  ChessBoardController controller = ChessBoardController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      controller.isCheckMate();
      controller.isDraw();
      controller.isStaleMate();
      //controller.getMoveCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Satranç Karşılaşması",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.green,
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Center(
                child: ChessBoard(
                  controller: controller,
                  boardColor: BoardColor.orange,
                  boardOrientation: PlayerColor.white,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ValueListenableBuilder<Chess>(
                valueListenable: controller,
                builder: (context, game, mate) {
                  return ListView(
                    children: [
                      Center(
                        child: Text(
                          controller.getSan().fold(
                                '',
                                (previousValue, element) =>
                                    previousValue + '\n' + (element ?? ''),
                              ),
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: ValueListenableBuilder<Chess>(
                valueListenable: controller,
                builder: (context, game, mate) {
                  return Center(
                    child: game.in_checkmate
                        ? const Text(
                            'Şahmat Oyun Bitti',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )
                        : const Text(
                            'Oyun Devam Ediyor',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

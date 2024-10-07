import 'package:flutter/material.dart';
import 'package:pr_5/components/info_ui.dart';
import 'package:pr_5/models/item.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key, required this.game});
  final Item game;
  @override
  Widget build(BuildContext context) {
    if (game.indicator == 1){
      return InfoUi(game: game,
        textColor: const Color.fromRGBO(129, 40, 0, 1.0),
        nameColor: 'brown',);
    }
    else if (game.indicator == 2){
      return InfoUi(game: game,textColor: const Color.fromRGBO(163, 3, 99, 1.0),
          nameColor: 'pink'
      );
    }
    else {
      return InfoUi(game: game, textColor: const Color.fromRGBO(48, 0, 155, 1.0),
          nameColor: 'blue'
      );
    }
  }
}






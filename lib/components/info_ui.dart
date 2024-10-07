import 'package:flutter/material.dart';
import 'package:pr_5/models/item.dart';

class InfoUi extends StatefulWidget {
  const InfoUi({super.key, required this.game, required this.textColor, required this.nameColor});
  final Item game;
  final Color textColor;
  final String nameColor;

  @override
  State<InfoUi> createState() => _InfoUiState();
}

class _InfoUiState extends State<InfoUi> {
  late Item game;
  late Color textColor;
  late String nameColor;

  void _deleteGame(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Center(
          child: Text('Удалить игру',
              style: TextStyle(
                color: Color.fromRGBO(76, 23, 0, 1.0),
                fontWeight: FontWeight.w500,
              )),
        ),
        content: const Text('Вы уверены, что хотите удалить эту игру?',
            style: TextStyle(
              color: Color.fromRGBO(76, 23, 0, 1.0),
              fontWeight: FontWeight.w400,
              fontSize: 16,
            )),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop(games.indexOf(game));
                },
                child: const Text('Да',
                    style: TextStyle(
                      color: Color.fromRGBO(21, 78, 24, 1.0),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    )),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Нет',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    game = widget.game;
    textColor = widget.textColor;
    nameColor = widget.nameColor;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(game.title, style: TextStyle(
          color: textColor,
          fontSize: 28,
          fontWeight: FontWeight.w600,
        ),
        ),
        backgroundColor: const Color.fromRGBO(235, 234, 248, 1.0),
      ),

      body: Container(
        color: const Color.fromRGBO(235, 234, 248, 1.0),
        child:
        ListView(
          padding: const EdgeInsets.only(
            right: 20.0,
            left: 20.0,
          ),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      game.changeFavorite();
                    });
                  },
                  child: Icon(
                    game.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: textColor,
                  ),
                ),

                IconButton(
                  icon: Icon(Icons.delete, color: textColor),
                  onPressed: () => _deleteGame(games.indexOf(game)),
                ),
      ]
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)
              ),
              child: Image(
                image: NetworkImage(
                    game.image
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                top: 13.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 5.0),
                        child: Image( image: AssetImage('lib/assets/groups_$nameColor.png' ),
                          width: 18,
                        ),
                      ),
                      Text(game.gamers, style:
                      TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: textColor,
                      )
                      ),
                    ],
                  ),


                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Image( image: AssetImage('lib/assets/clock_$nameColor.png'),
                          width: 18,
                        ),
                      ),
                      Text(game.time, style:
                      TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: textColor,
                      ),
                      ),
                    ],
                  ),

                  Text('${game.age}+', style:
                  TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0
                      ),
                      child: Text('Цена: ',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,

                        ),
                        textAlign: TextAlign.left,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0
                      ),
                      child: Text('${game.price} ₽',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,

                        ),
                        textAlign: TextAlign.left,),
                    ),
                  ],
                ),


                Padding(
                  padding: const EdgeInsets.only(
                      top: 25.0, bottom: 10.0),
                  child: Text('Правила',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Text(game.rules, style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                    textAlign: TextAlign.justify,
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

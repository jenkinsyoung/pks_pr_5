import 'package:flutter/material.dart';
import 'package:pr_5/models/item.dart';
import 'package:pr_5/pages/info_page.dart';
class ItemUi extends StatefulWidget {
  const ItemUi({super.key, required this.game, required this.bodyColor, required this.textColor});
  final Item game;
  final Color bodyColor;
  final Color textColor;

  @override
  State<ItemUi> createState() => _ItemUiState();
}

class _ItemUiState extends State<ItemUi> {
  late Item game;
  @override
  void initState() {
    super.initState();
    game = widget.game;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 5.0,
        bottom: 8.0,
      ),

      child: Container(
        height: 190,
        width: 192,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(2, 4),
            ),
          ],
        ),

        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image(
                image: NetworkImage(
                    game.image
                ),
                width: 192,

              ),
            ),

            Positioned(
              top: 8.0,
              left: 8.0,
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: widget.bodyColor,
                  borderRadius: BorderRadius.circular(45),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                child: Center( child: Text('${game.age}+', style: TextStyle(
                  fontSize: 10,
                  color: widget.textColor,
                  fontWeight: FontWeight.w600,
                ),
                ),
                ),
              ),
            ),
            Positioned(
              top: 8.0,
              right: 8.0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    game.changeFavorite();
                  });
                },
                child: Icon(
                  game.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: widget.bodyColor,
                ),
              ),
            ),
            Positioned(
              top: 101,
              child: Container(
                height: 88,
                width: 192,
                decoration: BoxDecoration(
                    color: widget.bodyColor,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5.0,
                        left: 5.0,
                        bottom: 5.0,
                      ),
                      child: Text(game.title, style: TextStyle(
                        fontSize: 12,
                        color: widget.textColor,
                        fontWeight: FontWeight.w600,
                      ),
                      ),
                    ),
                    Container(
                      width: 164,
                      height: 0,
                      decoration:
                      BoxDecoration(
                        border: Border(
                            top: BorderSide(width: 1.0,
                            color: widget.textColor,
                          )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0,
                          left: 8.0,
                          right: 8.0
                      ),
                      child: Text(game.description ,
                        style: TextStyle(
                          fontSize: 8,
                          color: widget.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                        bottom: 7.0,
                        top: 5.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${game.price} ₽', style: TextStyle(
                            fontSize: 12,
                            color: widget.textColor,
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => InfoPage(game: game),
                                ),
                              );
                            }, child: Text('Подробнее >>',
                            style: TextStyle(
                              fontSize: 10,
                              color: widget.textColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              )
            ),
          ],
        ),
      ),
    );
  }
}


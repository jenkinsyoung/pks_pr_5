import 'package:flutter/material.dart';
import 'package:pr_5/models/item.dart';
import 'package:pr_5/pages/info_page.dart';
import 'package:pr_5/components/item_list.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  void _removeGame(int index) {
    setState(() {
      games.removeAt(index);
    });
  }

  List<Item> get favoriteGames {
    return games.where((game) => game.isFavorite).toList();
  }
  @override
  Widget build(BuildContext context) {
    final List<Item> filteredGames = favoriteGames;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Настольные игры',
            style: TextStyle(
              color: Color.fromRGBO(76, 23, 0, 1.0),
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: filteredGames.isEmpty
          ?  const Center(
            child: Padding(
              padding: EdgeInsets.only(
                right: 20.0,
                left: 20.0,
              ),
              child: Text(
                'У Вас нет избранных товаров',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(76, 23, 0, 1.0),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
            :  Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: filteredGames.length,
                itemBuilder: (BuildContext context, int index) {
                  final int originalIndex = games.indexOf(filteredGames[index]);
                  return GestureDetector(
                    onTap: () async {
                      final result = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => InfoPage(game: games[originalIndex]),
                        ),
                      );
                      if (result != null && result is int) {
                        setState(() {
                          _removeGame(originalIndex);
                        });
                      }
                    },
                    child: ItemList(
                        key: Key(filteredGames[index].title),
                        game: filteredGames[index]),
                  );
              },
              ),
      ),
    );
  }
}

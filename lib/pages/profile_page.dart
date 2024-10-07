import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Профиль',
            style: TextStyle(
              color: Color.fromRGBO(76, 23, 0, 1.0),
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: NetworkImage('https://i.pinimg.com/474x/ed/b6/d9/edb6d911b0edf65204fb3751c61c5fa9.jpg'),
                                fit: BoxFit.cover
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                                color: const Color.fromRGBO(76, 23, 0, 1.0),
                                width: 2
                            )
                        ),
                      ),
                      const Column(
                        children: [
                          Text('Полошкова Анастасия',
                              style:  TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(76, 23, 0, 1.0),
                              )),
                          SizedBox(height: 15),
                          Text('poloshkova.a.y@edu.mirea.ru',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color.fromRGBO(76, 23, 0, 1.0),
                              ))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}

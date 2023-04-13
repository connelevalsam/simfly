import 'package:flutter/material.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Salad',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Text(
                      'Qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Text(
                    '\u{20A6} 3,000.00',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/banner02.jpg"),
              radius: 50,
            ),
            bottom: 1,
            right: 5,
          ),
        ],
      ),
    );
  }
}

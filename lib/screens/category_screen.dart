import 'package:flutter/material.dart';

import '../themes/themes.dart';
import 'details_screen.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: Text(
                "What do you need help with?",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => DetailsScreen()));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/bg1.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            child: Container(
                              color: Colors.black45,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Shopping',
                                  style: Themes.whiteText.headline6,
                                ),
                              ),
                            ),
                            bottom: 1,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

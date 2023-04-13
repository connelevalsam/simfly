import 'package:flutter/material.dart';

import '../widgets/favorite_widget.dart';

class FovoriteScreen extends StatefulWidget {
  const FovoriteScreen({Key? key}) : super(key: key);

  @override
  State<FovoriteScreen> createState() => _FovoriteScreenState();
}

class _FovoriteScreenState extends State<FovoriteScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      color: Colors.grey.shade400,
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: ListView.builder(
          itemBuilder: (_, i) => const FavoriteWidget(),
          itemCount: 7,
        ),
      ),
    ));
  }
}

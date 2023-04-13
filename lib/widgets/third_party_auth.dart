import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ThirdPartyAuth extends StatelessWidget {
  const ThirdPartyAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/email_box.svg",
            height: 64,
            width: 64,
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/apple_box.svg",
            height: 64,
            width: 64,
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/google_box.svg",
            height: 64,
            width: 64,
          ),
        ),
      ],
    );
  }
}

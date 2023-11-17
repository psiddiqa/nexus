import 'package:flutter/material.dart';

import '../../Utils/Colors.dart';

class CommonRequiedTextWidget extends StatelessWidget {
  String text;
  CommonRequiedTextWidget({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(text: text, style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: secondryColor)),
      const TextSpan(
        text: " *",
        style: TextStyle(color: Colors.red, fontFamily: "Gilroy Bold", fontWeight: FontWeight.bold),
      ),
    ]));
  }
}

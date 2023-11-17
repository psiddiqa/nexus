import 'package:flutter/material.dart';

import '../../Utils/Colors.dart';

Widget CommonAppBar(String name, {List<Widget>? actions}) {
  return AppBar(
    backgroundColor: primaryColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(24),
      ),
    ),
    title: Text(
      name,
      style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: WhiteColor),
      overflow: TextOverflow.ellipsis,
    ),
    actions: actions,
  );
}

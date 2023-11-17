// ignore_for_file: prefer_const_constructors, file_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mailto/mailto.dart';
import 'package:nedusoft/core/widget/common_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:nedusoft/Utils/Colors.dart';

import '../../Utils/Custom_widget.dart';
import '../../Utils/custom_snackbar.dart';

class SupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WhiteColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
        ),
        child: InkWell(
          onTap: () async {
            await launchUrl(Uri.parse("https://nedusoft.com/"));
          },
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                  text: "Powered by ",
                  style: TextStyle(color: secondryColor),
                ),
                TextSpan(
                  text: "NEDUSOFT",
                  style: TextStyle(decoration: TextDecoration.underline, color: secondryColor, fontFamily: "Gilroy Bold", fontWeight: FontWeight.bold),
                ),
              ])),
        ),
      ),
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.sizeOf(context).width, 60), child: CommonAppBar("Support")),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 54),
          child: Text(
            "Select How Do You Want To Connect?",
            style: TextStyle(fontSize: 24, color: secondryColor, fontFamily: "Gilroy Bold"),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.1,
        ),
        Divider(
          thickness: 1.5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Email",
                style: TextStyle(fontSize: 18, color: secondryColor, fontFamily: "Gilroy Medium"),
              ),
              InkWell(
                onTap: () async {
                  await Clipboard.setData(ClipboardData(text: "support@nexusinfo.com"));
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Copy Email ID"),
                  ));
                  final mailtoLink = Mailto(
                    to: ['support@nexusinfo.com'],
                    subject: 'subject',
                    body: 'body',
                  ).toString();
                  await canLaunchUrl(Uri.parse(mailtoLink));
                  await launchUrl(Uri.parse(mailtoLink));
                },
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: primaryColor,
                  child: Icon(
                    Icons.arrow_right,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        Divider(
          thickness: 1.5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Book a Meeting",
                style: TextStyle(fontSize: 18, color: secondryColor, fontFamily: "Gilroy Medium"),
              ),
              InkWell(
                onTap: () {
                  showCustomSnackbar(msg: "Coming Soon", title: "Features");
                },
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: primaryColor,
                  child: Icon(
                    Icons.arrow_right,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        Divider(
          thickness: 1.5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Chat",
                style: TextStyle(fontSize: 18, color: secondryColor, fontFamily: "Gilroy Medium"),
              ),
              InkWell(
                onTap: () {
                  showCustomSnackbar(msg: "Coming Soon", title: "Features");
                },
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: primaryColor,
                  child: Icon(
                    Icons.arrow_right,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        Divider(
          thickness: 1.5,
        ),
      ]),
    );
  }
}

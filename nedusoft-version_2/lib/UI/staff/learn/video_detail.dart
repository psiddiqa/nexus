// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:get/get.dart';
import 'package:nedusoft/Utils/Colors.dart';
import 'package:nedusoft/Utils/custom_snackbar.dart';
import 'package:nedusoft/models/staff/get_faculty_videos.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../models/staff/submit_ass_detail_model.dart';

// ignore: must_be_immutable
class VideoDetailScreen extends StatelessWidget {
  ListElement model;
  VideoDetailScreen({
    required this.model,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.sizeOf(context).width, 60),
          child: AppBar(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(24),
              ),
            ),
            title: Text(
              "Video Details",
              style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: WhiteColor),
              overflow: TextOverflow.ellipsis,
            ),
          )),
      backgroundColor: WhiteColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Get.height * 0.02),
                  profile(text: "Topic", detailstext: model.topic ?? ""),
                  profile(text: "Chapter", detailstext: model.chapter ?? ""),
                  profile(text: "Class Name", detailstext: model.className ?? ""),
                  profile(text: "Subject", detailstext: model.subject ?? ""),
                  profile(text: "Faculty", detailstext: model.createdBy ?? ""),
                  profile(text: "Publisher", detailstext: model.publisher ?? ""),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width * 0.40,
                              child: Text("Link", style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                            ),
                            SizedBox(
                                width: Get.width * 0.53,
                                child: Linkify(
                                  onOpen: (link) async {
                                    if (!await launchUrl(Uri.parse(link.url))) {
                                      throw Exception('Could not launch ${link.url}');
                                    }
                                  },
                                  text: model.link ?? "",
                                )),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.015),
                        Divider(color: greycolor, thickness: 1),
                        SizedBox(height: Get.height * 0.015),
                      ],
                    ),
                  ),
                  profile(text: "Is Publish", detailstext: model.isPublished ?? false ? "Yes" : "No"),
                  // profile(
                  //     text: "Uploaded Attachment",
                  //     detailstext: model.fileName ?? "",
                  //     addWidget: InkWell(
                  //       onTap: () async {
                  //         showCustomSnackbar(msg: "", title: "No Attachment Found");
                  //       },
                  //       child: SizedBox(
                  //         width: Get.width * 0.53,
                  //         child: Text("View/Download", style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: secondryColor, decoration: TextDecoration.underline)),
                  //       ),
                  //     )),
                  SizedBox(height: Get.height * 0.05),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  profile({String? text, detailstext, Widget? addWidget}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width * 0.40,
                child: Text(text!, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
              ),
              addWidget ??
                  SizedBox(
                    width: Get.width * 0.53,
                    child: Text(detailstext.toString(), style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: secondryColor)),
                  ),
            ],
          ),
          SizedBox(height: Get.height * 0.015),
          Divider(color: greycolor, thickness: 1),
          SizedBox(height: Get.height * 0.015),
        ],
      ),
    );
  }
}

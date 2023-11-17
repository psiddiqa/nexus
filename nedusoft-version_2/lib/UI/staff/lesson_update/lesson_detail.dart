// ignore_for_file: prefer_const_constructors, file_names

import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nedusoft/Utils/Colors.dart';
import 'package:nedusoft/Utils/custom_snackbar.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../models/staff/submit_ass_detail_model.dart';
import '../../../app/app.router.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../models/staff/lesson_onpage_model.dart';

class StaffLessonDetail extends StatefulWidget {
  LessonUpdateOnPageLoadModel model;
  StaffLessonDetail({
    required this.model,
    super.key,
  });

  @override
  State<StaffLessonDetail> createState() => _StaffLessonDetailState();
}

class _StaffLessonDetailState extends State<StaffLessonDetail> {
  final NavigationService _navigationService = locator<NavigationService>();
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
              "View Lesson Details",
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
                  profile(text: "Topic Id", detailstext: widget.model.topicId ?? ""),
                  profile(text: "Class Name", detailstext: widget.model.className ?? ""),
                  profile(text: "Subject Name", detailstext: widget.model.subjectName ?? ""),
                  profile(text: "Topic", detailstext: widget.model.topic),
                  profile(text: "Notes", detailstext: widget.model.notes),
                  profile(text: "Session", detailstext: widget.model.session),
                  profile(
                      text: "Uploaded Attachment",
                      detailstext: widget.model.extension ?? "",
                      addWidget: InkWell(
                        onTap: () async {
                          if (widget.model.url != null) {
                            final file = await loadPdfFromNetwork(widget.model.url ?? "");
                            openPdf(file, widget.model.url ?? "", widget.model.extension ?? "");
                          } else {
                            showCustomSnackbar(msg: "", title: "No Attachment Found");
                          }
                        },
                        child: SizedBox(
                          width: Get.width * 0.53,
                          child: Text("View/Download", style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: secondryColor, decoration: TextDecoration.underline)),
                        ),
                      )),
                  SizedBox(height: Get.height * 0.05),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<File> loadPdfFromNetwork(String url) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    return _storeFile(url, bytes);
  }

  Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    if (kDebugMode) {
      print('$file');
    }
    return file;
  }

  void openPdf(File file, String url, String name) {
    _navigationService.navigateTo(Routes.pdfViewer, arguments: PdfViewerArguments(file: file, url: url, fileName: name));
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

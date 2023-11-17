// ignore_for_file: prefer_const_constructors, file_names

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:http/http.dart' as http;
import 'package:nedusoft/Utils/Colors.dart';
import 'package:nedusoft/Utils/custom_snackbar.dart';
import 'package:nedusoft/app/app.router.dart';
import 'package:nedusoft/models/student/student_assignment_detail_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../core/service_locator/service_locator.dart';
import 'assignment_detail_view_model.dart';

// ignore: must_be_immutable
class AssignmentHistoryScreen extends StatefulWidget {
  String subject;
  String assignId;
  List<Data> dataList;
  AssignmentHistoryScreen({
    required this.assignId,
    required this.subject,
    required this.dataList,
    super.key,
  });

  @override
  State<AssignmentHistoryScreen> createState() => _AssignmentHistoryScreenState();
}

class _AssignmentHistoryScreenState extends State<AssignmentHistoryScreen> {
  final DateFormat dateFormat = DateFormat("hh:mm a");
  final NavigationService _navigationService = locator<NavigationService>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      progressIndicator: const CircularProgressIndicator(
        color: Colors.white,
      ),
      opacity: 0.5,
      child: Scaffold(
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
                  "${widget.subject} ${widget.assignId} Assignment",
                  style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: WhiteColor),
                  overflow: TextOverflow.ellipsis,
                ),
              )),
          backgroundColor: WhiteColor,
          body: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            physics: const BouncingScrollPhysics(),
            itemCount: widget.dataList.length,
            itemBuilder: (BuildContext context, int index) {
              Data c = widget.dataList[index];

              return Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.32,
                        child: Row(
                          children: [
                            Text(
                              c.assignDate ?? "",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                            const SizedBox(width: 20.0),
                            _getTime(c, context),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Text(
                        c.remarks ?? "Remark",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(width: 20.0),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.28, bottom: 20.0),
                        width: 2,
                        height: 60.0,
                        color: primaryColor,
                      ),
                      const SizedBox(width: 28.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                              onTap: () async {
                                if (c.filePath != null) {
                                  final file = await loadPdfFromNetwork(c.filePath ?? "");
                                  openPdf(file, c.filePath ?? "", c.fileName ?? "");
                                } else {
                                  showCustomSnackbar(msg: "", title: "No Attachment Found");
                                }
                              },
                              child: SizedBox(width: MediaQuery.sizeOf(context).width * 0.5, child: Text("View/Download", maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: secondryColor, decoration: TextDecoration.underline)))),
                          SizedBox(
                            height: 12,
                          ),
                          SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              child: Text(c.fileName ?? "",
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Gilroy Medium",
                                    color: BlackColor,
                                  )))
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 20.0),
                ],
              );
            },
          )),
    );
  }

  _getTime(Data c, context) {
    return Container(
      height: 25.0,
      width: 25.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: primaryColor,
          // width: 2.0,
        ),
      ),
      child: _getChild(c, context),
    );
  }

  _getChild(Data c, context) {
    Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: primaryColor,
        shape: BoxShape.circle,
      ),
    );

    return null;
  }

  Future<File> loadPdfFromNetwork(String url) async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    setState(() {
      isLoading = false;
    });
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
}

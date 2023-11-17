// ignore_for_file: prefer_const_constructors, file_names

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'package:nedusoft/Utils/Colors.dart';
import 'package:nedusoft/Utils/custom_snackbar.dart';
import 'package:stacked/stacked.dart';

import '../../../../models/staff/submit_ass_detail_model.dart';
import 'assignment_detail_view_model.dart';

// ignore: must_be_immutable
class AssignmentDetailScreen extends StatelessWidget {
  bool complete;
  String assignId;
  AssignmentDetailScreen({
    required this.assignId,
    required this.complete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (model) => model.init(assignId),
        viewModelBuilder: () => AssigmentdetailViewModel(),
        builder: (context, model, child) => LoadingOverlay(
              isLoading: model.isBusy,
              progressIndicator: const CircularProgressIndicator(
                color: Colors.white,
              ),
              opacity: 0.5,
              child: Scaffold(
                bottomNavigationBar: complete
                    ? SizedBox()
                    : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
                  child: InkWell(
                    // onTap: ontap,
                    onTap: () async {
                      if (model.file != null) {
                        await model.assignmentSumbit();
                      } else {
                        showCustomSnackbar(msg: "First Select File.....", title: "Select File");
                      }
                      // Get.to(StaffAttendanceShow());
                    },
                    child: Container(
                        height: 50,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: primaryColor),
                        child: Center(
                          child: Text("SUBMIT", style: TextStyle(color: WhiteColor, fontSize: 19, fontFamily: "Gilroy Bold")),
                        )),
                  ),
                ),
                appBar: PreferredSize(
                    preferredSize: Size(MediaQuery.sizeOf(context).width, 60),
                    child: AppBar(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(24),
                        ),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(right: 12, top: 22),
                          child: InkWell(
                            onTap: () {
                              model.navigateToHistoryScreen();
                            },
                            child: Text(
                              "History",
                              style: TextStyle(fontSize: 12, fontFamily: "Gilroy Medium", color: WhiteColor),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                      title: Text(
                        "View Assignment",
                        style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: WhiteColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
                backgroundColor: WhiteColor,
                body: Column(
                  children: [
                    model.isBusy
                        ? SizedBox()
                        : Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(height: Get.height * 0.02),
                                  profile(text: "Assignment No.", detailstext: model.getSubmittedAssignmentDetailsModel?.data?.assignNo ?? ""),
                                  profile(text: "Faculty", detailstext: model.getSubmittedAssignmentDetailsModel?.data?.faculty ?? ""),
                                  profile(text: "Assignment Date", detailstext: model.getSubmittedAssignmentDetailsModel?.data?.assignDate ?? ""),
                                  profile(text: "Submission date", detailstext: model.getSubmittedAssignmentDetailsModel?.data?.submiDate ?? ""),
                                  profile(text: "Status", detailstext: model.getSubmittedAssignmentDetailsModel?.data?.status ?? ""),
                                  profile(text: "Semester/Class", detailstext: model.getSubmittedAssignmentDetailsModel?.data?.className ?? ""),
                                  profile(text: "Section", detailstext: model.getSubmittedAssignmentDetailsModel?.data?.section ?? ""),
                                  profile(text: "Assigned By", detailstext: model.getSubmittedAssignmentDetailsModel?.data?.assignedBy ?? ""),
                                  profile(text: "Subject", detailstext: model.getSubmittedAssignmentDetailsModel?.data?.subject ?? ""),
                                  profile(text: "Chapter", detailstext: model.getSubmittedAssignmentDetailsModel?.data?.chapter ?? ""),
                                  profile(text: "Assignment Topic", detailstext: model.getSubmittedAssignmentDetailsModel?.data?.assignTopic ?? ""),
                                  profile(text: "Assignment Notes", detailstext: model.getSubmittedAssignmentDetailsModel?.data?.assignNote ?? ""),
                                  profile(
                                      noSpace: true,
                                      text: "Faculty Attachment",
                                      detailstext: model.getSubmittedAssignmentDetailsModel?.data?.fileName ?? "",
                                      addWidget: InkWell(
                                        onTap: () async {
                                          if (model.getSubmittedAssignmentDetailsModel!.data!.filePath != null) {
                                            final file = await model.loadPdfFromNetwork(model.getSubmittedAssignmentDetailsModel!.data!.filePath ?? "");
                                            model.openPdf(file, model.getSubmittedAssignmentDetailsModel!.data!.filePath ?? "", model.getSubmittedAssignmentDetailsModel?.data?.fileName ?? "");
                                          } else {
                                            showCustomSnackbar(msg: "", title: "No Attachment Found");
                                          }
                                        },
                                        child: SizedBox(
                                          child: Text("View/Download", style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: secondryColor, decoration: TextDecoration.underline)),
                                        ),
                                      )),
                                  if (!complete) ...[
                                    // dateField.text = DateFormat.yMd().format(DateTime.now());
                                    SizedBox(height: Get.height * 0.015),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: Column(children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: Get.width * 0.40,
                                              child: Text("Followup Date ", style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                            ),
                                            SizedBox(
                                              width: Get.width * 0.53,
                                              child: Text(DateFormat("dd-MM-yyyy").format(DateTime.now()), style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: secondryColor)),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: Get.height * 0.015),
                                        Divider(color: greycolor, thickness: 1),
                                        SizedBox(),
                                      ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 40,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.sizeOf(context).width * 0.4,
                                                  child: Text("Remarks", style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                                ),
                                                Expanded(
                                                  child: TextFormField(
                                                    decoration: InputDecoration(disabledBorder: InputBorder.none, border: InputBorder.none, hintText: 'Enter Remarks', contentPadding: EdgeInsets.all(0)),
                                                    maxLines: 1,
                                                    controller: model.remark,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(color: greycolor, thickness: 1),
                                          SizedBox(height: Get.height * 0.015),
                                        ],
                                      ),
                                    ),
                                    profile(
                                        text: "Upload Attachment",
                                        detailstext: model.getSubmittedAssignmentDetailsModel?.data?.fileName ?? "",
                                        addWidget: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                await model.pickFile();
                                              },
                                              child: Container(
                                                height: 20,
                                                padding: EdgeInsets.all(2),
                                                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3), border: Border.all(color: Colors.black, width: 1)),
                                                child: Center(
                                                  child: Text("Choose File", style: TextStyle(fontSize: 10, fontFamily: "Gilroy Medium", color: Colors.black)),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: MediaQuery.sizeOf(context).width * 0.3, child: Text(model.baseName == null ? " No file Chosen" : model.baseName!, style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 12, fontFamily: "Gilroy Regular", color: Colors.black))),
                                          ],
                                        )),
                                  ],
                                  SizedBox(height: Get.height * 0.05),
                                ],
                              ),
                            ),
                          )
                  ],
                ),
              ),
            ));
  }

  profile({String? text, detailstext, Widget? addWidget, bool? noSpace}) {
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
          noSpace != null ? SizedBox() : SizedBox(height: Get.height * 0.015),
        ],
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, file_names

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/UI/staff/assignment/submit_assignmnet/submit_ass_detail_view_model.dart';

import 'package:nedusoft/Utils/Colors.dart';
import 'package:nedusoft/Utils/custom_snackbar.dart';
import 'package:stacked/stacked.dart';

import '../../../../models/staff/submit_ass_detail_model.dart';

// ignore: must_be_immutable
class StaffSubmitAssDetail extends StatelessWidget {
  String assignId;
  StaffSubmitAssDetail({
    required this.assignId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (model) => model.init(assignId),
        viewModelBuilder: () => SubmitAssigmentdetailViewModel(),
        builder: (context, model, child) => LoadingOverlay(
              isLoading: model.isBusy,
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
                                  profile(text: "Assignment No.", detailstext: model.getSubmittedAssignmentDetailsModel!.data!.assignNo ?? ""),
                                  profile(text: "Student Name", detailstext: model.getSubmittedAssignmentDetailsModel!.data!.student ?? ""),
                                  profile(text: "Faculty", detailstext: model.getSubmittedAssignmentDetailsModel!.data!.faculty ?? ""),
                                  profile(text: "Assignment Date", detailstext: model.getSubmittedAssignmentDetailsModel!.data!.assignDate ?? ""),
                                  profile(text: "Submission date", detailstext: model.getSubmittedAssignmentDetailsModel!.data!.submiDate ?? ""),
                                  model.getSubmittedAssignmentDetailsModel!.data!.status == "Complete"
                                      ? profile(text: "Status", detailstext: model.getSubmittedAssignmentDetailsModel!.data!.status ?? "")
                                      : Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 12),
                                          child: Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: Get.width * 0.40,
                                                    child: Text("Status", style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                                  ),
                                                  Container(
                                                    height: 20,
                                                    width: Get.width * 0.50,
                                                    margin: EdgeInsets.only(right: 12),
                                                    // padding: EdgeInsets.only(left: 4),
                                                    // decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: WhiteColor, border: Border.all(color: secondryColor)),
                                                    child: Center(
                                                      child: DropdownButton(
                                                        // padding: EdgeInsets.symmetric(horizontal: 10),
                                                        borderRadius: BorderRadius.circular(10),
                                                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                                                        iconSize: 20,
                                                        isExpanded: true,
                                                        underline: const SizedBox(),
                                                        value: model.selectStatus ?? model.statusList[0],
                                                        onChanged: (newvalue) async {
                                                          model.changeStatusValue(newvalue as ClassList);
                                                          await model.assignmentUpdate();
                                                        },
                                                        items: model.statusList.map((ClassList valueItem) {
                                                          return DropdownMenuItem<ClassList>(
                                                            value: valueItem,
                                                            child: Text(valueItem.text!, style: TextStyle(color: secondryColor, fontFamily: 'Gilroy Medium', fontSize: 16)),
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: Get.height * 0.015),
                                              Divider(color: greycolor, thickness: 1),
                                              SizedBox(height: Get.height * 0.015),
                                            ],
                                          ),
                                        ),
                                  profile(text: "Semester/Class", detailstext: model.getSubmittedAssignmentDetailsModel!.data!.className ?? ""),
                                  profile(text: "Section", detailstext: model.getSubmittedAssignmentDetailsModel!.data!.section ?? ""),
                                  profile(text: "Assigned By", detailstext: model.getSubmittedAssignmentDetailsModel!.data!.assignedBy ?? ""),
                                  profile(text: "Subject", detailstext: model.getSubmittedAssignmentDetailsModel!.data!.subject ?? ""),
                                  profile(text: "Chapter", detailstext: model.getSubmittedAssignmentDetailsModel!.data!.chapter ?? ""),
                                  profile(text: "Assignment Topic", detailstext: model.getSubmittedAssignmentDetailsModel!.data!.assignTopic ?? ""),
                                  profile(text: "Assignment Notes", detailstext: model.getSubmittedAssignmentDetailsModel!.data!.assignNote ?? ""),
                                  profile(
                                      text: "Uploaded Attachment",
                                      detailstext: model.getSubmittedAssignmentDetailsModel!.data!.fileName ?? "",
                                      addWidget: InkWell(
                                        onTap: () async {
                                          if (model.getSubmittedAssignmentDetailsModel!.data!.filePath != null) {
                                            final file = await model.loadPdfFromNetwork(model.getSubmittedAssignmentDetailsModel!.data!.filePath ?? "");
                                            model.openPdf(file, model.getSubmittedAssignmentDetailsModel!.data!.filePath ?? "", model.getSubmittedAssignmentDetailsModel!.data!.fileName ?? "");
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
              ),
            ));
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

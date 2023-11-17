// ignore_for_file: file_names, prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nedusoft/core/widget/text_widget.dart';
import 'package:nedusoft/Utils/Colors.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/models/student/student_staff_model.dart';
import 'package:stacked/stacked.dart';
import '../../../core/widget/common_app_bar.dart';
import '../../Utils/custom_snackbar.dart';
import '../../main.dart';
import 'add_feedback_viewmodel.dart';

class StudentAddFeedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) => viewModel.init(),
        viewModelBuilder: () => StudentAddFeedbackViewModel(),
        builder: (context, model, child) => LoadingOverlay(
              isLoading: model.isBusy,
              progressIndicator: const CircularProgressIndicator(
                color: Colors.white,
              ),
              opacity: 0.5,
              child: Scaffold(
                  appBar: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, 60), child: CommonAppBar("Add Feedback")),
                  bottomNavigationBar: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
                    child: InkWell(
                      // onTap: ontap,
                      onTap: () async {
                        if (model.selectStaff != null) {
                          await model.navigateToAddScreen();
                          log("message");
                        } else {
                          showCustomSnackbar(msg: "Please Select Required fields", type: SnackbarType.failure);
                        }
                        // Get.to(StaffAttendanceShow());
                      },
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: primaryColor),
                          child: Center(
                            child: Text("ADD", style: TextStyle(color: WhiteColor, fontSize: 19, fontFamily: "Gilroy Bold")),
                          )),
                    ),
                  ),
                  backgroundColor: WhiteColor,
                  body: SingleChildScrollView(
                    child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                      SizedBox(height: Get.height * 0.012),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonRequiedTextWidget(text: "Faculty"),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.sizeOf(context).width,
                              margin: EdgeInsets.only(right: 12),
                              padding: EdgeInsets.only(left: 4),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: WhiteColor, border: Border.all(color: secondryColor)),
                              child: Center(
                                child: DropdownButton(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  borderRadius: BorderRadius.circular(10),
                                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                                  iconSize: 20,
                                  isExpanded: true,
                                  underline: const SizedBox(),
                                  value: model.selectStaff ?? model.staffList[0],
                                  onChanged: (newvalue) {
                                    model.changeChapterValue(newvalue as ListElement);
                                  },
                                  items: model.staffList.map((ListElement valueItem) {
                                    return DropdownMenuItem<ListElement>(
                                      value: valueItem,
                                      child: Text(valueItem.text!, style: TextStyle(color: BlackColor, fontFamily: 'Gilroy Medium', fontSize: 16)),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            CommonRequiedTextWidget(text: "FeedBack"),
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: secondryColor),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: secondryColor),
                                    ),
                                    hintText: ''),
                                maxLines: 1,
                                controller: model.feedback,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text("File", style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: secondryColor)),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    await model.pickFile();
                                  },
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width * 0.3,
                                    height: 30,
                                    decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3), border: Border.all(color: Colors.black, width: 1)),
                                    child: Center(
                                      child: Text("Choose File", style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: Colors.black)),
                                    ),
                                  ),
                                ),
                                SizedBox(width: MediaQuery.sizeOf(context).width * 0.6, child: Text(model.file == null ? "No file Chosen" : model.baseName!, style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 18, fontFamily: "Gilroy Regular", color: Colors.black))),
                              ],
                            ),
                            SizedBox(
                              height: 32,
                            ),
                          ],
                        ),
                      )
                    ]),
                  )),
            ));
  }
}

// ignore_for_file: file_names, prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nedusoft/Utils/Colors.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/core/widget/text_widget.dart';
import 'package:nedusoft/models/get_status_model.dart';
import 'package:nedusoft/models/getall_section_model.dart';
import 'package:nedusoft/models/getall_subject_model.dart';
import 'package:nedusoft/models/getattendance_model.dart';
import 'package:stacked/stacked.dart';
import '../../../Utils/custom_snackbar.dart';
import '../../../core/widget/common_app_bar.dart';
import '../../../main.dart';
import '../../../models/staff/get_specific_assignment.dart';
import '../../../Utils/Custom_widget.dart';
import 'edit_assignment_view_model.dart';

class StaffEditAssignment extends StatelessWidget {
  
  String? assignId;
  StaffEditAssignment({super.key, this.assignId});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) => viewModel.init(assignId!),
        viewModelBuilder: () => StaffEditAssignmentViewModel(),
        builder: (context, model, child) => LoadingOverlay(
              isLoading: model.isBusy,
              progressIndicator: const CircularProgressIndicator(
                color: Colors.white,
              ),
              opacity: 0.5,
              child: Scaffold(
                  appBar: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, 60), child: CommonAppBar("Edit Assignment")),
                  bottomNavigationBar: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
                    child: InkWell(
                      // onTap: ontap,
                      onTap: () async {
                        if (model.selectChapterValue != null && model.selectSectionValue != null && model.selectSubjectValue != null) {
                          await model.navigateToSearchScreen();
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
                            child: Text("Update", style: TextStyle(color: WhiteColor, fontSize: 19, fontFamily: "Gilroy Bold")),
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
                        child: Row(
                          children: [
                            Text("isCombined: ", style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: secondryColor)),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            Switch(
                              // thumb color (round icon)
                              activeColor: secondryColor,
                              activeTrackColor: Colors.grey,
                              inactiveThumbColor: Colors.grey,
                              inactiveTrackColor: Colors.grey.shade400,
                              splashRadius: 50.0,
                              // boolean variable value
                              value: model.isCombined,
                              // changes the state of the switch
                              onChanged: (value) {
                                // model.changeCombined(value);
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonRequiedTextWidget(text: "Class"),
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
                                  value: model.selectClassValue ?? model.classList[0],
                                  onChanged: (newvalue) {
                                    model.changeClassValue(newvalue as Chapter);
                                  },
                                  items: model.classList.map((Chapter valueItem) {
                                    return DropdownMenuItem<Chapter>(
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
                            CommonRequiedTextWidget(text: "Section"),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.sizeOf(context).width,
                              margin: EdgeInsets.only(right: 12),
                              padding: EdgeInsets.only(left: 4),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: WhiteColor, border: Border.all(color: secondryColor)),
                              child: DropdownButton(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                borderRadius: BorderRadius.circular(10),
                                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                                iconSize: 20,
                                isExpanded: true,
                                underline: const SizedBox(),
                                value: model.selectSectionValue ?? model.sectionList[0],
                                onChanged: (newvalue) {
                                  model.changeSectionValue(newvalue as SectionList);
                                },
                                items: model.sectionList.map((SectionList valueItem) {
                                  return DropdownMenuItem<SectionList>(
                                    value: valueItem,
                                    child: Text(valueItem.text!, style: TextStyle(color: BlackColor, fontFamily: 'Gilroy Medium', fontSize: 16)),
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            CommonRequiedTextWidget(text: "Subject"),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.sizeOf(context).width,
                              margin: EdgeInsets.only(right: 12),
                              padding: EdgeInsets.only(left: 4),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: WhiteColor, border: Border.all(color: secondryColor)),
                              child: DropdownButton(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                borderRadius: BorderRadius.circular(10),
                                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                                iconSize: 20,
                                isExpanded: true,
                                underline: const SizedBox(),
                                value: model.selectSubjectValue ?? model.subjectList[0],
                                onChanged: (newvalue) {
                                  model.changeSubjectValue(newvalue as SubjectList);
                                  // setState(() {
                                  //   selectarrive = newvalue as String?;
                                  // });
                                },
                                items: model.subjectList.map((SubjectList valueItem) {
                                  return DropdownMenuItem<SubjectList>(
                                    value: valueItem,
                                    child: Text(valueItem.text!, style: TextStyle(color: BlackColor, fontFamily: 'Gilroy Medium', fontSize: 16)),
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            CommonRequiedTextWidget(text: "Chapter"),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.sizeOf(context).width,
                              margin: EdgeInsets.only(right: 12),
                              padding: EdgeInsets.only(left: 4),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: WhiteColor, border: Border.all(color: secondryColor)),
                              child: DropdownButton(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                borderRadius: BorderRadius.circular(10),
                                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                                iconSize: 20,
                                isExpanded: true,
                                underline: const SizedBox(),
                                value: model.selectChapterValue ?? model.chapterList[0],
                                onChanged: (newvalue) {
                                  model.changeChapterValue(newvalue as ListElement);
                                  // setState(() {
                                  //   selectarrive = newvalue as String?;
                                  // });
                                },
                                items: model.chapterList.map((ListElement valueItem) {
                                  return DropdownMenuItem<ListElement>(
                                    value: valueItem,
                                    child: Text(valueItem.text!, style: TextStyle(color: BlackColor, fontFamily: 'Gilroy Medium', fontSize: 16)),
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            CommonRequiedTextWidget(text: "Assignment Topic"),
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
                                controller: model.topic,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text("Date", style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: secondryColor)),
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: TextFormField(
                                readOnly: true,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: secondryColor),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: secondryColor),
                                    ),
                                    suffixIcon: InkWell(
                                        onTap: () {
                                          model.fromPickDate(context);
                                        },
                                        child: Icon(
                                          Icons.calendar_month,
                                          color: secondryColor,
                                        )),
                                    hintText: ''),
                                maxLines: 1,
                                controller: model.dateField,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            CommonRequiedTextWidget(text: "Submit Date"),
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: TextFormField(
                                readOnly: true,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: secondryColor),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: secondryColor),
                                    ),
                                    suffixIcon: InkWell(
                                        onTap: () {
                                          model.submitPickDate(context);
                                        },
                                        child: Icon(
                                          Icons.calendar_month,
                                          color: secondryColor,
                                        )),
                                    hintText: ''),
                                maxLines: 1,
                                controller: model.submitDate,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text("Notes", style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: secondryColor)),
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
                                controller: model.notes,
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

// ignore_for_file: file_names, prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nedusoft/Utils/Colors.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/core/widget/text_widget.dart';
import 'package:nedusoft/models/getall_section_model.dart';
import 'package:nedusoft/models/getattendance_model.dart';
import 'package:stacked/stacked.dart';
import '../../../Utils/custom_snackbar.dart';
import '../../../core/widget/common_app_bar.dart';
import '../../../main.dart';
import '../../../models/getall_subject_model.dart';
import 'faculty_allocation_view_model.dart';

class StaffFacultyAllocationScreen extends StatelessWidget {
  const StaffFacultyAllocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) => viewModel.init(),
        viewModelBuilder: () => StaffFacultyAllocationViewModel(),
        builder: (context, model, child) => LoadingOverlay(
              isLoading: model.isBusy,
              progressIndicator: const CircularProgressIndicator(
                color: Colors.white,
              ),
              opacity: 0.5,
              child: Scaffold(
                  appBar: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, 60), child: CommonAppBar("Student Allocation")),
                  bottomNavigationBar: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
                    child: InkWell(
                      // onTap: ontap,
                      onTap: () async {
                        if (model.selectYearValue != null && model.selectSectionValue != null && model.selectSubjectValue != null) {
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
                            child: Text("Search", style: TextStyle(color: WhiteColor, fontSize: 19, fontFamily: "Gilroy Bold")),
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
                                model.changeCombined(value);
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonRequiedTextWidget(text: "Year"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 50,
                                            width: MediaQuery.sizeOf(context).width * 0.385,
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
                                                value: model.selectYearValue ?? model.yearList[0],
                                                onChanged: (newvalue) {
                                                  model.changeYearValue(newvalue as Year);
                                                },
                                                items: model.yearList.map((Year valueItem) {
                                                  return DropdownMenuItem<Year>(
                                                    value: valueItem,
                                                    child: Text(valueItem.yearName!, style: TextStyle(color: BlackColor, fontFamily: 'Gilroy Medium', fontSize: 16)),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonRequiedTextWidget(text: "Class"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: MediaQuery.sizeOf(context).width * 0.40,
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
                                                model.changeClassValue(newvalue as Cl);
                                              },
                                              items: model.classList.map((Cl valueItem) {
                                                return DropdownMenuItem<Cl>(
                                                  value: valueItem,
                                                  child: Text(valueItem.text!, style: TextStyle(color: BlackColor, fontFamily: 'Gilroy Medium', fontSize: 16)),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Order By", style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: secondryColor)),
                                Radio(
                                  value: "name",
                                  activeColor: primaryColor,
                                  groupValue: model.id,
                                  onChanged: (val) {
                                    model.changeOrderId(val!);
                                  },
                                ),
                                Text('Name', style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: secondryColor)),
                                Radio(
                                  value: "rollno",
                                  groupValue: model.id,
                                  activeColor: primaryColor,
                                  onChanged: (val) {
                                    model.changeOrderId(val!);
                                  },
                                ),
                                Text('Roll No', style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: secondryColor)),
                                const SizedBox(height: 35),
                              ],
                            ),
                          ],
                        ),
                      )
                    ]),
                  )),
            ));
  }
}

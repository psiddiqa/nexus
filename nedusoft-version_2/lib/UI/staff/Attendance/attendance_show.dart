// ignore_for_file: file_names, prefer_const_constructors

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nedusoft/UI/staff/Attendance/attendnce_show_view_model.dart';
// import 'package:pluto_grid/pluto_grid.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/widget/common_app_bar.dart';
import '../../../models/attendance_model.dart';
import '../../../models/get_status_model.dart' as status;
import 'package:nedusoft/Utils/Colors.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/models/getall_attendance_model.dart';
import 'package:nedusoft/models/getall_subject_model.dart';
import 'package:stacked/stacked.dart';
import '../../../models/getall_section_model.dart';
import '../../../models/getattendance_model.dart';

class StaffAttendanceShow extends StatelessWidget {
  GetAllStudentAtteListModel? dataModel;
  SectionList? sectionList;
  SubjectList? subjectList;
  Cl? session;
  Year? year;
  String? date;
  TimeOfDay? from;
  TimeOfDay? to;
  List<SaveStudentAttendanceModel>? saveStudentAttendanceModel;
  StaffAttendanceShow({required this.dataModel, required this.date, required this.sectionList, this.session, this.from, this.to, required this.subjectList, required this.year, required this.saveStudentAttendanceModel});

  final NavigationService _navigationService = locator<NavigationService>();
  // late final PlutoGridStateManager stateManager;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) => viewModel.init(saveStudentAttendanceModel!, dataModel!),
        viewModelBuilder: () => StaffAttendanceShowViewModel(),
        builder: (context, model, child) => LoadingOverlay(
              isLoading: model.isBusy,
              progressIndicator: const CircularProgressIndicator(
                color: Colors.white,
              ),
              opacity: 0.5,
              child: Scaffold(
                  bottomNavigationBar: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
                    child: InkWell(
                      onTap: () async {
                        await model.saveAttendance(sectionList!.value.toString(), subjectList == null ? null : subjectList!.value.toString(), session == null ? null : session!.value.toString(), from, to, year!.yearId.toString(), date!, true);
                      },
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: primaryColor),
                          child: Center(
                            child: Text("Save Attendance", style: TextStyle(color: WhiteColor, fontSize: 19, fontFamily: "Gilroy Bold")),
                          )),
                    ),
                  ),
                  appBar: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, 60), child: CommonAppBar("Attendance")),
                  backgroundColor: WhiteColor,
                  body: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                    SizedBox(height: Get.height * 0.012),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                      ),
                      child: Row(
                        children: [
                          Text("Show Only Absents: ", style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: secondryColor)),
                          Switch(
                            // thumb color (round icon)
                            activeColor: secondryColor,
                            activeTrackColor: Colors.grey,
                            inactiveThumbColor: Colors.grey,
                            inactiveTrackColor: Colors.grey.shade400,
                            splashRadius: 50.0,
                            // boolean variable value
                            value: model.onlyAbsent,
                            // changes the state of the switch
                            onChanged: (value) {
                              model.changeAbsent(value);
                            },
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text("All Absents:", style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: secondryColor)),
                          Switch(
                            activeColor: secondryColor,
                            activeTrackColor: Colors.grey,
                            inactiveThumbColor: Colors.grey,
                            inactiveTrackColor: Colors.grey.shade400,
                            splashRadius: 50.0,
                            value: model.allAbsent,
                            onChanged: (value) {
                              model.changeAllAbsent(value);
                            },
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 6),
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width * 0.33,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Name", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                                  model.onlyAbsent
                                      ? SizedBox()
                                      : InkWell(
                                          onTap: () {
                                            model.changeAscending();
                                          },
                                          child: Image.asset(
                                            "assets/ascending.png",
                                            scale: 1,
                                            width: 25,
                                            height: 25,
                                            color: model.ascending ? BlackColor : Colors.red,
                                          ),
                                        )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: Get.width * 0.23,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Roll No", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                                  model.onlyAbsent
                                      ? SizedBox()
                                      : InkWell(
                                          onTap: () {
                                            model.changeAscending();
                                          },
                                          child: Image.asset(
                                            "assets/ascending.png",
                                            scale: 1,
                                            width: 25,
                                            height: 25,
                                            color: model.ascending ? BlackColor : Colors.red,
                                          ),
                                        )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.25,
                              child: Text("Status", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    model.onlyAbsent
                        ? model.absentStudentList.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.symmetric(vertical: 50),
                                child: Center(
                                  child: Text(
                                    "No Absent Students".toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontFamily: "Gilroy Bold", fontSize: 22, color: secondryColor),
                                  ),
                                ),
                              )
                            : Expanded(
                                child: ListView.separated(
                                padding: EdgeInsets.only(left: 0.0, right: 0.0),
                                // physics: NeverScrollableScrollPhysics(),
                                itemCount: model.absentStudentList.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 18),
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: Get.width * 0.35,
                                            child: Text(model.getAllStudentAtteListModel!.list![model.absentStudentList[index].index].name ?? "", style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.2,
                                            child: Text(model.getAllStudentAtteListModel!.list![index].rollNumber ?? "-----", style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                          ),
                                          MarkAttendanceWidget(
                                            model: model,
                                            index: model.absentStudentList[index].index,
                                            studentName: model.absentStudentList[index].name,
                                            // toggle: model.toggle,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 18),
                                    child: Divider(
                                      color: secondryColor,
                                    ),
                                  );
                                },
                              ))
                        : model.getAllStudentAtteListModel == null
                            ? SizedBox()
                            : Expanded(
                                child: ListView.separated(
                                itemCount: model.getAllStudentAtteListModel!.list!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 18),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.35,
                                          child: Text(model.getAllStudentAtteListModel!.list![index].name ?? "", style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.2,
                                          child: Text(model.getAllStudentAtteListModel!.list![index].rollNumber ?? "-----", style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                        ),
                                        MarkAttendanceWidget(
                                          model: model,
                                          index: index,
                                          studentName: model.getAllStudentAtteListModel!.list![index].firstName!,
                                          // toggle: model.toggle,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 18),
                                    child: Divider(
                                      color: secondryColor,
                                    ),
                                  );
                                },
                              ))
                  ])),
            ));
  }
}

class MarkAttendanceWidget extends StatefulWidget {
  StaffAttendanceShowViewModel model;
  int index;
  String studentName;
  // bool toggle;
  MarkAttendanceWidget({
    required this.model,
    required this.index,
    required this.studentName,
    // required this.toggle,
    super.key,
  });

  @override
  State<MarkAttendanceWidget> createState() => _MarkAttendanceWidgetState();
}

class _MarkAttendanceWidgetState extends State<MarkAttendanceWidget> {
  // status.ListElement? selectStatus;

  // bool isComp = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 30,
          width: Get.width * 0.27,
          padding: EdgeInsets.only(left: 4),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: WhiteColor, border: Border.all(color: secondryColor)),
          child: Center(
            child: DropdownButton(
              borderRadius: BorderRadius.circular(10),
              icon: const Icon(Icons.keyboard_arrow_down_outlined),
              iconSize: 20,
              // isExpanded: true,
              underline: const SizedBox(),
              value: widget.model.statusList[widget.model.saveStudentAttendanceModel![widget.index].name!],
              onChanged: (newvalue) {
                // ignore: unrelated_type_equality_checks

                widget.model.changeStatusValue(widget.index, newvalue!.value!, widget.model.statusList.indexWhere((item) => item.text == newvalue.text));
                if (newvalue.text != "Present") {
                  widget.model.addStudent(AbsentModel(index: widget.index, name: widget.studentName));
                } else if (newvalue.text == "Present") {
                  widget.model.subStudent(AbsentModel(index: widget.index, name: widget.studentName));
                }
              },
              items: widget.model.statusList.map((status.ListElement valueItem) {
                return DropdownMenuItem<status.ListElement>(
                  value: valueItem,
                  child: Text(valueItem.text!, style: TextStyle(color: BlackColor, fontFamily: 'Gilroy Medium', fontSize: 10)),
                );
              }).toList(),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        widget.model.statusList[widget.model.saveStudentAttendanceModel![widget.index].name!].text == "Compensation"
            ? Container(
                height: 30,
                width: Get.width * 0.27,
                padding: EdgeInsets.only(left: 4),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: WhiteColor, border: Border.all(color: secondryColor)),
                child: Center(
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(10),
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    iconSize: 20,
                    // isExpanded: true,
                    underline: const SizedBox(),
                    value: widget.model.remarkList[widget.model.saveStudentAttendanceModel![widget.index].remark!],
                    onChanged: (newvalue) {
                      widget.model.changeRemarkValue(widget.index, newvalue!.value!, widget.model.remarkList.indexWhere((item) => item.text == newvalue.text));
                    },
                    items: widget.model.remarkList.map((status.ListElement valueItem) {
                      return DropdownMenuItem<status.ListElement>(
                        value: valueItem,
                        child: Text(valueItem.text!, style: TextStyle(color: BlackColor, fontFamily: 'Gilroy Medium', fontSize: 10)),
                      );
                    }).toList(),
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}

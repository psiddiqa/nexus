// ignore_for_file: file_names, prefer_const_constructors

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nedusoft/UI/staff/Attendance/attendnce_show_view_model.dart';
import 'package:nedusoft/UI/staff/faculty_allocation/faculty_allocation_view_model.dart';
// import 'package:pluto_grid/pluto_grid.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/widget/common_app_bar.dart';
import '../../../models/get_status_model.dart' as status;
import 'package:nedusoft/Utils/Colors.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/models/getall_subject_model.dart';
import 'package:stacked/stacked.dart';
import '../../../models/getall_section_model.dart';
import '../../../models/getattendance_model.dart';
import '../../../models/staff/faculty_allocation_model.dart';
import 'add_student_view_model.dart';

class StudentAllocation extends StatelessWidget {
  List<FacultyAllocationStudentList>? studentList;
  SectionList? sectionList;
  SubjectList? subjectList;
  Cl? classes;
  Year? year;
  StudentAllocation({required this.studentList, required this.sectionList, required this.subjectList, required this.year, required this.classes});

  final NavigationService _navigationService = locator<NavigationService>();
  // late final PlutoGridStateManager stateManager;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) => viewModel.init(studentList!),
        viewModelBuilder: () => StudentAllocationViewModel(),
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
                        await model.add(
                          sectionList!.value.toString(),
                          subjectList!.value.toString(),
                          year!.yearId.toString(),
                          classes!.value.toString(),
                        );
                      },
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: primaryColor),
                          child: Center(
                            child: Text("Save", style: TextStyle(color: WhiteColor, fontSize: 19, fontFamily: "Gilroy Bold")),
                          )),
                    ),
                  ),
                  appBar: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, 60), child: CommonAppBar("Student Allocation")),
                  backgroundColor: WhiteColor,
                  body: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                    SizedBox(height: Get.height * 0.012),
                    Row(
                      children: [
                        Checkbox(
                          onChanged: (value) {
                            model.changeSelectAll(value!);
                          },
                          value: model.selectAll,
                          activeColor: secondryColor,
                        ),
                        RichText(
                          text: TextSpan(
                            text: "Select/De-select all",
                            style: TextStyle(color: secondryColor, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
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
                              width: Get.width * 0.15,
                              child: Text("Select", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                            ),
                            SizedBox(
                              width: Get.width * 0.25,
                              child: Text("Name", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: Get.width * 0.15,
                              child: Text("class", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                            ),
                            SizedBox(
                              width: Get.width * 0.2,
                              child: Text("Section", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    model.studentList == null
                        ? SizedBox()
                        : Expanded(
                            child: ListView.separated(
                            itemCount: model.studentList!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 18),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: Get.width * 0.2,
                                        child: SelectWidget(
                                          model: model,
                                          index: index,
                                          studentId: model.studentList![index].studentId,
                                        )),
                                    SizedBox(
                                      width: Get.width * 0.35,
                                      child: Text(model.studentList![index].studentName, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.17,
                                      child: Text(model.studentList![index].className, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.17,
                                      child: Text(model.studentList![index].section, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
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

class SelectWidget extends StatefulWidget {
  StudentAllocationViewModel model;
  int index;
  int studentId;
  SelectWidget({
    required this.model,
    required this.index,
    required this.studentId,
    super.key,
  });

  @override
  State<SelectWidget> createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      onChanged: (value) {
        log(value.toString());
        if (value!) {
          widget.model.addStudent(
              SaveFacultyAllocation(
                studentId: widget.studentId,
              ),
              value,
              widget.index);
        } else {
          widget.model.subStudent(SaveFacultyAllocation(studentId: widget.studentId), value, widget.index);
        }
      },
      value: widget.model.studentList![widget.index].value,
      activeColor: secondryColor,
    );
  }
}

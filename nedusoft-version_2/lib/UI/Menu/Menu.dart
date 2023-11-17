// ignore_for_file: prefer_const_constructors, file_names

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/UI/Events/events.dart';
import 'package:nedusoft/UI/FeeDetails/fee_screen.dart';
import 'package:nedusoft/UI/Marks/marks_screen.dart';
import 'package:nedusoft/UI/Menu/dashbord_view_model.dart';
import 'package:nedusoft/UI/common/support.dart';
import 'package:nedusoft/UI/feedback/feedback.dart';
import 'package:nedusoft/UI/learn/student_learn.dart';
import 'package:nedusoft/UI/time_table/time_table_screen.dart';
import 'package:nedusoft/Utils/custom_snackbar.dart';
import 'package:nedusoft/models/student/student_sibling_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:upgrader/upgrader.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nedusoft/Utils/Colors.dart';
import 'package:nedusoft/Utils/Custom_widget.dart';

import '../../app/app.router.dart';
import '../../core/service_locator/service_locator.dart';
import '../../core/services/firebase_analytics.dart';
import '../../core/services/needed_utils.dart';
import '../Attendance/Attendance.dart';
import '../Assignment/assignment.dart';
import '../lesson_update/lesson_update.dart';
import '../Notification/Notification.dart';

class Menu extends StatefulWidget {
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  NeededVariables _neededVariables = locator<NeededVariables>();
  NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (model) async => await model.init(),
        viewModelBuilder: () => DashBoardViewModel(),
        builder: (context, model, child) => UpgradeAlert(
              upgrader: Upgrader(shouldPopScope: () => true, canDismissDialog: true, durationUntilAlertAgain: Duration(days: 1), dialogStyle: Platform.isIOS ? UpgradeDialogStyle.cupertino : UpgradeDialogStyle.material),
              child: LoadingOverlay(
                isLoading: model.isBusy,
                progressIndicator: CircularProgressIndicator(
                  color: secondryColor,
                ),
                opacity: 0.5,
                child: Scaffold(
                  backgroundColor: Color(0xFF52AB8E),
                  bottomNavigationBar: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      child: InkWell(
                        onTap: () async {
                          await _neededVariables.reset();
                          await _neededVariables.sharedPreferences.clear();
                          await _neededVariables.flutterSecureStorage.deleteAll();
                          _navigationService.clearStackAndShow(Routes.addSchoolCode);
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: WhiteColor),
                          child: Center(child: Text("Log out", style: TextStyle(fontFamily: "Gilroy Medium", color: pinkcolor, fontSize: 18))),
                        ),
                      )),
                  body: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Color(0xFF52AB8E)),
                    //             #52AB8E
                    // #477049
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          SizedBox(height: Get.height * 0.06),
                          Stack(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          model.navigateToProfile();
                                        },
                                        child: model.bytesImage == null
                                            ? CircleAvatar(
                                                radius: 26,
                                                backgroundColor: Colors.white,
                                                child: Text(model.userPerIndoModel!.studentName![0], style: TextStyle(fontSize: 24, fontFamily: "Gilroy Bold", color: primaryColor)),
                                              )
                                            : CircleAvatar(
                                                radius: 26,
                                                backgroundImage: MemoryImage(model.bytesImage!),
                                              ),
                                      ),
                                      SizedBox(width: Get.width * 0.04),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          model.isBusy
                                              ? const SizedBox()
                                              : model.siblingList.isEmpty
                                                  ? Text(model.userPerIndoModel!.studentName ?? "", style: TextStyle(fontSize: 18, fontFamily: "Gilroy Bold", color: WhiteColor))
                                                  : Container(
                                                      height: 23,
                                                      width: MediaQuery.sizeOf(context).width * 0.4,
                                                      // margin: const EdgeInsets.only(
                                                      //   right: 12,
                                                      //   left: 12,
                                                      //   bottom: 12,
                                                      // ),
                                                      padding: EdgeInsets.only(bottom: 4),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(12),
                                                        color: Colors.transparent,
                                                      ),
                                                      child: Center(
                                                        child: DropdownButton(
                                                          borderRadius: BorderRadius.circular(10),
                                                          dropdownColor: primaryColor,
                                                          // elevation: 20,
                                                          icon: const Icon(
                                                            Icons.keyboard_arrow_down_outlined,
                                                            color: Colors.white,
                                                          ),
                                                          iconSize: 20,
                                                          // style: TextStyle(fontSize: 18, fontFamily: "Gilroy Bold", color: Colors.red),
                                                          isExpanded: true,
                                                          underline: const SizedBox(),
                                                          value: model.selectSibling ?? model.siblingList[0],
                                                          onChanged: (newvalue) {
                                                            model.changeSibling(newvalue as ListElement);
                                                          },
                                                          items: model.siblingList.map((ListElement valueItem) {
                                                            return DropdownMenuItem<ListElement>(
                                                              value: valueItem,
                                                              child: Text(valueItem.text!, style: TextStyle(fontSize: 18, fontFamily: "Gilroy Bold", color: WhiteColor)),
                                                            );
                                                          }).toList(),
                                                        ),
                                                      ),
                                                    ),
                                          // Text(model.userPerIndoModel!.studentName ?? "", style: TextStyle(fontSize: 18, fontFamily: "Gilroy Bold", color: WhiteColor)),
                                          Text(model.userPerIndoModel!.semester ?? "", style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: WhiteColor)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _navigationService.navigateToSettingScreen();
                                    },
                                    child: Icon(
                                      Icons.settings,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  )
                                  //
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: Get.height * 0.02),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Wrap(
                                    spacing: 14,
                                    alignment: WrapAlignment.center,
                                    runSpacing: 12,
                                    children: [
                                      ...List.generate(StudentMenu.length, (index) {
                                        return Column(
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  switch (StudentMenu[index]["status"]) {
                                                    case '1':
                                                      setState(() {});
                                                      // Get.to(() => Deshboard());
                                                      break;
                                                    case '2':
                                                      setState(() {});
                                                      Get.to(() => StudentAssignmentScreen());
                                                      break;
                                                    case '3':
                                                      setState(() {});
                                                      showModalBottomSheet(context: context, builder: (context) => BottomSheetForAttendance());

                                                      break;
                                                    case '4':
                                                      Get.to(StudentFeesDetail());
                                                      break;
                                                    case '5':
                                                      Get.to(StudentFeedBack());
                                                      break;
                                                    case '6':
                                                      Get.to(StudentMarks());
                                                      break;
                                                    case '7':
                                                      setState(() {});
                                                      Get.to(() => StudentTimeTable());
                                                      break;
                                                    case '8':
                                                      setState(() {});
                                                      Get.to(() => LessonUpdateScreen());
                                                      break;
                                                    case '9':
                                                      Get.to(Eventpage());
                                                      break;
                                                    case '10':
                                                      showCustomSnackbar(msg: "Coming Soon", title: "Features");
                                                      break;
                                                    case '11':
                                                      setState(() {});
                                                      Get.to(() => SupportScreen());
                                                      break;
                                                    case '12':
                                                      break;
                                                    case '13':
                                                      Get.to(() => StudentLearn());
                                                      break;
                                                    case '14':
                                                      setState(() {});
                                                      Get.to(() => Notificationpage());
                                                      break;
                                                    default:
                                                  }
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.all(6.0),
                                                  child: Image.asset(
                                                    StudentMenu[index]["img"],
                                                    height: 80,
                                                  ),
                                                )),
                                            SizedBox(height: 4),
                                            Text(
                                              StudentMenu[index]["subtext"],
                                              style: TextStyle(fontSize: 16, fontFamily: "Gilroy Medium", color: index > 10 ? Colors.red : WhiteColor),
                                            )
                                          ],
                                        );
                                      }),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          InkWell(
                            onTap: () async {
                              await launchUrl(Uri.parse("https://nedusoft.com/"));
                            },
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: "Powered by ",
                                style: TextStyle(color: WhiteColor),
                              ),
                              TextSpan(
                                text: "NEDUSOFT",
                                style: TextStyle(decoration: TextDecoration.underline, color: WhiteColor, fontFamily: "Gilroy Bold", fontWeight: FontWeight.bold),
                              ),
                            ])),
                          ),
                          Text(
                            "v${_neededVariables.appVersion}(${_neededVariables.appBuildNumber})",
                            style: TextStyle(color: WhiteColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}

class BottomSheetForAttendance extends StatefulWidget {
  const BottomSheetForAttendance({super.key});

  @override
  State<BottomSheetForAttendance> createState() => _BottomSheetForAttendanceState();
}

class _BottomSheetForAttendanceState extends State<BottomSheetForAttendance> {
  final NavigationService _navigationService = locator<NavigationService>();
  AnalyticsServices _analyticsServices = locator<AnalyticsServices>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25, left: 15, right: 25, bottom: 30),
      height: 120,
      decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      child: Column(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
        InkWell(
          onTap: () async {
            await _analyticsServices.logEvents("Add Attendance", {});
            _navigationService.back();
            Get.to(() => Attendance());
          },
          child: Row(
            children: [
              Icon(Icons.assignment_add),
              SizedBox(
                width: 12,
              ),
              Text(
                "Show Attendance",
                style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: BlackColor),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        InkWell(
          onTap: () async {
            await _analyticsServices.logEvents("Add Attendance", {});
            _navigationService.back();
            _navigationService.navigateTo(Routes.studentAttendanceReportScreen);
          },
          child: Row(
            children: [
              Icon(Icons.assignment_turned_in),
              SizedBox(
                width: 12,
              ),
              Text(
                "Monthly Attendance Report",
                style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: BlackColor),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        InkWell(
          onTap: () async {
            await _analyticsServices.logEvents("Add Attendance", {});
            _navigationService.back();
            _navigationService.navigateTo(Routes.collegeAttendanceYearlyReportScreen);
          },
          child: Row(
            children: [
              Icon(Icons.assignment_turned_in),
              SizedBox(
                width: 12,
              ),
              Text(
                "Yearly Attendance Report",
                style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: BlackColor),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

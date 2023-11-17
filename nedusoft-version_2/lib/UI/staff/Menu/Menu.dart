// ignore_for_file: prefer_const_constructors, file_names
import 'dart:io';

import 'package:nedusoft/UI/staff/Menu/dashbord_view_model.dart';
import 'package:nedusoft/UI/staff/assignment/submit_assignmnet/submit_assignment.dart';
import 'package:nedusoft/UI/staff/chapters/chapters.dart';
import 'package:nedusoft/UI/staff/feedback/feedback.dart';
import 'package:nedusoft/UI/staff/lesson_update/lesson_update_screen.dart';
import 'package:nedusoft/UI/staff/notifications/notification.dart';
import 'package:nedusoft/UI/staff/time_table/time_table_screen.dart';
import 'package:nedusoft/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:upgrader/upgrader.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nedusoft/Utils/Colors.dart';
import 'package:nedusoft/Utils/Custom_widget.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/services/firebase_analytics.dart';
import '../../../core/services/needed_utils.dart';

import '../../common/support.dart';
import '../assignment/assignment.dart';
import '../learn/faculty_videos.dart';

// ignore: must_be_immutable
class StaffMenu extends StatefulWidget {
  @override
  State<StaffMenu> createState() => _StaffMenuState();
}

class _StaffMenuState extends State<StaffMenu> {
  NeededVariables _neededVariables = locator<NeededVariables>();
  NavigationService _navigationService = locator<NavigationService>();
  AnalyticsServices _analyticsServices = locator<AnalyticsServices>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) => viewModel.init(),
        viewModelBuilder: () => StaffDashBoardViewModel(),
        builder: (context, model, child) => UpgradeAlert(
              upgrader: Upgrader(shouldPopScope: () => true, canDismissDialog: true, durationUntilAlertAgain: Duration(days: 1), dialogStyle: Platform.isIOS ? UpgradeDialogStyle.cupertino : UpgradeDialogStyle.material),
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
                                              child: Text(model.staffPersonalInfoModel!.employeeName![0], style: TextStyle(fontSize: 24, fontFamily: "Gilroy Bold", color: primaryColor)),
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
                                        Text(model.staffPersonalInfoModel!.employeeName ?? "", style: TextStyle(fontSize: 18, fontFamily: "Gilroy Bold", color: WhiteColor)),
                                        Text("Staff", style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: WhiteColor)),
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
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.02),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 24,
                                ),
                                Wrap(
                                  spacing: 24,
                                  alignment: WrapAlignment.center,
                                  runSpacing: 30,
                                  children: [
                                    ...List.generate(staffMenu.length, (index) {
                                      return Column(
                                        children: [
                                          InkWell(
                                              onTap: () async {
                                                switch (staffMenu[index]["status"]) {
                                                  case '1':
                                                    setState(() {});
                                                    // Get.to(() => Deshboard());
                                                    break;
                                                  case '2':
                                                    setState(() {});
                                                    // Get.to(() => StaffAssignmentScreen());
                                                    showModalBottomSheet(context: context, builder: (context) => BottomSheetWidget());
                                                    break;
                                                  case '3':
                                                    setState(() {});
                                                    showModalBottomSheet(context: context, builder: (context) => BottomSheetForAttendance());

                                                    break;
                                                  case '4':
                                                    Get.to(StaffVideosScreen());
                                                    break;
                                                  case '5':
                                                    setState(() {});
                                                    Get.to(() => StaffFeedBack());
                                                    break;
                                                  case '6':
                                                    setState(() {});
                                                    showModalBottomSheet(context: context, builder: (context) => BottomSheetForMarks());
                                                    break;
                                                  case '7':
                                                    setState(() {});
                                                    Get.to(() => StaffTimeTable());
                                                    break;
                                                  case '8':
                                                    setState(() {});
                                                    Get.to(() => StaffLessonUpdateScreen());
                                                    break;
                                                  case '9':
                                                    showModalBottomSheet(context: context, builder: (context) => BottomSheetForAllocation());
                                                    break;
                                                  case '10':
                                                    setState(() {});
                                                    Get.to(() => StaffMyChapterScreen());
                                                    break;
                                                  case '11':
                                                    setState(() {});
                                                    Get.to(() => SupportScreen());
                                                    break;
                                                  case '12':
                                                    break;
                                                  case '13':
                                                    break;
                                                  case '14':
                                                    setState(() {});
                                                    Get.to(() => StaffNotification());
                                                    break;
                                                  default:
                                                }
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.all(6.0),
                                                child: Image.asset(
                                                  staffMenu[index]["img"],
                                                  height: 80,
                                                ),
                                              )),
                                          SizedBox(height: 4),
                                          Text(
                                            staffMenu[index]["subtext"],
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
            ));
  }
}

class BottomSheetWidget extends StatefulWidget {
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  AnalyticsServices _analyticsServices = locator<AnalyticsServices>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25, left: 15, right: 25, bottom: 30),
      height: 70,
      decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      child: Column(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
        InkWell(
          onTap: () async {
            await _analyticsServices.logEvents("Add Assignment", {});
            Get.back();
            Get.to(StaffAssignmentScreen());
          },
          child: Row(
            children: [
              Icon(Icons.assignment_add),
              SizedBox(
                width: 12,
              ),
              Text(
                "Add Assignments",
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
            await _analyticsServices.logEvents("Submit Assignment", {});
            Get.back();
            Get.to(SubmitAssignment());
          },
          child: Row(
            children: [
              Icon(Icons.assignment_turned_in),
              SizedBox(
                width: 12,
              ),
              Text(
                "Submit Assignments",
                style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: BlackColor),
              ),
            ],
          ),
        )
      ]),
    );
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
      height: 160,
      decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      child: Column(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
        InkWell(
          onTap: () async {
            await _analyticsServices.logEvents("Add Attendance", {});
            _navigationService.back();
            _navigationService.navigateTo(Routes.staffAttendance);
          },
          child: Row(
            children: [
              Icon(Icons.assignment_add),
              SizedBox(
                width: 12,
              ),
              Text(
                "Add Attendance",
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
            _navigationService.navigateTo(Routes.editAttFormScreem);
          },
          child: Row(
            children: [
              Icon(Icons.assignment_turned_in),
              SizedBox(
                width: 12,
              ),
              Text(
                "Edit Attendance",
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
            _navigationService.navigateTo(Routes.myAttendanceReportScreen);
          },
          child: Row(
            children: [
              Icon(Icons.assignment_turned_in),
              SizedBox(
                width: 12,
              ),
              Text(
                "My Attendance Report",
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
            _navigationService.navigateTo(Routes.attendanceYearlyReportScreen);
          },
          child: Row(
            children: [
              Icon(Icons.assignment_turned_in),
              SizedBox(
                width: 12,
              ),
              Text(
                "Attendance Report",
                style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: BlackColor),
              ),
            ],
          ),
        ),
        
      ]),
    );
  }
}

class BottomSheetForMarks extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25, left: 15, right: 25, bottom: 30),
      height: 110,
      decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      child: Column(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
        InkWell(
          onTap: () {
            _navigationService.back();
            _navigationService.navigateTo(Routes.staffMarks);
          },
          child: Row(
            children: [
              Icon(Icons.assignment_add),
              SizedBox(
                width: 12,
              ),
              Text(
                "Add Marks",
                style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: BlackColor),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        InkWell(
          onTap: () {
            _navigationService.back();
            _navigationService.navigateTo(Routes.staffEditMarks);
          },
          child: Row(
            children: [
              Icon(Icons.assignment_turned_in),
              SizedBox(
                width: 12,
              ),
              Text(
                "Edit Marks",
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
            // await _analyticsServices.logEvents("Add Attendance", {});
            _navigationService.back();
            _navigationService.navigateTo(Routes.studentWiseReportScreen);
          },
          child: Row(
            children: [
              Icon(Icons.assignment_turned_in),
              SizedBox(
                width: 12,
              ),
              Text(
                "Subject Wise Report",
                style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: BlackColor),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class BottomSheetForAllocation extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25, left: 15, right: 25, bottom: 30),
      height: 70,
      decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      child: Column(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
        InkWell(
          onTap: () {
            _navigationService.back();
            _navigationService.navigateTo(Routes.staffFacultyAllocationScreen);
          },
          child: Row(
            children: [
              Icon(Icons.assignment_add),
              SizedBox(
                width: 12,
              ),
              Text(
                "Student Allocation",
                style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: BlackColor),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        InkWell(
          onTap: () {
            _navigationService.back();
            _navigationService.navigateTo(Routes.staffFacultyDeAllocationScreen);
          },
          child: Row(
            children: [
              Icon(Icons.assignment_turned_in),
              SizedBox(
                width: 12,
              ),
              Text(
                "Student De-Allocation",
                style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: BlackColor),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

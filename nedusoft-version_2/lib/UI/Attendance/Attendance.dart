// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nedusoft/UI/Attendance/attendance_view_model.dart';

import 'package:nedusoft/Utils/Colors.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/core/widget/common_app_bar.dart';
import 'package:stacked/stacked.dart';
import '../../models/student/attendance_report_model.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
 
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.init(),
        viewModelBuilder: () => AttendanceViewModel(),
        builder: (context, model, child) => LoadingOverlay(
          isLoading: model.isBusy,
              progressIndicator: const CircularProgressIndicator(
                color: Colors.white,
              ),
              opacity: 0.5,
          child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: Size(MediaQuery.sizeOf(context).width, 60),
                    child: CommonAppBar("Attendance"),
                  ),
              backgroundColor: WhiteColor,
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        // SizedBox(height: Get.height * 0.012),
                        const SizedBox(
                          height: 20,
                        ),
                        // InkWell(
                        //   onTap: () {},
                        //   child: Container(
                        //     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        //     margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                        //     height: 100,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(6),
                        //       color: boxshadow.withOpacity(0.5),
                        //     ),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       children: [
                        //         Column(
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [
                        //             Text("Total Percentage", style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 14, color: Colors.black, fontWeight: FontWeight.w300)),
                        //             SizedBox(
                        //               height: 8,
                        //             ),
                        //             Text(model.attendanceModel?.percentage.toString() ?? "", style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold)),
                        //           ],
                        //         ),
                        //         SvgPicture.asset(
                        //           "assets/calendar.svg",
                        //           width: 45,
                        //           height: 45,
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Container(
                        //       height: 120,
                        //       margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                        //       width: MediaQuery.sizeOf(context).width * 0.41,
                        //       decoration: BoxDecoration(
                        //         color: boxshadow.withOpacity(0.5),
                        //         borderRadius: BorderRadius.circular(8),
                        //       ),
                        //       child: Column(
                        //         crossAxisAlignment: CrossAxisAlignment.center,
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Text(model.attendanceModel?.classtaken.toString() ?? "", style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold)),
                        //           SizedBox(
                        //             height: 8,
                        //           ),
                        //           Text("Class Taken", style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 14, color: Colors.black, fontWeight: FontWeight.w300)),
                        //         ],
                        //       ),
                        //     ),
                        //     Container(
                        //       height: 120,
                        //       margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                        //       width: MediaQuery.sizeOf(context).width * 0.4,
                        //       decoration: BoxDecoration(
                        //         color: boxshadow.withOpacity(0.5),
                        //         borderRadius: BorderRadius.circular(8),
                        //       ),
                        //       child: Column(
                        //         crossAxisAlignment: CrossAxisAlignment.center,
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Text(model.attendanceModel?.classAttended.toString() ?? "", style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold)),
                        //           SizedBox(
                        //             height: 8,
                        //           ),
                        //           Text("Class Attended", style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 14, color: Colors.black, fontWeight: FontWeight.w300)),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Year", style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: secondryColor)),
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
                        SizedBox(
                          height: 28,
                        ),
                        // Text("Class: ${model.neededVariables.loginModel}", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: Colors.black)),
                        // SizedBox(
                        //   height: 28,
                        // ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                          decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Get.width * 0.18,
                                child: Text("Subject", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                              ),
                              
                              SizedBox(
                                width: Get.width * 0.2,
                                child: Text("Class Taken", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                              ),
                              SizedBox(
                                width: Get.width * 0.2,
                                child: Text("Class Attened", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                              ),
                              SizedBox(
                                width: Get.width * 0.23,
                                child: Text("Percentage", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                              ),
                            ],
                          ),
                        ),

                        model.attendanceReportModel == null
                            ? const SizedBox()
                            : ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: model.attendanceReportModel!.list!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.2,
                                          child: Text(model.attendanceReportModel!.list![index].subject ?? "", textAlign: TextAlign.start, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                        ),
                                        // SizedBox(
                                        //   width: Get.width * 0.22,
                                        //   child: Text(model.attendanceReportModel!.list![index].className ?? "", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                        // ),
                                        SizedBox(
                                          width: Get.width * 0.2,
                                          child: Text(model.attendanceReportModel!.list![index].total.toString() ?? "", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.2,
                                          child: Text(model.attendanceReportModel!.list![index].presentDays!.toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: "Gilroy Medium",
                                                color: BlackColor,
                                              )),
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.22,
                                          child: Text(model.attendanceReportModel!.list![index].per.toString() ?? "", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
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
                              )
                      ]),
                    ),
                  )),
        ));
  }
}

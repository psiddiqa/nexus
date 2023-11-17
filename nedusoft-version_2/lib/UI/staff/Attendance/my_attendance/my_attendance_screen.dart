import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/UI/staff/Attendance/monthly_report/student_attendance_view_model.dart';
import 'package:nedusoft/models/staff/getFacultySubjectWiseAttnDataModel.dart';
import 'package:stacked/stacked.dart';

import '../../../../Utils/Colors.dart';
import '../../../../core/widget/common_app_bar.dart';
import 'my_attendance_view_model.dart';

class MyAttendanceReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (model) async => await model.init(),
        viewModelBuilder: () => MyAttReportViewmodel(),
        builder: (context, model, child) => LoadingOverlay(
            isLoading: model.isBusy,
            progressIndicator: const CircularProgressIndicator(
              color: Colors.white,
            ),
            opacity: 0.5,
            child: Scaffold(
              appBar: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, 60), child: CommonAppBar("Report")),
              backgroundColor: WhiteColor,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    //custom icon
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      width: MediaQuery.sizeOf(context).width,
                      height: 100,
                      decoration: ShapeDecoration(
                        color: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x7FFFFFFF),
                            blurRadius: 10,
                            offset: Offset(-5, -5),
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Color(0x7FD3D8D7),
                            blurRadius: 13,
                            offset: Offset(5, 5),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'From Date',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.8999999761581421),
                                        fontSize: 18,
                                        fontFamily: "Gilroy Medium",
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 45,
                                      // width: 100,
                                      // margin: EdgeInsets.only(right: 12),
                                      padding: const EdgeInsets.only(left: 10),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: WhiteColor, border: Border.all(color: const Color(0xFF4AABA0))),
                                      child: TextFormField(
                                        readOnly: true,
                                        onTap: () {
                                          model.fromPickDate(context);
                                        },
                                        decoration: InputDecoration(
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            suffixIcon: InkWell(
                                                onTap: () {
                                                  model.fromPickDate(context);
                                                },
                                                child: Icon(
                                                  Icons.schedule,
                                                  color: secondryColor,
                                                )),
                                            hintText: '--From Date--'),
                                        maxLines: 1,
                                        controller: model.from,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 18,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'To Date',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.8999999761581421),
                                        fontSize: 18,
                                        fontFamily: "Gilroy Medium",
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 45,
                                      // width: 100,
                                      // margin: EdgeInsets.only(right: 12),

                                      padding: EdgeInsets.only(left: 10),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: WhiteColor, border: Border.all(color: Color(0xFF4AABA0))),
                                      child: TextFormField(
                                        readOnly: true,
                                        onTap: () {
                                          model.toPickDate(context);
                                        },
                                        decoration: InputDecoration(
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            suffixIcon: InkWell(
                                                onTap: () {
                                                  model.toPickDate(context);
                                                },
                                                child: Icon(
                                                  Icons.schedule,
                                                  color: secondryColor,
                                                )),
                                            hintText: '--To Date--'),
                                        maxLines: 1,
                                        controller: model.to,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        model.myAttReportViewmodel != null
                            ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Overall Attendance ${model.myAttReportViewmodel?.overAllAttn ?? 0}',
                                      style: const TextStyle(color: Colors.white, fontSize: 14, fontFamily: "Gilroy Bold"),
                                    ),
                                    Text(
                                      'Month Attendance ${model.myAttReportViewmodel?.monthAttn ?? 0}',
                                      style: const TextStyle(color: Colors.white, fontSize: 14, fontFamily: "Gilroy Bold"),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 12),
                        //   child: InkWell(
                        //     onTap: () async {
                        //       // await model.getReport(model.selectStudentValue?.stId ?? studentId, subjectId, classId, yearId);
                        //     },
                        //     child: Container(
                        //         height: 45,
                        //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: WhiteColor),
                        //         child: Center(
                        //           child: Text("Search", style: TextStyle(color: primaryColor, fontSize: 19, fontFamily: "Gilroy Bold")),
                        //         )),
                        //   ),
                        // ),
                      ]),
                    ),
                    HeatMapCalendarExample()
                  ],
                ),
              ),
            )));
  }
}

class HeatMapCalendarExample extends ViewModelWidget<MyAttReportViewmodel> {
  Widget _textField(final String hint, final TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 20, top: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xffe7e7e7), width: 1.0)),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF20bca4), width: 1.0)),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          isDense: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, MyAttReportViewmodel model) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),

          // HeatMapCalendar
          child: model.isLoading
              ? const Center(child: CircularProgressIndicator())
              : HeatMapCalendar(
                  initDate: model.initalDate,
                  flexible: true,
                  datasets: model.heatMapDatasets,
                  // defaultColor: Colors.black,
                  onMonthChange: (date) async {
                    log(date.toString());
                    model.changeMonth(date);
                  },
                  monthFontSize: 20,
                  weekFontSize: 16,
                  borderRadius: 12,
                  margin: const EdgeInsets.all(6),
                  textColor: Colors.black,

                  showColorTip: false,
                  colorMode: ColorMode.color,
                  colorsets: const {
                    1: Color(0xFF149369),
                    2: Color(0xFFFFC436),
                    3: Color(0xFF4A7948),
                    4: Color(0xFFF63B08),
                    5: Color(0xFF800080),
                  },
                ),
        ),
        // _textField('YYYYMMDD', dateController),
        // _textField('Heat Level', heatLevelController),
        // ElevatedButton(
        //   child: const Text('COMMIT'),
        //   onPressed: () {
        //     setState(() {
        //       heatMapDatasets[DateTime.parse(dateController.text)] = int.parse(heatLevelController.text);
        //     });
        //   },
        // ),

        // ColorMode/OpacityMode Switch.
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     const Text('Color Mode'),
        //     CupertinoSwitch(
        //       value: isOpacityMode,
        //       onChanged: (value) {
        //         setState(() {
        //           isOpacityMode = value;
        //         });
        //       },
        //     ),
        //     const Text('Opacity Mode'),
        //   ],
        // ),
      ],
    );
  }
}

import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/UI/Attendance/subject_report/report_view_model.dart';
import 'package:nedusoft/models/student/college_student_model.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../Utils/Colors.dart';
import '../../../../core/widget/common_app_bar.dart';
import 'package:flutter/cupertino.dart';

class CollegeAttendanceYearlyReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 2;
    return ViewModelBuilder.reactive(
        onViewModelReady: (model) async => await model.init(),
        viewModelBuilder: () => CollegeYearlyReportViewmodel(),
        builder: (context, model, child) => LoadingOverlay(
            isLoading: model.isBusy,
            progressIndicator: const CircularProgressIndicator(
              color: Colors.white,
            ),
            opacity: 0.5,
            child: Scaffold(
              appBar: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, 60), child: CommonAppBar("Consolidated Report".toUpperCase())),
              backgroundColor: WhiteColor,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "OverView",
                            style: TextStyle(color: primaryColor, fontFamily: 'Gilroy Bold', fontSize: 20),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Container(
                              height: 45,
                              // width: 100,
                              // margin: EdgeInsets.only(right: 12),
                              padding: EdgeInsets.only(left: 4),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: WhiteColor, border: Border.all(color: Color(0xFF4AABA0))),
                              child: DropdownButton(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                borderRadius: BorderRadius.circular(10),
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: Color(0xFF4AABA0),
                                ),
                                iconSize: 20,
                                isExpanded: true,
                                underline: const SizedBox(),
                                onChanged: (newvalue) {
                                  model.changeYear(newvalue as Year);
                                },
                                value: model.selectYearValue,
                                hint: const Text(
                                  "Year",
                                  style: TextStyle(
                                    color: Color(0xFF4AABA0),
                                    fontSize: 18,
                                    fontFamily: "Gilroy Medium",
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                items: model.yearList.map((Year valueItem) {
                                  return DropdownMenuItem<Year>(
                                    value: valueItem,
                                    child: Text(valueItem.yearName!, style: TextStyle(color: BlackColor, fontFamily: 'Gilroy Medium', fontSize: 16)),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          (model.yearAttendanceReport?.isStudent ?? false)
                              ? const SizedBox(
                                  width: 18,
                                )
                              : const SizedBox(),
                          (model.yearAttendanceReport?.isStudent ?? false)
                              ? Expanded(
                                  child: Container(
                                    height: 45,
                                    // width: 150,
                                    // margin: EdgeInsets.only(right: 12),
                                    padding: EdgeInsets.only(left: 4),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: WhiteColor, border: Border.all(color: Color(0xFF4AABA0))),
                                    child: DropdownButton(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      borderRadius: BorderRadius.circular(10),
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: Color(0xFF4AABA0),
                                      ),
                                      iconSize: 20,
                                      isExpanded: true,
                                      underline: const SizedBox(),
                                      onChanged: (newvalue) {
                                        model.changeSubject(newvalue!);
                                      },
                                      value: model.selectSubejctValue,
                                      hint: const Text(
                                        "Subject",
                                        style: TextStyle(
                                          color: Color(0xFF4AABA0),
                                          fontSize: 18,
                                          fontFamily: "Gilroy Medium",
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                      items: model.subjectList.map((String valueItem) {
                                        return DropdownMenuItem<String>(
                                          value: valueItem,
                                          child: Text(valueItem, style: TextStyle(color: BlackColor, fontFamily: 'Gilroy Medium', fontSize: 16)),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),

                    //custom icon
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      child: Row(
                        // spacing: 10,
                        // runSpacing: 10,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OverviewWidget(
                            color: Color.fromARGB(255, 114, 184, 176),
                            value: model.classAtt,
                            name: "Class",
                          ),
                          OverviewWidget(
                            color: Color(0xFF149269),
                            value: model.presentAtt,
                            name: "Present",
                          ),
                          OverviewWidget(
                            color: Color(0xFFFFC336),
                            value: model.compAtt,
                            name: "Comp",
                          ),
                          OverviewWidget(
                            color: Color(0xFFE13000),
                            value: model.absentAtt,
                            name: "Absent",
                          ),
                          // OverviewWidget(
                          //   color: Color(0xFF800080),
                          //   value: "${model.yearAttendanceReport?.tot?.toInt() ?? 0}",
                          //   name: "Holiday",
                          // ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      child: Column(children: [
                        SfCircularChart(series: <CircularSeries>[
                          // Render pie chart
                          PieSeries<ChartData, String>(
                              dataLabelSettings: DataLabelSettings(
                                  // Renders the data label
                                  textStyle: TextStyle(color: WhiteColor, fontFamily: 'Gilroy Medium', fontSize: 16),
                                  isVisible: true),
                              // endAngle: model.yearAttendanceReport!.pie!.totClasses,
                              dataSource: model.commonChartData,
                              name: "%",
                              pointColorMapper: (ChartData data, _) => data.color,
                              dataLabelMapper: (ChartData data, _) => data.name,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y),
                        ])
                      ]),
                    ),
                    (model.yearAttendanceReport?.isStudent ?? false)
                        ? Center(
                            child: Text(
                              model.selectSubejctValue == null ? "All Subject Attendance".toUpperCase() : "${model.selectSubejctValue} Subject Attendance".toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(color: primaryColor, fontFamily: 'Gilroy Bold', fontSize: 20),
                            ),
                          )
                        : const SizedBox(),
                    (model.yearAttendanceReport?.isStudent ?? false)
                        ? const SizedBox(
                            height: 20,
                          )
                        : const SizedBox(),
                    (model.yearAttendanceReport?.isStudent ?? false)
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ColorCodeWidget(
                                  color: Color.fromARGB(255, 114, 184, 176),
                                  name: "Class",
                                ),
                                ColorCodeWidget(
                                  color: Color(0xFF149269),
                                  name: "Present",
                                ),
                                ColorCodeWidget(
                                  color: Color(0xFFFFC336),
                                  name: "Comp",
                                ),
                                ColorCodeWidget(
                                  color: Color(0xFFE13000),
                                  name: "Absent",
                                ),
                                ColorCodeWidget(
                                  color: Color(0xFF800080),
                                  name: "Holiday",
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                    (model.yearAttendanceReport?.isStudent ?? false)
                        ? GridView.count(
                            // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                            scrollDirection: Axis.vertical,
                            crossAxisCount: 3,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            childAspectRatio: (itemWidth / 240),
                            children: List.generate(model.chartData.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                child: Column(children: [
                                  Container(
                                    // color: Colors.black,
                                    height: 120,
                                    child: SfCircularChart(series: <CircularSeries>[
                                      // Render pie chart
                                      PieSeries<ChartData, String>(
                                          dataLabelSettings: DataLabelSettings(
                                              // Renders the data label
                                              textStyle: TextStyle(color: WhiteColor, fontFamily: 'Gilroy Medium', fontSize: 12),
                                              isVisible: true),
                                          // endAngle: model.yearAttendanceReport!.pie!.totClasses,
                                          dataSource: model.chartData[index].data,
                                          name: "%",
                                          pointColorMapper: (ChartData data, _) => data.color,
                                          dataLabelMapper: (ChartData data, _) => data.name,
                                          xValueMapper: (ChartData data, _) => data.x,
                                          yValueMapper: (ChartData data, _) => data.y),
                                    ]),
                                  ),
                                  Text(
                                    model.chartData[index].name ?? "",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Color(0xFF3A3A3A),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ]),
                              );
                            }))
                        : const SizedBox(),
                  ],
                ),
              ),
            )));
  }
}

class ColorCodeWidget extends StatelessWidget {
  Color color;
  String name;
  ColorCodeWidget({
    required this.color,
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: ShapeDecoration(
            color: color,
            shape: OvalBorder(),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          name,
          style: const TextStyle(
            color: Color(0xFF4A7948),
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      ],
    );
  }
}

class OverviewWidget extends StatelessWidget {
  String value;
  String name;
  Color color;
  OverviewWidget({
    required this.color,
    required this.name,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 75,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(color: WhiteColor, fontFamily: 'Gilroy Medium', fontSize: 16),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: TextStyle(color: WhiteColor, fontFamily: 'Gilroy Medium', fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.name, {this.color});
  final String x;
  final double y;
  String name;
  Color? color;
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

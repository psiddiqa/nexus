import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/UI/Attendance/yearly_report/report_view_model.dart';
import 'package:nedusoft/models/staff/yearly_attendance_report.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../Utils/Colors.dart';
import '../../../../core/widget/common_app_bar.dart';
import 'package:flutter/cupertino.dart';

class StudentAttendanceYearlyReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (model) async => await model.init(),
        viewModelBuilder: () => YearlyReportViewmodel(),
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
                    //custom icon
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "OverView",
                            style: TextStyle(color: primaryColor, fontFamily: 'Gilroy Bold', fontSize: 20),
                          ),
                          Container(
                            height: 45,
                            width: 150,
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
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      child: Row(
                        // spacing: 10,
                        // runSpacing: 10,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OverviewWidget(
                            color: Color.fromARGB(255, 114, 184, 176),
                            value: "${model.yearAttendanceReport?.pie?.totClasses ?? 0}",
                            name: "Class",
                          ),
                          OverviewWidget(
                            color: Color(0xFF149269),
                            value: "${model.yearAttendanceReport?.pie?.totPresent?.toInt() ?? 0}",
                            name: "Present",
                          ),
                          OverviewWidget(
                            color: Color(0xFFFFC336),
                            value: "${model.yearAttendanceReport?.pie?.totLeaves?.toInt() ?? 0}",
                            name: "Comp",
                          ),
                          OverviewWidget(
                            color: Color(0xFFE13000),
                            value: "${model.yearAttendanceReport?.pie?.totAbsent?.toInt() ?? 0}",
                            name: "Absent",
                          ),
                          OverviewWidget(
                            color: Color(0xFF800080),
                            value: "${model.yearAttendanceReport?.pie?.totHolidays?.toInt() ?? 0}",
                            name: "Holiday",
                          ),
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
                              dataSource: model.chartData,
                              name: "%",
                              pointColorMapper: (ChartData data, _) => data.color,
                              dataLabelMapper: (ChartData data, _) => data.name,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y),
                        ])
                      ]),
                    ),
                    Center(
                      child: Text(
                        "Attendance Chart",
                        style: TextStyle(color: primaryColor, fontFamily: 'Gilroy Bold', fontSize: 20),
                      ),
                    ),
                    BarChartSample2(
                      model: model,
                    ),
                  ],
                ),
              ),
            )));
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

class BarChartSample2 extends StatefulWidget {
  YearlyReportViewmodel model;
  BarChartSample2({required this.model});
  final Color avgColor = Colors.orange;
  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  final double width = 7;

  int touchedGroupIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: BarChart(
                BarChartData(
                  maxY: 100,
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: bottomTitles,
                        reservedSize: 42,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        interval: 25,
                        getTitlesWidget: leftTitles,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: widget.model.showingBarGroups,
                  gridData: const FlGridData(show: false),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    log(meta.formattedValue);
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(value.toInt().toString(), style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>[
      'Present',
      'Absent',
      'Leave',
    ];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }
}

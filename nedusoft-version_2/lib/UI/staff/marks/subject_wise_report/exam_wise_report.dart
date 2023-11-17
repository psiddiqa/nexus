import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/UI/staff/marks/subject_wise_report/exam_wise_report_view_model.dart';
import 'package:nedusoft/UI/staff/marks/subject_wise_report/student_show_view_model.dart';
import 'package:nedusoft/models/staff/student_Show_performance_model.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../Utils/Colors.dart';
import '../../../../Utils/custom_snackbar.dart';
import '../../../../app/app.router.dart';
import '../../../../core/widget/common_app_bar.dart';
import '../../../../main.dart';
import '../../../Attendance/subject_report/report_screen.dart';

class StudentExamWiseReportScreen extends StatelessWidget {
  String yearId;
  String subjectId;
  String classId;
  String sectionId;
  int studentId;
  String name;
  StudentExamWiseReportScreen({required this.classId, required this.studentId, required this.subjectId, required this.yearId, required this.name, required this.sectionId});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (model) async => await model.getReport(yearId, studentId.toString(), subjectId, sectionId, classId),
        viewModelBuilder: () => StudentExamWiseViewModel(),
        builder: (context, model, child) => LoadingOverlay(
            isLoading: model.isBusy,
            progressIndicator: const CircularProgressIndicator(
              color: Colors.white,
            ),
            opacity: 0.5,
            child: Scaffold(
              appBar: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, 60), child: CommonAppBar("$name")),
              backgroundColor: WhiteColor,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 12,
                    ),
                    model.list == null
                        ? const SizedBox()
                        : Center(
                            child: SizedBox(
                              height: 250,
                              // width: MediaQuery.sizeOf(context).width * 0.5,
                              child: SfCircularChart(legend: const Legend(isVisible: true), series: <CircularSeries>[
                                // Render pie chart

                                PieSeries<ChartData, String>(
                                    legendIconType: LegendIconType.circle,
                                    dataLabelSettings: DataLabelSettings(
                                        // Renders the data label
                                        labelPosition: ChartDataLabelPosition.inside,
                                        alignment: ChartAlignment.near,
                                        textStyle: TextStyle(color: WhiteColor, fontFamily: 'Gilroy Regular', fontSize: 12),
                                        isVisible: true),
                                    // endAngle: model.yearAttendanceReport!.pie!.totClasses,
                                    dataSource: model.list,
                                    pointColorMapper: (ChartData data, _) => data.color,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) => data.y),
                              ]),
                            ),
                          ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: Get.width * 0.09,
                            child: Text("S.No", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                          ),
                          SizedBox(
                            width: Get.width * 0.25,
                            child: Text("Subject", textAlign: TextAlign.start, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                          ),

                          SizedBox(
                            // width: Get.width * 0.10,
                            child: Text("Obt. Marks", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                          ),
                          // SizedBox(
                          //   // width: Get.width * 0.10,
                          //   child: Text("AB", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                          // ),
                          SizedBox(
                            // width: Get.width * 0.10,
                            child: Text("%", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                          ),
                        ],
                      ),
                    ),
                    // ignore: unnecessary_null_comparison
                    model.reportModel == null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 28),
                            child: SvgPicture.asset("assets/No data-amico.svg"),
                          )
                        : ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: model.reportModel!.subjects!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  // model.navigationService.navigateTo(Routes.studentWiseAttendanceReportScreen, arguments: StudentWiseAttendanceReportScreenArguments(studentId: model.reportModel!.list![index].studentId ?? 0, subjectId: subjectId, classId: classId, yearId: yearId));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.09,
                                        child: Text((index + 1).toString(), textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.2,
                                        child: Text(model.reportModel?.subjects?[index].subject ?? "", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.23,
                                        child: Text(model.reportModel?.subjects?[index].obtMarks.toString() ?? "------", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.10,
                                        child: Text(model.reportModel?.subjects![index].subjectPerc!.toStringAsFixed(2).toString() ?? "", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
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
                          ),
                    //
                    SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            )));
  }
}

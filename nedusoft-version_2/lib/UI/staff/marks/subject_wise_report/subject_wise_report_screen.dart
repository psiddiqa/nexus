import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/UI/staff/marks/subject_wise_report/subject_wise_report_view_model.dart';
import 'package:nedusoft/app/app.router.dart';
import 'package:nedusoft/models/getall_section_model.dart';
import 'package:nedusoft/models/staff/getStudentClassWise_model.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../Utils/Colors.dart';
import '../../../../Utils/custom_snackbar.dart';
import '../../../../core/widget/common_app_bar.dart';
import '../../../../main.dart';
import '../../../../models/getall_subject_model.dart';
import '../../../Attendance/subject_report/report_screen.dart';

class StudentWiseReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (model) async => await model.init(false),
        viewModelBuilder: () => StudentWiseReportViewmodel(),
        builder: (context, model, child) => LoadingOverlay(
            isLoading: model.isBusy,
            progressIndicator: const CircularProgressIndicator(
              color: Colors.white,
            ),
            opacity: 0.5,
            child: Scaffold(
              appBar: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, 60), child: CommonAppBar("Class Wise Performance")),
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
                      height: 240,
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
                                      'Year*',
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
                              SizedBox(
                                width: 18,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Class*',
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
                                          model.changeClass(newvalue as Class);
                                        },
                                        value: model.selectClassValue ?? model.classList[0],
                                        hint: const Text(
                                          "Class",
                                          style: TextStyle(
                                            color: Color(0xFF4AABA0),
                                            fontSize: 18,
                                            fontFamily: "Gilroy Medium",
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                        items: model.classList.map((Class valueItem) {
                                          return DropdownMenuItem<Class>(
                                            value: valueItem,
                                            child: Text(valueItem.text!, style: TextStyle(color: BlackColor, fontFamily: 'Gilroy Medium', fontSize: 16)),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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
                                      'Section*',
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
                                          model.changeSectionValue(newvalue as SectionList);
                                        },
                                        value: model.selectSectionValue ?? model.sectionList[0],
                                        hint: const Text(
                                          "Section",
                                          style: TextStyle(
                                            color: Color(0xFF4AABA0),
                                            fontSize: 18,
                                            fontFamily: "Gilroy Medium",
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                        items: model.sectionList.map((SectionList valueItem) {
                                          return DropdownMenuItem<SectionList>(
                                            value: valueItem,
                                            child: Text(valueItem.text!, style: TextStyle(color: BlackColor, fontFamily: 'Gilroy Medium', fontSize: 16)),
                                          );
                                        }).toList(),
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
                                      'Exam*',
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
                                      height: 50,
                                      // width: MediaQuery.sizeOf(context).width,
                                      // margin: const EdgeInsets.only(right: 12),
                                      padding: const EdgeInsets.only(left: 4),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: WhiteColor, border: Border.all(color: secondryColor)),
                                      child: DropdownButton(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        borderRadius: BorderRadius.circular(10),
                                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                                        iconSize: 20,
                                        isExpanded: true,
                                        underline: const SizedBox(),
                                        value: model.selectExamMasterValue ?? model.examMasterList[0],
                                        onChanged: (newvalue) {
                                          model.changeExamMasterValue(newvalue as SubjectList);
                                          // setState(() {
                                          //   selectarrive = newvalue as String?;
                                          // });
                                        },
                                        items: model.examMasterList.map((SubjectList valueItem) {
                                          return DropdownMenuItem<SubjectList>(
                                            value: valueItem,
                                            child: Text(valueItem.text!, style: TextStyle(color: BlackColor, fontFamily: 'Gilroy Medium', fontSize: 16)),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: InkWell(
                            onTap: () async {
                              if (model.selectClassValue != null && model.selectSectionValue != null && model.selectExamMasterValue != null) {
                                if (model.selectClassValue!.text != "All" && model.selectSectionValue!.text != "All" && model.selectExamMasterValue!.text != "All") {
                                  await model.init(true);
                                } else {
                                  showCustomSnackbar(msg: "Please Select Any Other Value", type: SnackbarType.failure);
                                }
                              } else {
                                showCustomSnackbar(msg: "Please Select Required fields", type: SnackbarType.failure);
                              }
                            },
                            child: Container(
                                height: 45,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: WhiteColor),
                                child: Center(
                                  child: Text("Search", style: TextStyle(color: primaryColor, fontSize: 19, fontFamily: "Gilroy Bold")),
                                )),
                          ),
                        ),
                      ]),
                    ),
                    model.getStudentClassWisePerformanceDataModel == null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 28),
                            child: SvgPicture.asset("assets/No data-amico.svg"),
                          )
                        : ListView.separated(
                            itemCount: model.getStudentClassWisePerformanceDataModel!.list!.length,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) => const SizedBox(
                              height: 12,
                            ),
                            itemBuilder: (_, index) => InkWell(
                              onTap: () {
                                model.navigationService.navigateTo(Routes.studentShowListReportScreen, arguments: StudentShowListReportScreenArguments(classId: model.getStudentClassWisePerformanceDataModel?.list?[index].classId.toString() ?? "0", subjectId: model.getStudentClassWisePerformanceDataModel?.list?[index].examId.toString() ?? "0", yearId: model.selectYearValue?.yearId.toString() ?? "", name: model.getStudentClassWisePerformanceDataModel?.list?[index].sectionName ?? "", sectionId: model.getStudentClassWisePerformanceDataModel?.list?[index].sectionId.toString() ?? ""));
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 12),
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                                height: 220,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
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
                                child: Row(children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                                      decoration: ShapeDecoration(
                                        color: primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(11),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Wrap(
                                            // mainAxisAlignment: MainAxisAlignment.center,
                                            runSpacing: 18,
                                            spacing: 10,
                                            children: [
                                              Text(
                                                '${model.getStudentClassWisePerformanceDataModel?.list?[index].sectionName ?? ""} : ${model.getStudentClassWisePerformanceDataModel?.list?[index].count ?? 0}',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontFamily: "Gilroy Medium",
                                                  fontWeight: FontWeight.w700,
                                                  height: 0.07,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 12,
                                              ),
                                              Text(
                                                '${model.getStudentClassWisePerformanceDataModel?.list?[index].exam ?? ""}',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontFamily: "Gilroy Medium",
                                                  fontWeight: FontWeight.w700,
                                                  height: 0.07,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Wrap(
                                            spacing: 12,
                                            runSpacing: 8,
                                            children: List.generate(
                                              model.getStudentClassWisePerformanceDataModel!.list![index].grades!.length,
                                              (idx) => ContainerBoxWidget(
                                                color: model.returnColor(model.getStudentClassWisePerformanceDataModel!.list![index].grades![idx].gradeName ?? ""),
                                                tag: "${model.getStudentClassWisePerformanceDataModel!.list![index].grades![idx].gradeName}",
                                                val: "${model.getStudentClassWisePerformanceDataModel!.list![index].grades![idx].grade}",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // height: 250,
                                    width: MediaQuery.sizeOf(context).width * 0.5,
                                    child: SfCircularChart(series: <CircularSeries>[
                                      // Render pie chart
                                      PieSeries<ChartData, String>(
                                          dataLabelSettings: DataLabelSettings(
                                              // Renders the data label
                                              textStyle: TextStyle(color: WhiteColor, fontFamily: 'Gilroy Regular', fontSize: 12),
                                              isVisible: true),
                                          // endAngle: model.yearAttendanceReport!.pie!.totClasses,
                                          dataSource: List.generate(model.getStudentClassWisePerformanceDataModel!.list![index].grades!.length, (idx) => ChartData(model.getStudentClassWisePerformanceDataModel?.list?[index].grades?[idx].gradeName ?? "", model.getStudentClassWisePerformanceDataModel?.list?[index].grades?[idx].percentage?.toDouble() ?? 0.0, model.getStudentClassWisePerformanceDataModel?.list?[index].grades?[idx].gradeName ?? "", color: model.returnColor(model.getStudentClassWisePerformanceDataModel?.list?[index].grades?[idx].gradeName ?? ""))),
                                          pointColorMapper: (ChartData data, _) => data.color,
                                          xValueMapper: (ChartData data, _) => data.x,
                                          yValueMapper: (ChartData data, _) => data.y),
                                    ]),
                                  )
                                ]),
                              ),
                            ),
                          )
                  ],
                ),
              ),
            )));
  }
}

class ContainerBoxWidget extends StatelessWidget {
  String tag;
  String val;
  Color color;
  ContainerBoxWidget({
    super.key,
    required this.color,
    required this.tag,
    required this.val,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 47,
      height: 22,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            tag,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: "Gilroy Medium",
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          const Text(
            ':',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: "Gilroy Medium",
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          Text(
            val,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: "Gilroy Medium",
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/UI/staff/Attendance/yearly_report/report_view_model.dart';
import 'package:nedusoft/models/staff/getFacultySubjectWiseAttnDataModel.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../Utils/Colors.dart';
import '../../../../app/app.router.dart';
import '../../../../core/widget/common_app_bar.dart';

class AttendanceYearlyReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 2;
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
                    model.getFacultySubjectAttnDataModel == null
                        ? SizedBox()
                        : model.getFacultySubjectAttnDataModel!.list!.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 28),
                                child: SvgPicture.asset("assets/No data-amico.svg"),
                              )
                            : GridView.count(
                                crossAxisCount: 2,
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                childAspectRatio: (itemWidth / 300),
                                children: List.generate(model.getFacultySubjectAttnDataModel!.list!.length, (index) {
                                  return InkWell(
                                    onTap: () {
                                      model.navigationService.navigateTo(Routes.studentAttendanceListReportScreen, arguments: StudentAttendanceListReportScreenArguments(totalClasses: model.getFacultySubjectAttnDataModel?.list?[index].totClasses.toString() ?? "", classId: model.getFacultySubjectAttnDataModel?.list?[index].classId.toString() ?? "", subjectId: model.getFacultySubjectAttnDataModel?.list?[index].subjectId.toString() ?? "", yearId: model.selectYearValue?.yearId.toString() ?? "1", name: "${model.getFacultySubjectAttnDataModel?.list?[index].subject} (${model.getFacultySubjectAttnDataModel?.list?[index].className})"));
                                    },
                                    child: Column(
                                      children: [
                                        OverviewWidget(
                                          sectionName: model.getFacultySubjectAttnDataModel?.list?[index].className ?? "",
                                          subject: model.getFacultySubjectAttnDataModel?.list?[index].subject ?? "",
                                          allocation: model.getFacultySubjectAttnDataModel?.list?[index].clsAlloted.toString() ?? "",
                                          classTaken: model.getFacultySubjectAttnDataModel?.list?[index].totClasses.toString() ?? "",
                                        ),
                                        Container(
                                          height: 200,
                                          child: SfCircularChart(series: <CircularSeries>[
                                            // Render pie chart
                                            PieSeries<ChartData, String>(
                                                dataLabelSettings: DataLabelSettings(
                                                    // Renders the data label
                                                    textStyle: TextStyle(color: WhiteColor, fontFamily: 'Gilroy Regular', fontSize: 12),
                                                    isVisible: true),
                                                // endAngle: model.yearAttendanceReport!.pie!.totClasses,
                                                dataSource: [ChartData("tot_absent", model.getFacultySubjectAttnDataModel?.list?[index].clsPendingPer?.toDouble() ?? 100.0, color: Color(0xFFE13000)), ChartData("tot_allocation", model.getFacultySubjectAttnDataModel?.list?[index].clsTakenPerc?.toDouble() ?? 100.0, color: primaryColor)],
                                                pointColorMapper: (ChartData data, _) => data.color,
                                                xValueMapper: (ChartData data, _) => data.x,
                                                yValueMapper: (ChartData data, _) => data.y),
                                          ]),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                              ),
                  ],
                ),
              ),
            )));
  }
}

class OverviewWidget extends StatelessWidget {
  String sectionName;
  String subject;
  String allocation;
  String classTaken;
  OverviewWidget({
    required this.sectionName,
    required this.subject,
    required this.allocation,
    required this.classTaken,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 72,
      // height: 75,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: ShapeDecoration(
        color: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              "Section - $sectionName",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: WhiteColor, fontFamily: 'Gilroy Medium', fontSize: 10),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "$subject",
            style: TextStyle(color: WhiteColor, fontFamily: 'Gilroy Medium', fontSize: 10),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Allocated $allocation",
            style: TextStyle(color: WhiteColor, fontFamily: 'Gilroy Medium', fontSize: 10),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Total Att : $classTaken",
            style: TextStyle(color: WhiteColor, fontFamily: 'Gilroy Medium', fontSize: 10),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, {this.color});
  final String x;
  final double y;
  Color? color;
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

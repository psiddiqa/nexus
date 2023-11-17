import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/UI/staff/Attendance/monthly_report/report_view_model.dart';
import 'package:nedusoft/app/app.router.dart';
import 'package:stacked/stacked.dart';
import '../../../../Utils/Colors.dart';
import '../../../../core/widget/common_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class StudentAttendanceListReportScreen extends StatelessWidget {
  String yearId;
  String subjectId;
  String classId;
  String name;
  String totalClasses;
  StudentAttendanceListReportScreen({required this.classId, required this.subjectId, required this.yearId, required this.name, required this.totalClasses});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (model) async => await model.getReport(yearId, subjectId, classId),
        viewModelBuilder: () => ReportViewmodel(),
        builder: (context, model, child) => LoadingOverlay(
            isLoading: model.isBusy,
            progressIndicator: const CircularProgressIndicator(
              color: Colors.white,
            ),
            opacity: 0.5,
            child: Scaffold(
              appBar: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, 60), child: CommonAppBar("$name $totalClasses")),
              backgroundColor: WhiteColor,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 12,
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
                            // width: Get.width * 0.09,
                            child: Text("S.No", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                          ),
                          SizedBox(
                            // width: Get.width * 0.25,
                            child: Text("Name", textAlign: TextAlign.start, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                          ),
                          SizedBox(
                            // width: Get.width * 0.2,
                            child: Text("Roll No", textAlign: TextAlign.start, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                          ),
                          SizedBox(
                            // width: Get.width * 0.10,
                            child: Text("P", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                          ),
                          SizedBox(
                            // width: Get.width * 0.10,
                            child: Text("A", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                          ),
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
                            itemCount: model.reportModel!.list!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  model.navigationService.navigateTo(Routes.studentWiseAttendanceReportScreen, arguments: StudentWiseAttendanceReportScreenArguments(studentId: model.reportModel!.list![index].studentId ?? 0, subjectId: subjectId, classId: classId, yearId: yearId));
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
                                        child: Text(model.reportModel!.list![index].stName ?? "", style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.23,
                                        child: Text(model.reportModel!.list![index].rollNum ?? "", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.10,
                                        child: Text(model.reportModel!.list![index].classAttn.toString() ?? "", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.10,
                                        child: Text(model.reportModel!.list![index].classAbs.toString() ?? "", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.10,
                                        child: Text(model.reportModel!.list![index].classAttnPer!.toStringAsFixed(1) ?? "",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "Gilroy Medium",
                                              color: BlackColor,
                                            )),
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

class HeatMapCalendarExample extends StatefulWidget {
  const HeatMapCalendarExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HeatMapCalendarExample();
}

class _HeatMapCalendarExample extends State<HeatMapCalendarExample> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController heatLevelController = TextEditingController();

  bool isOpacityMode = true;

  Map<DateTime, int> heatMapDatasets = {};

  @override
  void dispose() {
    super.dispose();
    dateController.dispose();
    heatLevelController.dispose();
  }

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
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),

          // HeatMapCalendar
          child: HeatMapCalendar(
            flexible: true,
            datasets: heatMapDatasets,
            // defaultColor: Colors.black,
            monthFontSize: 20,
            weekFontSize: 16,
            borderRadius: 12,
            margin: EdgeInsets.all(6),
            textColor: Colors.black,
            showColorTip: false,
            colorMode: isOpacityMode ? ColorMode.opacity : ColorMode.color,
            colorsets: const {
              1: Color(0xFF149369),
              2: Color(0xFFFFC436),
              3: Color(0xFF4A7948),
              4: Color(0xFFF63B08),
              5: Color(0xFF800080),
            },
          ),
        ),
        _textField('YYYYMMDD', dateController),
        _textField('Heat Level', heatLevelController),
        ElevatedButton(
          child: const Text('COMMIT'),
          onPressed: () {
            setState(() {
              heatMapDatasets[DateTime.parse(dateController.text)] = int.parse(heatLevelController.text);
            });
          },
        ),

        // ColorMode/OpacityMode Switch.
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Color Mode'),
            CupertinoSwitch(
              value: isOpacityMode,
              onChanged: (value) {
                setState(() {
                  isOpacityMode = value;
                });
              },
            ),
            const Text('Opacity Mode'),
          ],
        ),
      ],
    );
  }
}

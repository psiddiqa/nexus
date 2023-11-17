import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/UI/Attendance/monthly_report/report_view_model.dart';
import 'package:stacked/stacked.dart';
import '../../../../Utils/Colors.dart';
import '../../../../core/widget/common_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class StudentAttendanceReportScreen extends StatelessWidget {
  StudentAttendanceReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (model) async => await model.init(true),
        viewModelBuilder: () => StudentReportViewmodel(),
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
                    HeatMapCalendarExample(
                      model: model,
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
                            value: "${model.yearAttendanceReport?.pie?.totClasses}",
                            name: "Class",
                          ),
                          OverviewWidget(
                            color: Color(0xFF149269),
                            value: "${model.yearAttendanceReport?.pie?.totPresent?.toInt()}",
                            name: "Present",
                          ),
                          OverviewWidget(
                            color: Color(0xFFFFC336),
                            value: "${model.yearAttendanceReport?.pie?.totLeaves?.toInt()}",
                            name: "Comp",
                          ),
                          OverviewWidget(
                            color: Color(0xFFE13000),
                            value: "${model.yearAttendanceReport?.pie?.totAbsent?.toInt()}",
                            name: "Absent",
                          ),
                          OverviewWidget(
                            color: Color(0xFF800080),
                            value: "${model.yearAttendanceReport?.pie?.totHolidays?.toInt()}",
                            name: "Holiday",
                          ),
                        ],
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
                          (model.yearAttendanceReport?.isSubject ?? false)
                              ? SizedBox(
                                  width: Get.width * 0.2,
                                  child: Text("Subject", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                                )
                              : const SizedBox(),
                          SizedBox(
                            width: Get.width * 0.15,
                            child: Text("Total", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                          ),
                          SizedBox(
                            width: Get.width * 0.15,
                            child: Text("Prsent", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                          ),
                          SizedBox(
                            width: Get.width * 0.15,
                            child: Text("Absent", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                          ),
                          SizedBox(
                            width: Get.width * 0.12,
                            child: Text("%", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                          ),
                        ],
                      ),
                    ),
                    // ignore: unnecessary_null_comparison
                    model.yearAttendanceReport == null
                        ? const SizedBox()
                        : ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: model.attnList!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    (model.yearAttendanceReport?.isSubject ?? false)
                                        ? SizedBox(
                                            width: Get.width * 0.2,
                                            child: Text(model.attnList![index].subject ?? "", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                          )
                                        : const SizedBox(),
                                    SizedBox(
                                      width: Get.width * 0.15,
                                      child: Text(model.attnList![index].total.toString() ?? "", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.15,
                                      child: Text(model.attnList![index].presentDays.toString() ?? "", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.15,
                                      child: Text(model.attnList![index].absentDays.toString() ?? "", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.15,
                                      child: Text(model.attnList![index].percentage!.toStringAsFixed(2) ?? "",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "Gilroy Medium",
                                            color: BlackColor,
                                          )),
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
                          ),
                    const SizedBox(
                      height: 30,
                    )
                    //
                  ],
                ),
              ),
            )));
  }
}

class HeatMapCalendarExample extends StatefulWidget {
  StudentReportViewmodel? model;
  HeatMapCalendarExample({required this.model, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HeatMapCalendarExample();
}

class _HeatMapCalendarExample extends State<HeatMapCalendarExample> {
  // final TextEditingController dateController = TextEditingController();
  // final TextEditingController heatLevelController = TextEditingController();

  // bool isOpacityMode = true;

  @override
  void dispose() {
    super.dispose();
    // dateController.dispose();
    // heatLevelController.dispose();
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
            datasets: widget.model!.heatMapDatasets,
            // defaultColor: Colors.black,
            onMonthChange: (date) async {
              log(date.toString());
              widget.model!.changeMonth(date);
            },
            monthFontSize: 20,
            weekFontSize: 16,
            borderRadius: 12,
            margin: EdgeInsets.all(6),
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
      height: 50,
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
            name,
            style: TextStyle(color: WhiteColor, fontFamily: 'Gilroy Medium', fontSize: 14),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/UI/staff/marks/subject_wise_report/student_show_view_model.dart';
import 'package:nedusoft/models/getall_section_model.dart';
import 'package:nedusoft/models/getall_subject_model.dart';
import 'package:nedusoft/models/staff/student_Show_performance_model.dart';
import 'package:stacked/stacked.dart';

import '../../../../Utils/Colors.dart';
import '../../../../Utils/custom_snackbar.dart';
import '../../../../app/app.router.dart';
import '../../../../core/widget/common_app_bar.dart';
import '../../../../main.dart';

class StudentShowListReportScreen extends StatelessWidget {
  String yearId;
  String subjectId;
  String classId;
  String sectionId;
  String name;
  StudentShowListReportScreen({required this.classId, required this.subjectId, required this.yearId, required this.name, required this.sectionId});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (model) async => await model.init(yearId, subjectId, sectionId, classId),
        viewModelBuilder: () => StudentShowViewModel(),
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
                                        value: model.selectYearValue ?? model.yearList[0],
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
                                          model.changeExamMasterValue(newvalue as SubjectList);
                                        },
                                        value: model.selectExamMasterValue ?? model.examMasterList[0],
                                        hint: const Text(
                                          "Exam",
                                          style: TextStyle(
                                            color: Color(0xFF4AABA0),
                                            fontSize: 18,
                                            fontFamily: "Gilroy Medium",
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
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
                        SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: InkWell(
                            onTap: () async {
                              if (model.selectYearValue != null && model.selectClassValue != null && model.selectSectionValue != null && model.selectExamMasterValue != null) {
                                await model.navigateToSearchScreen();
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
                            child: Text("Marks", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
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
                        : model.reportModel!.list!.isEmpty
                            ? Center(
                                child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                child: Text("No Data", textAlign: TextAlign.center, style: TextStyle(fontSize: 26, fontFamily: "Gilroy Medium", color: BlackColor)),
                              ))
                            : ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: model.reportModel!.list!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      model.navigationService.navigateTo(Routes.studentExamWiseReportScreen, arguments: StudentExamWiseReportScreenArguments(yearId: yearId, sectionId: sectionId, classId: classId, subjectId: subjectId, studentId: model.reportModel!.list![index].studentId!, name: model.reportModel!.list![index].stName ?? ""));
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
                                            child: Text(model.reportModel!.list![index].stRollNum ?? "------", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.10,
                                            child: Text(model.reportModel!.list![index].obtMarks.toString() ?? "", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.10,
                                            child: Text(model.reportModel!.list![index].perc.toString() ?? "", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                          ),
                                          // SizedBox(
                                          //   width: Get.width * 0.10,
                                          //   child: Text(model.reportModel!.list![index].classAttnPer!.toStringAsFixed(1) ?? "",
                                          //       textAlign: TextAlign.center,
                                          //       style: TextStyle(
                                          //         fontSize: 14,
                                          //         fontFamily: "Gilroy Medium",
                                          //         color: BlackColor,
                                          //       )),
                                          // ),
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

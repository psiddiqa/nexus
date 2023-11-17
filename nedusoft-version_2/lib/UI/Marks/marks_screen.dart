// ignore_for_file: file_names, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nedusoft/UI/Marks/marks_view_model.dart';

import 'package:nedusoft/Utils/Colors.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/core/widget/text_widget.dart';
import 'package:nedusoft/models/student/get_mark_dropdown_model.dart';
import 'package:stacked/stacked.dart';
import '../../../core/widget/common_app_bar.dart';
import '../../Utils/custom_snackbar.dart';
import '../../main.dart';

class StudentMarks extends StatelessWidget {
  const StudentMarks({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) => viewModel.init(),
        viewModelBuilder: () => StudentMarksViewModel(),
        builder: (context, model, child) => LoadingOverlay(
              isLoading: model.isBusy,
              progressIndicator: const CircularProgressIndicator(
                color: Colors.white,
              ),
              opacity: 0.5,
              child: Scaffold(
                  appBar: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, 60), child: CommonAppBar("Marks Allocation")),
                  backgroundColor: WhiteColor,
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                        SizedBox(height: Get.height * 0.012),
                        SizedBox(
                          height: 16,
                        ),
                        CommonRequiedTextWidget(text: "My Section"),
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
                              value: model.selectSectionValue ?? model.sectionList[0],
                              onChanged: (newvalue) {
                                model.changeSectionValue(newvalue as ListElement);
                              },
                              items: model.sectionList.map((ListElement valueItem) {
                                return DropdownMenuItem<ListElement>(
                                  value: valueItem,
                                  child: Text(valueItem.text!, style: TextStyle(color: BlackColor, fontFamily: 'Gilroy Medium', fontSize: 16)),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        CommonRequiedTextWidget(text: "Select Exam"),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.sizeOf(context).width,
                          margin: EdgeInsets.only(right: 12),
                          padding: EdgeInsets.only(left: 4),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: WhiteColor, border: Border.all(color: secondryColor)),
                          child: DropdownButton(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            borderRadius: BorderRadius.circular(10),
                            icon: const Icon(Icons.keyboard_arrow_down_outlined),
                            iconSize: 20,
                            isExpanded: true,
                            underline: const SizedBox(),
                            value: model.selectExamMasterValue ?? model.examMasterList[0],
                            onChanged: (newvalue) {
                              model.changeExamMasterValue(newvalue as ExamList);
                            },
                            items: model.examMasterList.map((ExamList valueItem) {
                              return DropdownMenuItem<ExamList>(
                                value: valueItem,
                                child: Text(valueItem.text!, style: TextStyle(color: BlackColor, fontFamily: 'Gilroy Medium', fontSize: 16)),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: InkWell(
                            // onTap: ontap,
                            onTap: () async {
                              if (model.selectSectionValue != null && model.selectExamMasterValue != null) {
                                await model.search();
                              } else {
                                showCustomSnackbar(msg: "Please Select Required fields", type: SnackbarType.failure);
                              }
                              // Get.to(StaffAttendanceShow());
                            },
                            child: Container(
                                height: 50,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: primaryColor),
                                child: Center(
                                  child: Text("Search", style: TextStyle(color: WhiteColor, fontSize: 19, fontFamily: "Gilroy Bold")),
                                )),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.012),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                          decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Get.width * 0.22,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        model.changeSubjectOrder("Subject");
                                      },
                                      child: Row(
                                        children: [
                                          Text("Subject", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          model.order == "Subject"
                                              ? InkWell(
                                                  onTap: () {
                                                    // model.changeAscending();
                                                  },
                                                  child: model.sub
                                                      ? const Icon(
                                                          Icons.arrow_downward,
                                                          size: 18,
                                                        )
                                                      : const Icon(
                                                          Icons.arrow_upward,
                                                          size: 18,
                                                        ))
                                              : const SizedBox()
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.2,
                                child: InkWell(
                                  onTap: () {
                                    model.changeSubjectOrder("Faculty");
                                  },
                                  child: Row(
                                    children: [
                                      Text("Faculty", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      model.order == "Faculty"
                                          ? InkWell(
                                              onTap: () {
                                                // model.changeAscending();
                                              },
                                              child: model.fac
                                                  ? const Icon(
                                                      Icons.arrow_downward,
                                                      size: 18,
                                                    )
                                                  : const Icon(
                                                      Icons.arrow_upward,
                                                      size: 18,
                                                    ))
                                          : const SizedBox()
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.27,
                                child: InkWell(
                                  onTap: () {
                                    model.changeSubjectOrder("MarksO");
                                  },
                                  child: Row(
                                    children: [
                                      Text("Marks Obt.", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      model.order == "MarksO"
                                          ? InkWell(
                                              onTap: () {
                                                // model.changeAscending();
                                              },
                                              child: model.mark
                                                  ? const Icon(
                                                      Icons.arrow_downward,
                                                      size: 18,
                                                    )
                                                  : const Icon(
                                                      Icons.arrow_upward,
                                                      size: 18,
                                                    ))
                                          : const SizedBox()
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.12,
                                child: InkWell(
                                  onTap: () {
                                    model.changeSubjectOrder("adasd");
                                  },
                                  child: Row(
                                    children: [
                                      Text("%", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      model.order == "adasd"
                                          ? InkWell(
                                              onTap: () {
                                                // model.changeAscending();
                                              },
                                              child: model.per
                                                  ? const Icon(
                                                      Icons.arrow_downward,
                                                      size: 18,
                                                    )
                                                  : const Icon(
                                                      Icons.arrow_upward,
                                                      size: 18,
                                                    ))
                                          : const SizedBox()
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // ignore: unnecessary_null_comparison
                        model.getStudentMarksList == null
                            ? const SizedBox()
                            : ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: model.getStudentMarksList!.marksList!.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.25,
                                        child: Text(model.getStudentMarksList!.marksList![index].subName ?? "", style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.25,
                                        child: Text(model.getStudentMarksList!.marksList![index].facultyName ?? "", style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.23,
                                        child: Text(model.getStudentMarksList!.marksList![index].marksObtained.toString() ?? "", style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.15,
                                        child: Text(model.getStudentMarksList!.marksList![index].percentage!.toStringAsFixed(2) ?? "",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "Gilroy Medium",
                                              color: BlackColor,
                                            )),
                                      ),
                                    ],
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

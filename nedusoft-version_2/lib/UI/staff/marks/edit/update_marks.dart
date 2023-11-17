import 'dart:developer';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nedusoft/UI/staff/marks/add_marks_view_model.dart';
import 'package:nedusoft/UI/staff/marks/edit/update_marks_view_model.dart';
import '../../../../Utils/custom_snackbar.dart';
import '../../../../core/widget/common_app_bar.dart';
import '../../../../core/widget/text_widget.dart';
import 'package:nedusoft/Utils/Colors.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:stacked/stacked.dart';
import '../../../../main.dart';
import '../../../../models/staff/all_marks_students_model.dart';

class StaffUpdateMarkScreen extends StatelessWidget {
  List<AddMarksModel>? addMarksModel;
  AllUpdateStudentMarksList? dataModel;
  int? section;
  int? subject;
  int? classId;
  int? exam;
  int? assesment;

  StaffUpdateMarkScreen({required this.addMarksModel, required this.dataModel, required this.section, required this.subject, required this.exam, required this.assesment, required this.classId});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) => viewModel.init(dataModel!, addMarksModel!),
        viewModelBuilder: () => StaffUpdateMarksViewModel(),
        builder: (context, model, child) => LoadingOverlay(
              isLoading: model.isBusy,
              progressIndicator: const CircularProgressIndicator(
                color: Colors.white,
              ),
              opacity: 0.5,
              child: Scaffold(
                  bottomNavigationBar: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
                    child: InkWell(
                      onTap: () async {
                        await model.saveMarks(
                          section!,
                          subject!,
                          classId!,
                          exam!,
                          assesment!,
                        );
                      },
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: primaryColor),
                          child: Center(
                            child: Text("Update Marks", style: TextStyle(color: WhiteColor, fontSize: 19, fontFamily: "Gilroy Bold")),
                          )),
                    ),
                  ),
                  appBar: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, 60), child: CommonAppBar("Edit Marks Allocation")),
                  backgroundColor: WhiteColor,
                  body: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                    SizedBox(height: Get.height * 0.012),
                    Container(
                      height: 80,
                      margin: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(border: Border.all(color: primaryColor)),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.45,
                          child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                            CommonRequiedTextWidget(text: "Max Marks"),
                            const SizedBox(
                              height: 4,
                            ),
                            Container(
                                height: 35,
                                width: Get.width * 0.27,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: WhiteColor, border: Border.all(color: secondryColor)),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                                  SizedBox(
                                    height: 30,
                                    width: Get.width * 0.1,
                                    child: TextField(
                                      decoration: InputDecoration(border: InputBorder.none, contentPadding: EdgeInsets.symmetric(vertical: 12)),
                                      controller: model.maxMarks,
                                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                      inputFormatters: [DecimalTextInputFormatter(decimalRange: 2), LengthLimitingTextInputFormatter(6)],
                                    ),
                                  ),
                                ]))
                          ]),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.45,
                          child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                            CommonRequiedTextWidget(text: "Pass Marks"),
                            SizedBox(
                              height: 4,
                            ),
                            Container(
                                height: 35,
                                width: Get.width * 0.27,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: WhiteColor, border: Border.all(color: secondryColor)),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                                  SizedBox(
                                    height: 30,
                                    width: Get.width * 0.1,
                                    child: TextField(
                                      decoration: InputDecoration(border: InputBorder.none, contentPadding: EdgeInsets.symmetric(vertical: 12)),
                                      controller: model.passMarks,
                                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                      onChanged: (val) {
                                        if (model.maxMarks.text == "") {
                                          showCustomSnackbar(msg: "Enter Max Marks First", type: SnackbarType.failure);
                                        } else {
                                          if (double.parse(model.maxMarks.text) >= double.parse(val)) {
                                          } else {
                                            model.passMarks.text = "";
                                            showCustomSnackbar(msg: "Enter Value is greater than Max Marks", type: SnackbarType.failure);
                                          }
                                        }
                                      },
                                      inputFormatters: [DecimalTextInputFormatter(decimalRange: 2), LengthLimitingTextInputFormatter(6)],
                                    ),
                                  ),
                                ]))
                          ]),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 6),
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width * 0.33,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Name", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                                  // model.onlyAbsent
                                  //     ? SizedBox()
                                  //     : InkWell(
                                  //         onTap: () {
                                  //           // model.changeAscending();
                                  //         },
                                  //         child: Image.asset(
                                  //           "assets/ascending.png",
                                  //           scale: 1,
                                  //           width: 25,
                                  //           height: 25,
                                  //           color: model.ascending ? BlackColor : Colors.red,
                                  //         ),
                                  //       )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: Get.width * 0.23,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Roll No", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                                  // model.onlyAbsent
                                  //     ? SizedBox()
                                  //     : InkWell(
                                  //         onTap: () {
                                  //           // model.changeAscending();
                                  //         },
                                  //         child: Image.asset(
                                  //           "assets/ascending.png",
                                  //           scale: 1,
                                  //           width: 25,
                                  //           height: 25,
                                  //           color: model.ascending ? BlackColor : Colors.red,
                                  //         ),
                                  //       )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.25,
                              child: Text("Marks", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    model.getAllStudentMarksList == null
                        ? SizedBox()
                        : Expanded(
                            child: ListView.separated(
                            itemCount: model.getAllStudentMarksList!.list!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 18),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: Get.width * 0.35,
                                      child: Text(model.getAllStudentMarksList!.list![index].name ?? "", style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.2,
                                      child: Text(model.getAllStudentMarksList!.list![index].rollNo ?? "-----", style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                    ),
                                    AddMarksWidget(
                                      index: index,
                                      staffAddMarksViewModel: model,
                                    )
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
                          ))
                  ])),
            ));
  }
}

class AddMarksWidget extends StatefulWidget {
  int index;
  StaffUpdateMarksViewModel staffAddMarksViewModel;
  AddMarksWidget({
    required this.index,
    required this.staffAddMarksViewModel,
    super.key,
  });

  @override
  State<AddMarksWidget> createState() => _AddMarksWidgetState();
}

class _AddMarksWidgetState extends State<AddMarksWidget> {
  TextEditingController marks = TextEditingController();
  @override
  void initState() {
    marks.text = widget.staffAddMarksViewModel.addMarksList![widget.index].markesObtain ?? "0.0";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // marks.text = staffAddMarksViewModel.addMarksList![index].markesObtain;
    return Container(
        height: 45,
        width: Get.width * 0.2,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: WhiteColor, border: Border.all(color: secondryColor)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          SizedBox(
            height: 40,
            width: Get.width * 0.15,
            child: TextField(
              decoration: const InputDecoration(border: InputBorder.none, contentPadding: EdgeInsets.symmetric(vertical: 15)),
              controller: marks,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onChanged: (val) {
                if (val != "") {
                  if (double.parse(widget.staffAddMarksViewModel.maxMarks.text) >= double.parse(val)) {
                    widget.staffAddMarksViewModel.changeMarks(widget.index, val);
                  } else {
                    marks.text = "";
                    showCustomSnackbar(msg: "Enter Value is greater than Max Marks", type: SnackbarType.failure);
                  }
                }
              },
              inputFormatters: [DecimalTextInputFormatter(decimalRange: 2), LengthLimitingTextInputFormatter(5)], // Only numbers can be entered
            ),
          ),
        ]));
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({required this.decimalRange}) : assert(decimalRange == null || decimalRange > 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (decimalRange != null) {
      String value = newValue.text;

      if (value.contains(".") && value.substring(value.indexOf(".") + 1).length > decimalRange) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      } else if (value == ".") {
        truncated = "0.";

        newSelection = newValue.selection.copyWith(
          baseOffset: math.min(truncated.length, truncated.length + 1),
          extentOffset: math.min(truncated.length, truncated.length + 1),
        );
      }

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return newValue;
  }
}

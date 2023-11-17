import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:path/path.dart';
import 'package:stacked/stacked.dart';
import '../../../Utils/Colors.dart';
import '../../../Utils/Custom_widget.dart';
import '../../../core/widget/common_app_bar.dart';
import 'lesson_update_view_model.dart';

class StaffLessonUpdateScreen extends StatelessWidget {
  const StaffLessonUpdateScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) async => await viewModel.init(),
        viewModelBuilder: () => StaffLessonUpdateOnPageViewModel(),
        builder: (context, model, child) => LoadingOverlay(
              isLoading: model.isBusy,
              progressIndicator: const CircularProgressIndicator(
                color: Colors.white,
              ),
              opacity: 0.5,
              child: Scaffold(
                  appBar: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, 60), child: CommonAppBar("Lesson Details")),
                  floatingActionButton: FloatingActionButton(
                      backgroundColor: primaryColor,
                      child: const Center(child: Icon(Icons.add)),
                      onPressed: () {
                        model.navigateToAddScreen();
                      }),
                  backgroundColor: WhiteColor,
                  body: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const SizedBox(
                      height: 12,
                    ),
                    model.isBusy
                        ? const SizedBox()
                        : Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const BouncingScrollPhysics(),
                              itemCount: model.lessonUpdateOnPageLoadModel!.lessonLst!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: InkWell(
                                    onTap: () {
                                      log("message");
                                      model.navigateToViewScreen(model.lessonUpdateOnPageLoadModel!.lessonLst![index]);
                                    },
                                    child: Card(
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        height: 122,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              flex: 2,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Padding(
                                                          padding: const EdgeInsets.only(
                                                            bottom: 4,
                                                          ),
                                                          child: SvgPicture.asset(
                                                            "assets/book (1).svg",
                                                            width: 55,
                                                            height: 55,
                                                          )),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: Get.width * 0.65,
                                                            child: Text(
                                                              model.lessonUpdateOnPageLoadModel?.lessonLst?[index].topic ?? "Topic",
                                                              style: TextStyle(fontFamily: "Gilroy Bold", fontSize: 16, color: secondryColor, overflow: TextOverflow.ellipsis),
                                                            ),
                                                          ),
                                                          InkWell(
                                                              onTap: () {
                                                                model.navigateToEditScreen(model.lessonUpdateOnPageLoadModel!.lessonLst![index]);
                                                              },
                                                              child: Icon(
                                                                Icons.edit,
                                                                color: secondryColor,
                                                              ))
                                                        ],
                                                      ),
                                                      SizedBox(height: 5),
                                                      SizedBox(
                                                        width: Get.width * 0.55,
                                                        child: Text(model.lessonUpdateOnPageLoadModel?.lessonLst?[index].subjectName ?? "No Subject", overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: "Gilroy ExtraBold", fontSize: 12, color: BlackColor, overflow: TextOverflow.ellipsis)),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          SizedBox(
                                                            width: Get.width * 0.3,
                                                            child: Text(
                                                              " Class : ${model.lessonUpdateOnPageLoadModel?.lessonLst?[index].classes ?? ""}",
                                                              style: const TextStyle(fontFamily: "Gilroy Regular", fontSize: 12, color: Colors.black),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: Get.width * 0.3,
                                                            child: Text(
                                                              "Section : ${model.lessonUpdateOnPageLoadModel?.lessonLst?[index].className ?? ""}",
                                                              style: const TextStyle(fontFamily: "Gilroy Regular", fontSize: 12, color: Colors.black, overflow: TextOverflow.ellipsis),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 40,
                                              padding: const EdgeInsets.symmetric(horizontal: 12),
                                              decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(7)),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: MediaQuery.sizeOf(context).width * 0.5,
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.attachment,
                                                          color: WhiteColor.withOpacity(0.7),
                                                        ),
                                                        const SizedBox(
                                                          width: 12,
                                                        ),
                                                        SizedBox(
                                                          width: MediaQuery.sizeOf(context).width * 0.4,
                                                          child: Text(
                                                            model.lessonUpdateOnPageLoadModel?.lessonLst?[index].extension == null ? "No Attachment" : basename(model.lessonUpdateOnPageLoadModel?.lessonLst?[index].extension ?? ""),
                                                            style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 18, color: WhiteColor, overflow: TextOverflow.ellipsis),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      if (model.lessonUpdateOnPageLoadModel?.lessonLst?[index].url != null) {
                                                        final file = await model.loadPdfFromNetwork(model.lessonUpdateOnPageLoadModel?.lessonLst?[index].url ?? "");
                                                        model.openPdf(file, model.lessonUpdateOnPageLoadModel?.lessonLst?[index].url ?? "", model.lessonUpdateOnPageLoadModel?.lessonLst?[index].extension ?? "");
                                                      }
                                                    },
                                                    child: Container(
                                                      width: 80,
                                                      height: 30,
                                                      decoration: BoxDecoration(color: WhiteColor, borderRadius: BorderRadius.circular(5)),
                                                      child: Center(
                                                        child: Text(
                                                          "View",
                                                          style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 12, color: primaryColor),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                  ])),
            ));
  }
}

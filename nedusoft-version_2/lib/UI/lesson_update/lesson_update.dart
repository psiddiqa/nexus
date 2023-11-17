import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:path/path.dart';
import 'package:stacked/stacked.dart';
import '../../../Utils/Colors.dart';
import '../../Utils/Custom_widget.dart';
import '../../core/widget/common_app_bar.dart';
import 'lesson_update_view_model.dart';

class LessonUpdateScreen extends StatelessWidget {
  const LessonUpdateScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) async => await viewModel.init(),
        viewModelBuilder: () => LessonUpdateViewModel(),
        builder: (context, model, child) => LoadingOverlay(
              isLoading: model.isBusy,
              progressIndicator: const CircularProgressIndicator(
                color: Colors.white,
              ),
              opacity: 0.5,
              child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: Size(MediaQuery.sizeOf(context).width, 60),
                    child: CommonAppBar("Lesson Details"),
                  ),
                  backgroundColor: WhiteColor,
                  body: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const SizedBox(
                      height: 12,
                    ),
                    // const Text("From", style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium")),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //       suffixIcon: InkWell(
                    //           onTap: () {
                    //             model.fromPickDate(context);
                    //           },
                    //           child: Icon(Icons.calendar_month)),
                    //       hintText: '',
                    //       contentPadding: EdgeInsets.all(0)),
                    //   maxLines: 1,
                    //   controller: model.from,
                    // ),
                    // const SizedBox(height: 20),
                    // const Text("To", style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium")),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //       suffixIcon: InkWell(
                    //           onTap: () {
                    //             model.toromPickDate(context);
                    //           },
                    //           child: Icon(Icons.calendar_month)),
                    //       hintText: ''),
                    //   maxLines: 1,
                    //   controller: model.from,
                    // ),
                    // const SizedBox(height: 35),
                    // AppButton(
                    //   buttonText: "Search",
                    //   ontap: () {},
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    model.isBusy
                        ? const SizedBox()
                        : Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const BouncingScrollPhysics(),
                              itemCount: model.lessonUpdateViewModel!.lessonList!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: InkWell(
                                    onTap: () {
                                      model.navigateToViewScreen(model.lessonUpdateViewModel!.lessonList![index]);
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
                                                            width: Get.width * 0.7,
                                                            child: Text(
                                                              model.lessonUpdateViewModel?.lessonList?[index].topic ?? "Topic",
                                                              style: TextStyle(fontFamily: "Gilroy Bold", fontSize: 16, color: secondryColor, overflow: TextOverflow.ellipsis),
                                                            ),
                                                          ),
                                                          // InkWell(
                                                          //     onTap: () {
                                                          //       // model.navigateToEditScreen(model.lessonUpdateOnPageLoadModel!.lessonLst![index]);
                                                          //     },
                                                          //     child: Icon(
                                                          //       Icons.edit,
                                                          //       color: secondryColor,
                                                          //     ))
                                                        ],
                                                      ),
                                                      SizedBox(height: 5),
                                                      SizedBox(
                                                        width: Get.width * 0.55,
                                                        child: Text(model.lessonUpdateViewModel?.lessonList?[index].subjectName ?? "No Subject", overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: "Gilroy ExtraBold", fontSize: 12, color: BlackColor, overflow: TextOverflow.ellipsis)),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          SizedBox(
                                                            width: Get.width * 0.3,
                                                            child: Text(
                                                              " Class : ${model.lessonUpdateViewModel?.lessonList?[index].className ?? ""}",
                                                              style: const TextStyle(fontFamily: "Gilroy Regular", fontSize: 12, color: Colors.black, overflow: TextOverflow.ellipsis),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: Get.width * 0.3,
                                                            child: Text(
                                                              "Section : ${model.lessonUpdateViewModel?.lessonList?[index].sectionId ?? ""}",
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
                                                            model.lessonUpdateViewModel?.lessonList?[index].extension == null ? "No Attachment" : basename(model.lessonUpdateViewModel?.lessonList?[index].extension ?? ""),
                                                            style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 18, color: WhiteColor, overflow: TextOverflow.ellipsis),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      if (model.lessonUpdateViewModel?.lessonList?[index].filepath != null) {
                                                        final file = await model.loadPdfFromNetwork(model.lessonUpdateViewModel?.lessonList?[index].filepath ?? "");
                                                        model.openPdf(file, model.lessonUpdateViewModel?.lessonList?[index].filepath ?? "", model.lessonUpdateViewModel?.lessonList?[index].extension ?? "");
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

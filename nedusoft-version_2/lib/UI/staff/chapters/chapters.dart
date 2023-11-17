import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:path/path.dart';
import 'package:stacked/stacked.dart';
import '../../../Utils/Colors.dart';
import '../../../core/widget/common_app_bar.dart';
import 'chapter_view_model.dart';

class StaffMyChapterScreen extends StatelessWidget {
  const StaffMyChapterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) async => await viewModel.init(),
        viewModelBuilder: () => StaffMyChapterViewModel(),
        builder: (context, model, child) => LoadingOverlay(
              isLoading: model.isBusy,
              progressIndicator: const CircularProgressIndicator(
                color: Colors.white,
              ),
              opacity: 0.5,
              child: Scaffold(
                  appBar: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, 60), child: CommonAppBar("My Chapters")),
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
                              itemCount: model.myChaptersListModel!.chapter!.chapterList!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Card(
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      height: 80,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 1,
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
                                                            model.myChaptersListModel!.chapter!.chapterList![index].chapterName ?? "Topic",
                                                            style: TextStyle(fontFamily: "Gilroy Bold", fontSize: 16, color: secondryColor, overflow: TextOverflow.ellipsis),
                                                          ),
                                                        ),
                                                        InkWell(
                                                            onTap: () {
                                                              model.navigateToEditScreen(model.myChaptersListModel!.chapter!.chapterList![index].chapterId.toString());
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
                                                      child: Text(model.myChaptersListModel!.chapter!.chapterList![index].subjectName ?? "No Subject", overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: "Gilroy ExtraBold", fontSize: 12, color: BlackColor, overflow: TextOverflow.ellipsis)),
                                                    ),
                                                    SizedBox(height: 5),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        SizedBox(
                                                          width: Get.width * 0.3,
                                                          child: Text(
                                                            " Class : ${model.myChaptersListModel!.chapter!.chapterList![index].semester ?? ""}",
                                                            style: const TextStyle(fontFamily: "Gilroy Regular", fontSize: 12, color: Colors.black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: Get.width * 0.3,
                                                          child: Text(
                                                            "Chapter : ${model.myChaptersListModel!.chapter!.chapterList![index].chapterNo ?? ""}",
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
                                        ],
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

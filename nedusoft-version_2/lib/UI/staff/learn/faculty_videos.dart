import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'package:stacked/stacked.dart';
import '../../../Utils/Colors.dart';
import 'facuty_video_model.dart';

class StaffVideosScreen extends StatelessWidget {
  const StaffVideosScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) async => await viewModel.init(),
        viewModelBuilder: () => StaffVideosViewModel(),
        builder: (con, model, child) => LoadingOverlay(
              isLoading: model.isBusy,
              progressIndicator: const CircularProgressIndicator(
                color: Colors.white,
              ),
              opacity: 0.5,
              child: Scaffold(
                  appBar: PreferredSize(
                      preferredSize: Size(MediaQuery.sizeOf(context).width, 60),
                      child: AppBar(
                        backgroundColor: primaryColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(24),
                          ),
                        ),
                        title: Text(
                          "Faculty Videos",
                          style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: WhiteColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )),
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
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 42,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      margin: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(color: WhiteColor, borderRadius: BorderRadius.circular(12), border: Border.all(color: primaryColor)),
                      child: model.search
                          ? Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: model.searchController,
                                    onChanged: model.searchFun,
                                    keyboardType: TextInputType.text,
                                    maxLines: 1,
                                    autofocus: true,
                                    textInputAction: TextInputAction.search,
                                    style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 16, color: BlackColor, overflow: TextOverflow.ellipsis),
                                    decoration: InputDecoration(
                                      // contentPadding: EdgeInsets,
                                      border: InputBorder.none,
                                      hintText: 'Search',
                                      hintStyle: TextStyle(fontFamily: "Gilroy Medium", fontSize: 16, color: BlackColor, overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    model.changeSearchOption(false);
                                    model.searchController.text = "";
                                    // model.searchModel = null;
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            )
                          : InkWell(
                              onTap: () {
                                model.changeSearchOption(true);
                              },
                              child: Row(children: [
                                Icon(
                                  Icons.search,
                                  color: BlackColor,
                                  size: 25,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Search Subject ......',
                                  style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 16, color: BlackColor, overflow: TextOverflow.ellipsis),
                                ),
                              ]),
                            ),
                    ),
                    model.search
                        ? const SizedBox()
                        : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          model.selectClassValue == null
                              ? const SizedBox()
                              : Row(
                                  children: [
                                          model.selectClassValue == null
                                              ? const SizedBox()
                                              : Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(color: WhiteColor, borderRadius: BorderRadius.circular(8), border: Border.all(color: primaryColor)),
                                      child: Text(
                                                    model.selectClassValue?.text ?? "",
                                        style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: primaryColor),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                          model.selectPublisherValue == null
                                              ? const SizedBox()
                                              : Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(color: WhiteColor, borderRadius: BorderRadius.circular(8), border: Border.all(color: primaryColor)),
                                      child: Text(
                                                    model.selectPublisherValue?.text ?? "",
                                        style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: primaryColor),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                          InkWell(
                            onTap: () async {
                              if (model.selectClassValue == null) {
                                model.showBasicBottomSheet();
                              } else {
                                model.selectClassValue = null;
                                model.selectPublisherValue = null;
                                await model.getVideosList();
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                model.selectClassValue == null ? "Add Filters" : "Clear Filters",
                                style: const TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    model.isBusy
                        ? const SizedBox()
                        : model.search
                            ? model.searchController.text == ""
                                ? Padding(
                                    padding: EdgeInsets.only(top: 100),
                                    child: Center(
                                      child: Text(
                                        "Please Enter a Search Word",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 16, color: BlackColor, overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: model.searchList!.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8),
                                          child: InkWell(
                                            onTap: () {
                                              model.navigateToVideoDetail(model.searchList![index]);
                                            },
                                            child: Card(
                                              child: Container(
                                                padding: const EdgeInsets.all(8),
                                                height: 142,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              width: Get.width * 0.8,
                                                              child: Text(
                                                                model.searchList?[index].topic ?? "Topic",
                                                                style: TextStyle(fontFamily: "Gilroy Bold", fontSize: 16, color: secondryColor, overflow: TextOverflow.ellipsis),
                                                              ),
                                                            ),
                                                            InkWell(
                                                                onTap: () {
                                                                  model.navigateToEdit(model.searchList?[index].topicId.toString() ?? "");
                                                                },
                                                                child: Icon(
                                                                  Icons.edit,
                                                                  color: secondryColor,
                                                                ))
                                                          ],
                                                        ),
                                                        const SizedBox(height: 5),
                                                        Text(model.searchList?[index].chapter ?? "No Subject", overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: "Gilroy ExtraBold", fontSize: 12, color: BlackColor, overflow: TextOverflow.ellipsis)),
                                                        const SizedBox(height: 5),
                                                        Wrap(
                                                          // mainAxisAlignment: MainAxisAlignment.start,
                                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            SizedBox(
                                                              width: Get.width * 0.3,
                                                              child: Text(
                                                                " Class : ${model.searchList?[index].className ?? ""}",
                                                                style: const TextStyle(fontFamily: "Gilroy Regular", fontSize: 12, color: Colors.black),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: Get.width * 0.5,
                                                              child: Text(
                                                                "Subject: ${model.searchList?[index].subject ?? ""}",
                                                                style: const TextStyle(fontFamily: "Gilroy Regular", fontSize: 12, color: Colors.black, overflow: TextOverflow.ellipsis),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: Get.width * 0.5,
                                                              child: Text(
                                                                "Faculty: ${model.searchList?[index].createdBy ?? ""}",
                                                                style: const TextStyle(fontFamily: "Gilroy Regular", fontSize: 12, color: Colors.black, overflow: TextOverflow.ellipsis),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      height: 40,
                                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                                      decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(7)),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            width: MediaQuery.sizeOf(context).width * 0.6,
                                                            child: Text(
                                                              model.searchList?[index].link == "" ? "No Link" : model.searchList?[index].link ?? "",
                                                              style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 18, color: WhiteColor, overflow: TextOverflow.ellipsis),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () async {
                                                              await model.publishVideo(model.searchList![index].topicId.toString(), !model.searchList![index].isPublished!);
                                                            },
                                                            child: Container(
                                                              width: 80,
                                                              height: 30,
                                                              decoration: BoxDecoration(color: WhiteColor, borderRadius: BorderRadius.circular(5)),
                                                              child: Center(
                                                                child: Text(
                                                                  model.searchList![index].isPublished! ? "UnPublish" : "Publish",
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
                                  )
                            : Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const BouncingScrollPhysics(),
                              itemCount: model.getFacultyVideoModel!.list!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: InkWell(
                                    onTap: () {
                                      model.navigateToVideoDetail(model.getFacultyVideoModel!.list![index]);
                                    },
                                    child: Card(
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                            height: 142,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: Get.width * 0.8,
                                                      child: Text(
                                                        model.getFacultyVideoModel?.list?[index].topic ?? "Topic",
                                                        style: TextStyle(fontFamily: "Gilroy Bold", fontSize: 16, color: secondryColor, overflow: TextOverflow.ellipsis),
                                                      ),
                                                    ),
                                                    InkWell(
                                                        onTap: () {
                                                          model.navigateToEdit(model.getFacultyVideoModel?.list?[index].topicId.toString() ?? "");
                                                        },
                                                        child: Icon(
                                                          Icons.edit,
                                                          color: secondryColor,
                                                        ))
                                                  ],
                                                ),
                                                const SizedBox(height: 5),
                                                Text(model.getFacultyVideoModel?.list?[index].chapter ?? "No Subject", overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: "Gilroy ExtraBold", fontSize: 12, color: BlackColor, overflow: TextOverflow.ellipsis)),
                                                const SizedBox(height: 5),
                                                    Wrap(
                                                      runSpacing: 8,
                                                      // mainAxisAlignment: MainAxisAlignment.start,
                                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: Get.width * 0.3,
                                                      child: Text(
                                                        " Class : ${model.getFacultyVideoModel?.list?[index].className ?? ""}",
                                                        style: const TextStyle(fontFamily: "Gilroy Regular", fontSize: 12, color: Colors.black),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: Get.width * 0.5,
                                                      child: Text(
                                                        "Subject: ${model.getFacultyVideoModel?.list?[index].subject ?? ""}",
                                                        style: const TextStyle(fontFamily: "Gilroy Regular", fontSize: 12, color: Colors.black, overflow: TextOverflow.ellipsis),
                                                      ),
                                                    ),
                                                        SizedBox(
                                                          width: Get.width * 0.5,
                                                          child: Text(
                                                            " Faculty: ${model.getFacultyVideoModel?.list?[index].createdBy ?? ""}",
                                                            style: const TextStyle(fontFamily: "Gilroy Regular", fontSize: 12, color: Colors.black, overflow: TextOverflow.ellipsis),
                                                          ),
                                                        ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: 40,
                                              padding: const EdgeInsets.symmetric(horizontal: 12),
                                              decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(7)),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: MediaQuery.sizeOf(context).width * 0.6,
                                                    child: Text(
                                                      model.getFacultyVideoModel?.list?[index].link == "" ? "No Link" : model.getFacultyVideoModel?.list?[index].link ?? "",
                                                      style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 18, color: WhiteColor, overflow: TextOverflow.ellipsis),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      await model.publishVideo(model.getFacultyVideoModel!.list![index].topicId.toString(), !model.getFacultyVideoModel!.list![index].isPublished!);
                                                    },
                                                    child: Container(
                                                      width: 80,
                                                      height: 30,
                                                      decoration: BoxDecoration(color: WhiteColor, borderRadius: BorderRadius.circular(5)),
                                                      child: Center(
                                                        child: Text(
                                                          model.getFacultyVideoModel!.list![index].isPublished! ? "UnPublish" : "Publish",
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

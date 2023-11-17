import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:path/path.dart';
import 'package:stacked/stacked.dart';
import '../../../Utils/Colors.dart';
import '../../../Utils/Custom_widget.dart';

import '../../../core/widget/common_app_bar.dart';
import 'assignmnet_view_model.dart';

class StaffAssignmentScreen extends StatelessWidget {
  const StaffAssignmentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) async => await viewModel.init(),
        viewModelBuilder: () => StaffAssignmnetOnPageViewModel(),
        builder: (context, model, child) => LoadingOverlay(
              isLoading: model.isBusy,
              progressIndicator: const CircularProgressIndicator(
                color: Colors.white,
              ),
              opacity: 0.5,
              child: Scaffold(
                  floatingActionButton: FloatingActionButton(
                      backgroundColor: primaryColor,
                      child: const Center(child: Icon(Icons.add)),
                      onPressed: () {
                        model.navigateToAddScreen();
                      }),
                  appBar: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, 60), child: CommonAppBar("Assignments")),
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
                              itemCount: model.staffAssignmentModel!.list1!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Card(
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      height: 140,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 2,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          width: Get.width * 0.62,
                                                          child: Text(
                                                            model.staffAssignmentModel?.list1?[index].assignTopic ?? "Topic",
                                                            style: TextStyle(fontFamily: "Gilroy Bold", fontSize: 16, color: secondryColor, overflow: TextOverflow.ellipsis),
                                                          ),
                                                        ),
                                                        InkWell(
                                                            onTap: () {
                                                              model.navigateToEditScreen(model.staffAssignmentModel!.list1![index].assignId!.toString());
                                                            },
                                                            child: Icon(
                                                              Icons.edit,
                                                              color: secondryColor,
                                                            ))
                                                      ],
                                                    ),
                                                    const SizedBox(height: 5),
                                                    SizedBox(
                                                      width: Get.width * 0.55,
                                                      child: Text(model.staffAssignmentModel?.list1?[index].subject ?? "No Subject", overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: "Gilroy ExtraBold", fontSize: 12, color: BlackColor, overflow: TextOverflow.ellipsis)),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        SizedBox(
                                                          width: Get.width * 0.3,
                                                          child: Text(
                                                            " Class : ${model.staffAssignmentModel?.list1?[index].className ?? ""}",
                                                            style: const TextStyle(fontFamily: "Gilroy Regular", fontSize: 12, color: Colors.black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: Get.width * 0.3,
                                                          child: Text(
                                                            "Section : ${model.staffAssignmentModel?.list1?[index].section ?? ""}",
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
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: Get.width * 0.4,
                                                child: Text(
                                                  " Assign Date : ${model.staffAssignmentModel?.list1?[index].assignDate ?? ""}",
                                                  style: const TextStyle(fontFamily: "Gilroy Medium", fontSize: 10, color: Colors.black),
                                                ),
                                              ),
                                              SizedBox(
                                                width: Get.width * 0.4,
                                                child: Text(
                                                  "Submit Date : ${model.staffAssignmentModel?.list1?[index].submiDate ?? ""}",
                                                  style: const TextStyle(fontFamily: "Gilroy Medium", fontSize: 10, color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Container(
                                            height: 40,
                                            padding: const EdgeInsets.symmetric(horizontal: 12),
                                            decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(5)),
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
                                                          model.staffAssignmentModel?.list1?[index].fileName == null ? "No Attachment" : basename(model.staffAssignmentModel?.list1?[index].fileName ?? ""),
                                                          style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 18, color: WhiteColor, overflow: TextOverflow.ellipsis),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () async {
                                                    if (model.staffAssignmentModel?.list1?[index].filePath != null) {
                                                      final file = await model.loadPdfFromNetwork(model.staffAssignmentModel?.list1?[index].filePath ?? "");
                                                      model.openPdf(file, model.staffAssignmentModel?.list1?[index].filePath ?? "", model.staffAssignmentModel?.list1?[index].fileName ?? "");
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
                                );
                              },
                            ),
                          ),
                  ])),
            ));
  }
}

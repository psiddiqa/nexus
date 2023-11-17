import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/UI/staff/feedback/feedback_view_model.dart';
import 'package:stacked/stacked.dart';
import '../../../Utils/Colors.dart';
import '../../../core/widget/common_app_bar.dart';

class StaffFeedBack extends StatelessWidget {
  const StaffFeedBack({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) => viewModel.init(),
        viewModelBuilder: () => StaffFeedbackViewModel(),
        builder: (context, model, child) => LoadingOverlay(
              isLoading: model.isBusy,
              progressIndicator: const CircularProgressIndicator(
                color: Colors.white,
              ),
              opacity: 0.5,
              child: Scaffold(
                  appBar: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, 60), child: CommonAppBar("Feedback List")),
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
                              itemCount: model.feebbackListModel!.list!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: InkWell(
                                    onTap: () {
                                      model.navigateToDetailPage(model.feebbackListModel!.list![index].feedbackId.toString());
                                    },
                                    child: Card(
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        height: 80,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: Get.width * 0.65,
                                                          child: Text(
                                                            model.feebbackListModel!.list![index].student ?? "Student",
                                                            style: TextStyle(fontFamily: "Gilroy Bold", fontSize: 16, color: secondryColor),
                                                          ),
                                                        ),
                                                        RichText(
                                                            textAlign: TextAlign.center,
                                                            text: TextSpan(children: [
                                                              TextSpan(
                                                                text: "Status : ",
                                                                style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 14, color: BlackColor),
                                                              ),
                                                              TextSpan(
                                                                text: model.feebbackListModel!.list![index].status,
                                                                style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 14, color: primaryColor),
                                                              ),
                                                            ])),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 8),
                                                    SizedBox(
                                                      width: Get.width * 0.85,
                                                      child: Text(model.feebbackListModel!.list![index].feedback ?? "No Subject", overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: "Gilroy ExtraBold", fontSize: 12, color: BlackColor)),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          width: Get.width * 0.3,
                                                          child: Text(
                                                            " Class : ${model.feebbackListModel!.list![index].className ?? ""}",
                                                            style: const TextStyle(fontFamily: "Gilroy Regular", fontSize: 12, color: Colors.black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: Get.width * 0.4,
                                                          child: Text(
                                                            "Date : ${model.feebbackListModel!.list![index].date ?? ""}",
                                                            style: const TextStyle(fontFamily: "Gilroy Regular", fontSize: 12, color: Colors.black, overflow: TextOverflow.ellipsis),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
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

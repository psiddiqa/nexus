import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:stacked/stacked.dart';

import '../../../Utils/Colors.dart';
import '../../../Utils/custom_snackbar.dart';
import 'feedback_detail_view_model.dart';

class StudentFeedBackDetail extends StatelessWidget {
  String nId;
  StudentFeedBackDetail({super.key, required this.nId});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (model) => model.init(nId),
        viewModelBuilder: () => StudentFeedBackDetailViewModel(),
        builder: (context, model, child) => LoadingOverlay(
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
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(right: 12, top: 22),
                          child: InkWell(
                            onTap: () {
                              model.navigateToHistoryScreen();
                            },
                            child: Text(
                              "History",
                              style: TextStyle(fontSize: 12, fontFamily: "Gilroy Medium", color: WhiteColor),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                      title: Text(
                        "View Feedback",
                        style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: WhiteColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
                backgroundColor: WhiteColor,
                body: Column(
                  children: [
                    model.isBusy
                        ? const SizedBox()
                        : Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(height: Get.height * 0.02),
                                  profile(text: "FeedBack Ref.", detailstext: model.feedbackDetailModel!.data!.feedbackId ?? ""),
                                  profile(text: "Faculty", detailstext: model.feedbackDetailModel!.data!.faculty ?? ""),
                                  profile(text: "Date", detailstext: model.feedbackDetailModel!.data!.date ?? ""),
                                  profile(text: "Status", detailstext: model.feedbackDetailModel!.data!.status ?? ""),
                                  profile(text: "Feedback", detailstext: model.feedbackDetailModel!.data!.feedback ?? ""),
                                  profile(
                                      text: "Uploaded Attachment",
                                      detailstext: model.feedbackDetailModel!.data!.fileName ?? "",
                                      addWidget: InkWell(
                                        onTap: () async {
                                          if (model.feedbackDetailModel!.data!.url != null) {
                                            final file = await model.loadPdfFromNetwork(model.feedbackDetailModel!.data!.url ?? "");
                                            model.openPdf(file, model.feedbackDetailModel!.data!.url ?? "", model.feedbackDetailModel!.data!.fileName ?? "");
                                          } else {
                                            showCustomSnackbar(msg: "", title: "No Attachment Found");
                                          }
                                        },
                                        child: SizedBox(
                                          width: Get.width * 0.53,
                                          child: Text("View/Download", style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: secondryColor, decoration: TextDecoration.underline)),
                                        ),
                                      )),
                                  SizedBox(height: Get.height * 0.05),
                                ],
                              ),
                            ),
                          )
                  ],
                ),
              ),
            ));
  }

  profile({String? text, detailstext, Widget? addWidget}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width * 0.40,
                child: Text(text!, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
              ),
              addWidget ??
                  SizedBox(
                    width: Get.width * 0.53,
                    child: Text(detailstext.toString(), style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: secondryColor)),
                  ),
            ],
          ),
          SizedBox(height: Get.height * 0.015),
          Divider(color: greycolor, thickness: 1),
          SizedBox(height: Get.height * 0.015),
        ],
      ),
    );
  }
}

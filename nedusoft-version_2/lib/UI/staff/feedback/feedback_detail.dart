import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/UI/staff/feedback/feedback_detail_view_model.dart';
import 'package:nedusoft/models/staff/feedback_detail_model.dart';
import 'package:stacked/stacked.dart';

import '../../../Utils/Colors.dart';
import '../../../Utils/custom_snackbar.dart';

class StaffFeedBackDetail extends StatelessWidget {
  String nId;
  StaffFeedBackDetail({super.key, required this.nId});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (model) => model.init(nId),
        viewModelBuilder: () => StaffFeedBackDetailViewModel(),
        builder: (context, model, child) => LoadingOverlay(
              isLoading: model.isBusy,
              progressIndicator: const CircularProgressIndicator(
                color: Colors.white,
              ),
              opacity: 0.5,
              child: Scaffold(
                bottomNavigationBar: model.isBusy
                    ? SizedBox()
                    : model.feedbackDetailModel!.data!.status == "Close"
                        ? const SizedBox()
                        : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
                  child: InkWell(
                    // onTap: ontap,
                    onTap: () async {
                                // if (model.file != null) {
                        await model.assignmentSumbit(nId);
                                // } else {
                                //   showCustomSnackbar(msg: "First Select File.....", title: "Select File");
                                // }
                      // Get.to(StaffAttendanceShow());
                    },
                    child: Container(
                        height: 50,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: primaryColor),
                        child: Center(
                          child: Text("SUBMIT", style: TextStyle(color: WhiteColor, fontSize: 19, fontFamily: "Gilroy Bold")),
                        )),
                  ),
                ),
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
                        "Feedback Detail",
                        style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: WhiteColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
                backgroundColor: WhiteColor,
                body: Column(
                  children: [
                    model.isBusy
                        ? SizedBox()
                        : Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(height: Get.height * 0.02),
                                  profile(text: "FeedBack Ref.", detailstext: model.feedbackDetailModel!.data!.feedbackId ?? ""),
                                  profile(text: "Student", detailstext: model.feedbackDetailModel!.data!.student ?? ""),
                                  profile(text: "Class", detailstext: model.feedbackDetailModel!.data!.className ?? ""),
                                  profile(text: "Date", detailstext: model.feedbackDetailModel!.data!.date ?? ""),
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
                                  model.feedbackDetailModel!.data!.status == "Close"
                                      ? profile(text: "Status", detailstext: model.feedbackDetailModel!.data!.status ?? "")
                                      : Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 12),
                                          child: Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: Get.width * 0.40,
                                                    child: Text("Status", style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                                  ),
                                                  Container(
                                                    height: 20,
                                                    width: Get.width * 0.50,
                                                    margin: EdgeInsets.only(right: 12),
                                                    // padding: EdgeInsets.only(left: 4),
                                                    // decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: WhiteColor, border: Border.all(color: secondryColor)),
                                                    child: Center(
                                                      child: DropdownButton(
                                                        // padding: EdgeInsets.symmetric(horizontal: 10),
                                                        borderRadius: BorderRadius.circular(10),
                                                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                                                        iconSize: 20,
                                                        isExpanded: true,
                                                        underline: const SizedBox(),
                                                        value: model.selectStatus ?? model.statusList[0],
                                                        onChanged: (newvalue) async {
                                                          model.changeStatusValue(newvalue as Status);
                                                          // await model.assignmentUpdate();
                                                        },
                                                        items: model.statusList.map((Status valueItem) {
                                                          return DropdownMenuItem<Status>(
                                                            value: valueItem,
                                                            child: Text(valueItem.text!, style: TextStyle(color: secondryColor, fontFamily: 'Gilroy Medium', fontSize: 16)),
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: Get.height * 0.015),
                                              Divider(color: greycolor, thickness: 1),
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    height: 40,
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          width: MediaQuery.sizeOf(context).width * 0.4,
                                                          child: Text("Remarks", style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                                        ),
                                                        Expanded(
                                                          child: TextFormField(
                                                            decoration: InputDecoration(disabledBorder: InputBorder.none, border: InputBorder.none, hintText: 'Enter Remarks', contentPadding: EdgeInsets.all(0)),
                                                            maxLines: 1,
                                                            controller: model.remark,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(color: greycolor, thickness: 1),
                                                  SizedBox(height: Get.height * 0.015),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: Get.width * 0.40,
                                                    child: Text("Upload Attachment", style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          await model.pickFile();
                                                        },
                                                        child: Container(
                                                          height: 20,
                                                          padding: const EdgeInsets.all(2),
                                                          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3), border: Border.all(color: Colors.black, width: 1)),
                                                          child: const Center(
                                                            child: Text("Choose File", style: TextStyle(fontSize: 10, fontFamily: "Gilroy Medium", color: Colors.black)),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: MediaQuery.sizeOf(context).width * 0.3, child: Text(model.baseName == null ? " No file Chosen" : model.baseName!, style: const TextStyle(overflow: TextOverflow.ellipsis, fontSize: 12, fontFamily: "Gilroy Regular", color: Colors.black))),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: Get.height * 0.015),
                                              Divider(color: greycolor, thickness: 1),
                                              SizedBox(height: Get.height * 0.015),
                                            ],
                                          ),
                                        ),
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

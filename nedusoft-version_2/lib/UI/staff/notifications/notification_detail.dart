import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../Utils/Colors.dart';
import '../../../Utils/Custom_widget.dart';
import '../../../core/widget/common_app_bar.dart';
import 'notification_detail_view_model.dart';

class StaffNotificationDetail extends StatelessWidget {
  String nId;
  StaffNotificationDetail({required this.nId});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) => viewModel.init(nId),
        viewModelBuilder: () => StaffNotificationDetailViewModel(),
        builder: (context, model, child) => Scaffold(
              appBar: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, 60), child: CommonAppBar("Notification Detail")),
              backgroundColor: WhiteColor,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: BlackColor),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                              color: boxcolor,
                            ),
                            child: Row(children: [
                              Text("Tittle", style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 18, color: BlackColor, fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: Get.width * 0.2,
                              ),
                              SizedBox(
                                width: Get.width * 0.43,
                                child: Text(model.staffNotificationModel?.titel ?? "", style: TextStyle(fontFamily: "Gilroy Bold", fontSize: 18, color: BlackColor)),
                              ),
                            ]),
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                              height: 50,
                              color: WhiteColor,
                              child: profile(
                                Subject: "Valid From",
                                marks: DateFormat.yMMMMEEEEd().format(model.staffNotificationModel?.validFrom ?? DateTime.now()),
                              )),
                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                              color: boxcolor,
                              child: profile(
                                Subject: "Valid To",
                                marks: DateFormat.yMMMMEEEEd().format(model.staffNotificationModel?.validTo ?? DateTime.now()),
                              )),
                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                              color: WhiteColor,
                              child: profile(
                                Subject: "From Time",
                                marks: model.staffNotificationModel?.fromTime ?? "",
                              )),
                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                              color: boxcolor,
                              child: profile(
                                Subject: "To Time",
                                marks: model.staffNotificationModel?.toTime ?? "",
                              )),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                            color: WhiteColor,
                            child: profile(
                              Subject: "Category",
                              marks: model.staffNotificationModel?.category ?? "",
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                              color: boxcolor,
                            ),
                            child: profile(
                              Subject: "Details",
                              marks: model.staffNotificationModel?.description ?? "No DescriptionNo ",
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.015),
                  ],
                )),
              ),
            ));
  }

  profile({String? Subject, String? marks}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width * 0.30,
                child: Text(Subject!, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
              ),
              SizedBox(
                width: Get.width * 0.5,
                child: Text(marks.toString(), style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: secondryColor)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

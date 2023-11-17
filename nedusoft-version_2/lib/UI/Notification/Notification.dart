// ignore_for_file: file_names

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nedusoft/UI/Notification/notification_view_model.dart';
import 'package:nedusoft/Utils/Colors.dart';
import 'package:intl/intl.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/core/widget/common_app_bar.dart';
import 'package:stacked/stacked.dart';
import '../../models/notification_model.dart';

class Notificationpage extends StatelessWidget {
  const Notificationpage({super.key});

  @override
  Widget build(BuildContext context) {
    // notifire = Provider.of<ColorNotifire>(context, listen: true);
    log("message");
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) => viewModel.init(),
        viewModelBuilder: () => NotificationViewModel(),
        builder: (context, model, child) => LoadingOverlay(
              isLoading: model.isBusy,
              progressIndicator: const CircularProgressIndicator(
                color: Colors.white,
              ),
              opacity: 0.5,
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: CommonAppBar("Notification"),
                ),
                backgroundColor: WhiteColor,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SingleChildScrollView(
                      child: Column(
                    children: [

                      model.isBusy ? const SizedBox(): ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: model.notificationModel!.list!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                              onTap: () {
                                // Get.to(() => const EdtiorChoice());
                                model.navigateToDetails(model.notificationModel!.list![index]);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      margin: EdgeInsets.only(right: 8),
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: greycolor.withOpacity(0.3)),
                                      child: Image.asset("assets/Chef.png"),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.48,
                                          child: Text(
                                            model.notificationModel?.list?[index].titel ?? "",
                                            style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 15, color: greycolor),
                                          ),
                                        ),
                                        SizedBox(height: Get.height * 0.013),
                                        SizedBox(
                                          width: Get.width * 0.55,
                                          child: Text(model.notificationModel?.list?[index].description ?? "No description", overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: "Gilroy ExtraBold", fontSize: 15, color: BlackColor)),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 4,
                                          ),
                                          child: Text(
                                            model.timeAgo(model.notificationModel!.list![index].createdOn!),
                                            style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 12, color: greycolor),
                                          ),
                                        ),
                                        SizedBox(height: Get.height * 0.015),
                                        // Padding(
                                        //   padding: const EdgeInsets.only(bottom: 8),
                                        //   child: CircleAvatar(
                                        //     radius: 4,
                                        //     backgroundColor: RedColor,
                                        //   ),
                                        // )
                                      ],
                                    )
                                  ],
                                ),
                              ));
                        },
                      ),
                    ],
                  )),
                ),
              ),
            ));
  }
}

class NotificationDetail extends StatelessWidget {
  ListElement? listElement;
  NotificationDetail({required this.listElement});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: CommonAppBar("Notification Detail"
                ),
              ),
          backgroundColor: WhiteColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SingleChildScrollView(
                child: Column(
              children: [
                const SizedBox(height: 30,),
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
                          Text("Tittle", style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 18, color: BlackColor,fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: Get.width * 0.2,
                              ),
                          SizedBox(
                                width: Get.width * 0.43,
                                child: Text(listElement?.titel ?? "", style: TextStyle(fontFamily: "Gilroy Bold", fontSize: 18, color: BlackColor)),
                              ),
                        ]),
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                              height: 50,
                              color: WhiteColor,
                              child: profile(
                                Subject: "Valid From",
                                marks: DateFormat.yMMMMEEEEd().format(listElement?.validFrom ?? DateTime.now()),
                              )),
                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                              color: boxcolor,
                              child: profile(
                                Subject: "Valid To",
                                marks: DateFormat.yMMMMEEEEd().format(listElement?.validTo ?? DateTime.now()),
                              )),
                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                              color: WhiteColor,
                              child: profile(
                                Subject: "From Time",
                                marks: listElement?.fromTime ?? "",
                              )),
                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                              color: boxcolor,
                              child: profile(
                                Subject: "To Time",
                                marks: listElement?.toTime ?? "",
                              )),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                            color: WhiteColor,
                            child: profile(
                              Subject: "Category",
                              marks: listElement?.category ?? "",
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
                              marks: listElement?.description ?? "No DescriptionNo ",
                            ),
                        
                        
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Get.height * 0.015),
              ],
            )),
          ),
    );
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

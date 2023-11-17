import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/UI/Notification/notification_view_model.dart';
import 'package:nedusoft/UI/staff/notifications/notification_view_model.dart';
import 'package:nedusoft/models/staff_notification_model.dart';
import 'package:stacked/stacked.dart';
import '../../../Utils/Colors.dart';
import '../../../Utils/Custom_widget.dart';
import '../../../core/widget/common_app_bar.dart';

class StaffNotification extends StatelessWidget {
  const StaffNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) => viewModel.init(),
        viewModelBuilder: () => staffNotificationViewModel(),
        builder: (context, model, child) => LoadingOverlay(
              isLoading: model.isBusy,
              progressIndicator: const CircularProgressIndicator(
                color: Colors.white,
              ),
              opacity: 0.5,
              child: Scaffold(
                  // floatingActionButton: FloatingActionButton(
                  //     backgroundColor: primaryColor,
                  //     child: const Center(child: Icon(Icons.add)),
                  //     onPressed: () {
                  //       // model.navigateToEditScreen();
                  //     }),
                  appBar: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, 60), child: CommonAppBar("Notification")),
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
                              itemCount: model.staffNotificationModel!.list!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                                  child: InkWell(
                                    onTap: () {
                                      model.navigateToDetailPage(model.staffNotificationModel!.list![index].nId.toString());
                                    },
                                    child: Slidable(
                                      endActionPane: ActionPane(motion: const ScrollMotion(), children: [
                                        // SlidableAction(
                                        //   onPressed: (context) {},
                                        //   backgroundColor: secondryColor,
                                        //   foregroundColor: Colors.white,
                                        //   // icon: Icons.edit,
                                        //   label: 'Edit',
                                        // ),
                                        // SlidableAction(
                                        //    onPressed: (context) {},
                                        //   backgroundColor: primaryColor,
                                        //   foregroundColor: Colors.white,
                                        //   icon: Icons.view_agenda,
                                        //   label: 'View',
                                        // ),
                                      ]),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            margin: const EdgeInsets.only(right: 8),
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
                                                  model.staffNotificationModel?.list?[index].titel ?? "",
                                                  style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 15, color: greycolor),
                                                ),
                                              ),
                                              SizedBox(height: Get.height * 0.013),
                                              SizedBox(
                                                width: Get.width * 0.55,
                                                child: Text(model.staffNotificationModel?.list?[index].description ?? "No description", overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: "Gilroy ExtraBold", fontSize: 15, color: BlackColor)),
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
                                                  model.timeAgo(model.staffNotificationModel!.list![index].createdOn!),
                                                  style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 10, color: greycolor),
                                                ),
                                              ),
                                              // SizedBox(height: Get.height * 0.015),
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


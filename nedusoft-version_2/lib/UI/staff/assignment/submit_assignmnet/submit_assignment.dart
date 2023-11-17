import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/UI/staff/assignment/submit_assignmnet/submit_ass_view_model.dart';
import 'package:path/path.dart';
import 'package:stacked/stacked.dart';

import '../../../../Utils/Colors.dart';
import '../../../../Utils/Custom_widget.dart';
import '../assignmnet_view_model.dart';

class SubmitAssignment extends StatelessWidget {
  const SubmitAssignment({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) async => await viewModel.init(),
        viewModelBuilder: () => StaffSubmitAssViewModel(),
        builder: (context, model, child) => LoadingOverlay(
              isLoading: model.isBusy,
              progressIndicator: const CircularProgressIndicator(
                color: Colors.white,
              ),
              opacity: 0.5,
              child: DefaultTabController(
                length: 2,
                child: Scaffold(
                    appBar: PreferredSize(
                        preferredSize: Size(MediaQuery.sizeOf(context).width, 90),
                        child: AppBar(
                          backgroundColor: primaryColor,
                          bottom: TabBar(
                            indicatorWeight: 2,
                            labelStyle: const TextStyle(
                              fontSize: 14,
                              fontFamily: "Gilroy Bold",
                            ),
                            indicatorPadding: const EdgeInsets.symmetric(horizontal: 18),
                            indicatorColor: secondryColor,
                            tabs: const [
                              Tab(text: 'SUBMITTED'),
                              Tab(text: 'COMPLETED'),
                              // Tab(text: 'EXPERIANCE'),
                              // Tab(text: 'academic'.toUpperCase()),
                            ],
                          ),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(24),
                            ),
                          ),
                          title: Text(
                            "Assignment",
                            style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: WhiteColor),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                    backgroundColor: WhiteColor,
                    body: TabBarView(
                      children: [
                        Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                          model.isBusy
                              ? const SizedBox()
                              : Expanded(
                                  child: model.submitList.isEmpty
                                      ? Center(
                                          child: Text(
                                            "No Assignments Submitted".toUpperCase(),
                                            style: TextStyle(fontFamily: "Gilroy Bold", fontSize: 22, color: secondryColor),
                                          ),
                                        )
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          padding: EdgeInsets.zero,
                                          physics: const BouncingScrollPhysics(),
                                          itemCount: model.submitList.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            return Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8),
                                              child: Card(
                                                child: Container(
                                                  padding: const EdgeInsets.all(8),
                                                  height: 90,
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
                                                                      width: Get.width * .62,
                                                                      child: Text(
                                                                        model.submitList[index].assignTopic ?? "Topic",
                                                                        style: TextStyle(fontFamily: "Gilroy Bold", fontSize: 16, color: secondryColor, overflow: TextOverflow.ellipsis),
                                                                      ),
                                                                    ),
                                                                    InkWell(
                                                                      onTap: () {
                                                                        model.navigateToEditScreen(model.submitList[index].assignTransId!.toString());
                                                                      },
                                                                      child: Text(
                                                                        "View",
                                                                        style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 10, color: primaryColor),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                const SizedBox(height: 5),
                                                                SizedBox(
                                                                  width: Get.width * 0.55,
                                                                  child: Text(model.submitList[index].subject ?? "No Subject", overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: "Gilroy ExtraBold", fontSize: 12, color: BlackColor, overflow: TextOverflow.ellipsis)),
                                                                ),
                                                                const SizedBox(height: 5),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    SizedBox(
                                                                      width: Get.width * 0.3,
                                                                      child: Text(
                                                                        " Class : ${model.submitList[index].className ?? ""}",
                                                                        style: const TextStyle(fontFamily: "Gilroy Regular", fontSize: 12, color: Colors.black),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: Get.width * 0.3,
                                                                      child: Text(
                                                                        "Section : ${model.submitList[index].section ?? ""}",
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
                                                              " Assign Date : ${model.submitList[index].assignDate ?? ""}",
                                                              style: const TextStyle(fontFamily: "Gilroy Medium", fontSize: 10, color: Colors.black),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: Get.width * 0.4,
                                                            child: Text(
                                                              "Submit Date : ${model.submitList[index].submiDate ?? ""}",
                                                              style: const TextStyle(fontFamily: "Gilroy Medium", fontSize: 10, color: Colors.black, overflow: TextOverflow.ellipsis),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                ),
                        ]),
                        Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                          model.isBusy
                              ? const SizedBox()
                              : model.completeList.isEmpty
                                  ? Center(
                                      child: Text(
                                        "No Assignments Complete".toUpperCase(),
                                        style: TextStyle(fontFamily: "Gilroy Bold", fontSize: 22, color: secondryColor),
                                      ),
                                    )
                                  : Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: model.completeList.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8),
                                        child: Card(
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                                height: 90,
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
                                                                    width: Get.width * 0.62,
                                                                child: Text(
                                                                  model.completeList[index].assignTopic ?? "Topic",
                                                                      style: TextStyle(fontFamily: "Gilroy Bold", fontSize: 16, color: secondryColor),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                  onTap: () {
                                                                      model.navigateToEditScreen(model.completeList[index].assignTransId!.toString());
                                                                  },
                                                                    child: Text(
                                                                      "View",
                                                                      style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 14, color: primaryColor),
                                                                    ),
                                                                  )
                                                            ],
                                                          ),
const SizedBox(height: 5),
                                                          SizedBox(
                                                            width: Get.width * 0.55,
                                                                child: Text(model.completeList[index].subject ?? "No Subject", overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: "Gilroy ExtraBold", fontSize: 12, color: BlackColor)),
                                                          ),
                                                              const SizedBox(height: 5),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            children: [
                                                              SizedBox(
                                                                width: Get.width * 0.3,
                                                                child: Text(
                                                                  " Class : ${model.completeList[index].className ?? ""}",
                                                                  style: const TextStyle(fontFamily: "Gilroy Regular", fontSize: 12, color: Colors.black),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: Get.width * 0.3,
                                                                child: Text(
                                                                  "Section : ${model.completeList[index].section ?? ""}",
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
                                                        " Assign Date : ${model.completeList[index].assignDate ?? ""}",
                                                            style: const TextStyle(fontFamily: "Gilroy Medium", fontSize: 10, color: Colors.black),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: Get.width * 0.4,
                                                      child: Text(
                                                        "Submit Date : ${model.completeList[index].submiDate ?? ""}",
                                                            style: const TextStyle(fontFamily: "Gilroy Medium", fontSize: 10, color: Colors.black),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                    
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                        ]),
                      ],
                    )),
              ),
            ));
  }
}

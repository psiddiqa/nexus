import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/UI/Assignment/assignment_view_model.dart';
import 'package:nedusoft/models/login_model.dart';
import 'package:path/path.dart';
import 'package:stacked/stacked.dart';

import '../../../../Utils/Colors.dart';
import '../../Utils/Custom_widget.dart';
import '../../models/student/student_assignment_model.dart';

class StudentAssignmentScreen extends StatelessWidget {
  const StudentAssignmentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) async => await viewModel.init(),
        viewModelBuilder: () => StudentAssignmentViewModel(),
        builder: (context, model, child) => LoadingOverlay(
              isLoading: model.isBusy,
              progressIndicator: const CircularProgressIndicator(
                color: Colors.white,
              ),
              opacity: 0.5,
              child: DefaultTabController(
                length: 4,
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
                            indicatorPadding: EdgeInsets.symmetric(horizontal: 18),
                            indicatorColor: secondryColor,
                            tabs: const [
                              Tab(text: 'PENDING'),
                              Tab(text: 'INCOMPLETE'),
                              Tab(text: 'SUBMITTED'),
                              Tab(text: 'COMPLETED'),
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
                          AssignmentSectionWidget(
                            model: model,
                          ),
                          model.isBusy
                              ? const SizedBox()
                              : model.pendingList.isEmpty
                                  ? Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 100),
                                        child: Text(
                                          "No Pending Assignments".toUpperCase(),
                                          style: TextStyle(fontFamily: "Gilroy Bold", fontSize: 22, color: secondryColor),
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: model.pendingList.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return AssignmentCardWidget(
                                            model: model,
                                            list1element: model.pendingList[index],
                                            addAssignemnt: false,
                                          );
                                        },
                                      ),
                                    ),
                        ]),
                        Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                          AssignmentSectionWidget(
                            model: model,
                          ),
                          model.isBusy
                              ? const SizedBox()
                              : model.incompleteList.isEmpty
                                  ? Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 100),
                                        child: Text(
                                          "No Incomplete Assignments".toUpperCase(),
                                          style: TextStyle(fontFamily: "Gilroy Bold", fontSize: 22, color: secondryColor),
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: model.incompleteList.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return AssignmentCardWidget(
                                            model: model,
                                            list1element: model.incompleteList[index],
                                            addAssignemnt: false,
                                          );
                                        },
                                      ),
                                    ),
                        ]),
                        Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                          AssignmentSectionWidget(
                            model: model,
                          ),
                          model.isBusy
                              ? const SizedBox()
                              : Expanded(
                                  child: model.submitList.isEmpty
                                      ? Center(
                                          child: Text(
                                            "No Submitted Assignments".toUpperCase(),
                                            style: TextStyle(fontFamily: "Gilroy Bold", fontSize: 22, color: secondryColor),
                                          ),
                                        )
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          padding: EdgeInsets.zero,
                                          physics: const BouncingScrollPhysics(),
                                          itemCount: model.submitList.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            return AssignmentCardWidget(
                                              model: model,
                                              list1element: model.submitList[index],
                                              addAssignemnt: true,
                                            );
                                          },
                                        ),
                                ),
                        ]),
                        Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                          AssignmentSectionWidget(
                            model: model,
                          ),
                          model.isBusy
                              ? const SizedBox()
                              : model.completeList.isEmpty
                                  ? Padding(
                                      padding: EdgeInsets.only(top: 100),
                                      child: Center(
                                        child: Text(
                                          "No Submitted Assignments".toUpperCase(),
                                          style: TextStyle(fontFamily: "Gilroy Bold", fontSize: 22, color: secondryColor),
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: model.completeList.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return AssignmentCardWidget(
                                            model: model,
                                            list1element: model.completeList[index],
                                            addAssignemnt: true,
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

class AssignmentCardWidget extends StatelessWidget {
  StudentAssignmentViewModel model;
  List1Element list1element;
  bool addAssignemnt;
  AssignmentCardWidget({
    required this.list1element,
    required this.model,
    required this.addAssignemnt,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 95,
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
                              width: 45,
                              height: 45,
                            )),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width * 0.67,
                              child: Text(
                                list1element.assignTopic ?? "Topic",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontFamily: "Gilroy Bold", fontSize: 16, color: secondryColor),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                model.navigateToEditScreen(list1element.assignId!.toString(), addAssignemnt);
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
                          child: Text(list1element.subject ?? "No Subject", overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: "Gilroy ExtraBold", fontSize: 12, color: BlackColor)),
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
                      " Assign Date : ${list1element.assignDate ?? ""}",
                      style: const TextStyle(fontFamily: "Gilroy Medium", fontSize: 10, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.4,
                    child: Text(
                      "Submit Date : ${list1element.submiDate ?? ""}",
                      style: const TextStyle(fontFamily: "Gilroy Medium", fontSize: 10, color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width * 0.2,
                    child: Text(
                      " Class : ${list1element.className ?? ""}",
                      style: const TextStyle(fontFamily: "Gilroy Regular", fontSize: 12, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.25,
                    child: Text(
                      "Section : $list1element.section ?? " "}",
                      style: const TextStyle(fontFamily: "Gilroy Regular", fontSize: 12, color: Colors.black, overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.3,
                    child: Text(
                      "Faculty : ${list1element.faculty ?? ""}",
                      style: const TextStyle(fontFamily: "Gilroy Regular", fontSize: 12, color: Colors.black, overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AssignmentSectionWidget extends StatelessWidget {
  StudentAssignmentViewModel model;
  AssignmentSectionWidget({
    required this.model,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Text("Section", style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: secondryColor)),
        ),
        Container(
          height: 50,
          width: MediaQuery.sizeOf(context).width,
          margin: const EdgeInsets.only(
            right: 12,
            left: 12,
            bottom: 12,
          ),
          padding: EdgeInsets.only(left: 4),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: WhiteColor, border: Border.all(color: secondryColor)),
          child: Center(
            child: DropdownButton(
              padding: EdgeInsets.symmetric(horizontal: 10),
              borderRadius: BorderRadius.circular(10),
              icon: const Icon(Icons.keyboard_arrow_down_outlined),
              iconSize: 20,
              isExpanded: true,
              underline: const SizedBox(),
              value: model.selectSection ?? model.sectionList[0],
              onChanged: (newvalue) {
                model.changeSection(newvalue as Section);
              },
              items: model.sectionList.map((Section valueItem) {
                return DropdownMenuItem<Section>(
                  value: valueItem,
                  child: Text(valueItem.text!, style: TextStyle(color: BlackColor, fontFamily: 'Gilroy Medium', fontSize: 16)),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

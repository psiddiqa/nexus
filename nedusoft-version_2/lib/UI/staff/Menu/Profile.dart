// ignore_for_file: prefer_const_constructors, file_names

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nedusoft/UI/staff/Menu/profile_view_model.dart';
import 'package:nedusoft/Utils/Colors.dart';
import 'package:nedusoft/models/staff_info_model.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable
class StaffProfileScreen extends StatelessWidget {
  StaffPersonalInfoModel? model;
  Uint8List? bytesImage;

  StaffProfileScreen({super.key, this.model, this.bytesImage});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => staffProfileViewModel(),
        onViewModelReady: (model) async => await model.init(),
        builder: (context, viewmodel, child) => DefaultTabController(
              length: 4,
              child: Scaffold(
                appBar: PreferredSize(
                    preferredSize: Size(MediaQuery.sizeOf(context).width, 90),
                    child: AppBar(
                      backgroundColor: primaryColor,
                      bottom: TabBar(
                        onTap: (val) async {
                          // await viewmodel.getFamiltInfo();
                        },
                        indicatorWeight: 2,
                        labelStyle: TextStyle(
                          fontSize: 14,
                          fontFamily: "Gilroy Bold",
                        ),
                        indicatorPadding: EdgeInsets.symmetric(horizontal: 18),
                        indicatorColor: secondryColor,
                        tabs: const [
                          Tab(text: 'PERSONAL'),
                          Tab(text: 'FAMILY'),
                          Tab(text: 'EXPERIANCE'),
                          Tab(text: 'ACADEMICS'),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(24),
                        ),
                      ),
                      title: Text(
                        "Profile",
                        style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: WhiteColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
                backgroundColor: WhiteColor,
                body: TabBarView(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(height: Get.height * 0.01),
                                bytesImage == null
                                    ? CircleAvatar(
                                        radius: 60,
                                        backgroundColor: Colors.grey,
                                      )
                                    : CircleAvatar(radius: 60, backgroundImage: MemoryImage(bytesImage!)),
                                SizedBox(height: Get.height * 0.01),
                                Text(model!.employeeName ?? "", style: TextStyle(fontSize: 18, fontFamily: "Gilroy Bold", color: secondryColor)),
                                SizedBox(height: Get.height * 0.02),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: Divider(color: greycolor, thickness: 1),
                                ),
                                SizedBox(height: Get.height * 0.01),
                                profile(text: "Email", detailstext: model!.email ?? ""),
                                profile(text: "Mobile No", detailstext: model!.mobileNo ?? ""),
                                profile(text: "Gender", detailstext: model!.gender ?? ""),
                                profile(text: "Address", detailstext: model!.addressLine1 ?? ""),
                                profile(text: "Category", detailstext: model!.category ?? ""),
                                profile(text: "Department Name", detailstext: model!.departmentName ?? ""),
                                profile(text: "Date of Birth", detailstext: model!.dob == null ? "" : DateFormat.yMMMMd().format(model!.dob!)),
                                profile(text: "DOJ", detailstext: model!.doj ?? ""),
                                profile(text: "Marital Status", detailstext: model!.maritalStatus ?? ""),
                                profile(text: "Qualification", detailstext: model!.qualification ?? ""),
                                profile(text: "DLNO", detailstext: model!.dlNo ?? ""),
                                profile(text: "Bank Account", detailstext: model!.bankAccount ?? ""),
                                profile(text: "PF No", detailstext: model!.bankAccount ?? ""),
                                profile(text: "PAN", detailstext: model!.panNo ?? ""),
                                profile(text: "ESINO", detailstext: model!.eslNo ?? ""),
                                profile(text: "Height", detailstext: model!.height ?? ""),
                                profile(text: "Weight", detailstext: model!.weight ?? ""),
                                profile(text: "Blood Group", detailstext: model!.bloodGroup ?? ""),
                                profile(text: "Visa No", detailstext: model!.visaNo ?? ""),
                                profile(text: "Passport No", detailstext: model!.passport ?? ""),
                                profile(text: "Nationality", detailstext: model!.nationality ?? ""),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    viewmodel.familyDetailsModel == null
                        ? Container()
                        : viewmodel.familyDetailsModel!.list!.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 28),
                                child: SvgPicture.asset("assets/No data-amico.svg"),
                              )
                            : Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: SingleChildScrollView(
                                    child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Column(
                                      children: List.generate(
                                        viewmodel.familyDetailsModel!.list!.length,
                                        (index) => Column(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
                                              decoration: BoxDecoration(
                                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                                                color: primaryColor.withOpacity(0.8),
                                              ),
                                              child: Row(children: [
                                                Text("Name", style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 18, color: WhiteColor, fontWeight: FontWeight.bold)),
                                                SizedBox(
                                                  width: Get.width * 0.2,
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.43,
                                                  child: Text(viewmodel.familyDetailsModel!.list![index].name ?? "", style: TextStyle(fontFamily: "Gilroy Bold", fontSize: 18, color: WhiteColor)),
                                                ),
                                              ]),
                                            ),
                                            Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                                height: 50,
                                                color: WhiteColor,
                                                child: familyShowWidget(
                                                  Subject: "DOB",
                                                  marks: viewmodel.familyDetailsModel!.list![index].dob,
                                                )),
                                            Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                                color: boxcolor,
                                                child: familyShowWidget(
                                                  Subject: "Age",
                                                  marks: viewmodel.familyDetailsModel!.list![index].age,
                                                )),
                                            Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                                color: WhiteColor,
                                                child: familyShowWidget(
                                                  Subject: "Realtion",
                                                  marks: viewmodel.familyDetailsModel!.list![index].relation,
                                                )),
                                            Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                                color: boxcolor,
                                                child: familyShowWidget(
                                                  Subject: "Occupation",
                                                  marks: viewmodel.familyDetailsModel!.list![index].occupation,
                                                )),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                              decoration: BoxDecoration(
                                                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                color: WhiteColor,
                                              ),
                                              child: familyShowWidget(
                                                Subject: "Addreaa",
                                                marks: viewmodel.familyDetailsModel!.list![index].adress,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: Get.height * 0.015),
                                  ],
                                )),
                              ),
                    viewmodel.experienceDetailsModel == null
                        ? Container()
                        : viewmodel.experienceDetailsModel!.list!.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 28),
                                child: SvgPicture.asset("assets/No data-amico.svg"),
                              )
                            : Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: SingleChildScrollView(
                                    child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Column(
                                      children: List.generate(
                                        viewmodel.experienceDetailsModel!.list!.length,
                                        (index) => Column(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
                                              decoration: BoxDecoration(
                                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                                                color: primaryColor.withOpacity(0.8),
                                              ),
                                              child: Row(children: [
                                                Text("Exp.", style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 18, color: WhiteColor, fontWeight: FontWeight.bold)),
                                                SizedBox(
                                                  width: Get.width * 0.2,
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.43,
                                                  child: Text(viewmodel.experienceDetailsModel!.list![index].workPeriod ?? "", style: TextStyle(fontFamily: "Gilroy Bold", fontSize: 18, color: WhiteColor)),
                                                ),
                                              ]),
                                            ),
                                            Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                                height: 50,
                                                color: WhiteColor,
                                                child: familyShowWidget(
                                                  Subject: "Salary",
                                                  marks: viewmodel.experienceDetailsModel!.list![index].salaryDrawn,
                                                )),
                                            Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                                color: boxcolor,
                                                child: familyShowWidget(
                                                  Subject: "Board",
                                                  marks: viewmodel.experienceDetailsModel!.list![index].board,
                                                )),
                                            Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                                color: WhiteColor,
                                                child: familyShowWidget(
                                                  Subject: "Desig.",
                                                  marks: viewmodel.experienceDetailsModel!.list![index].designation,
                                                )),
                                            Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                                color: boxcolor,
                                                child: familyShowWidget(
                                                  Subject: "Nature",
                                                  marks: viewmodel.experienceDetailsModel!.list![index].natureOfDuties,
                                                )),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                              decoration: BoxDecoration(
                                                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                color: WhiteColor,
                                              ),
                                              child: familyShowWidget(
                                                Subject: "Inst.",
                                                marks: viewmodel.experienceDetailsModel!.list![index].institute,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: Get.height * 0.015),
                                  ],
                                )),
                              ),
                    viewmodel.academicsDetailsModel == null
                        ? Container()
                        : viewmodel.academicsDetailsModel!.list!.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 28),
                                child: SvgPicture.asset("assets/No data-amico.svg"),
                              )
                            : Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: SingleChildScrollView(
                                    child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Column(
                                      children: List.generate(
                                        viewmodel.academicsDetailsModel!.list!.length,
                                        (index) => Column(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
                                              decoration: BoxDecoration(
                                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                                                color: primaryColor.withOpacity(0.8),
                                              ),
                                              child: Row(children: [
                                                Text("Degree", style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 18, color: WhiteColor, fontWeight: FontWeight.bold)),
                                                SizedBox(
                                                  width: Get.width * 0.2,
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.43,
                                                  child: Text(viewmodel.academicsDetailsModel!.list![index].degree ?? "", style: TextStyle(fontFamily: "Gilroy Bold", fontSize: 18, color: WhiteColor)),
                                                ),
                                              ]),
                                            ),
                                            Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                                height: 50,
                                                color: WhiteColor,
                                                child: familyShowWidget(
                                                  Subject: "Year",
                                                  marks: viewmodel.academicsDetailsModel!.list![index].year,
                                                )),
                                            Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                                color: boxcolor,
                                                child: familyShowWidget(
                                                  Subject: "Division",
                                                  marks: viewmodel.academicsDetailsModel!.list![index].division,
                                                )),
                                            Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                                color: WhiteColor,
                                                child: familyShowWidget(
                                                  Subject: "%",
                                                  marks: viewmodel.academicsDetailsModel!.list![index].percentage,
                                                )),
                                            Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                                color: boxcolor,
                                                child: familyShowWidget(
                                                  Subject: "Sub.",
                                                  marks: viewmodel.academicsDetailsModel!.list![index].subject,
                                                )),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                              decoration: BoxDecoration(
                                                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                color: WhiteColor,
                                              ),
                                              child: familyShowWidget(
                                                Subject: "Inst.",
                                                marks: viewmodel.academicsDetailsModel!.list![index].institution,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: Get.height * 0.015),
                                  ],
                                )),
                              ),
                    
                  ],
                ),
              ),
            ));
  }

  profile({String? text, detailstext}) {
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

  familyShowWidget({String? Subject, String? marks}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width * 0.3,
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

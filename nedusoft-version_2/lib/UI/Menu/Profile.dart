// ignore_for_file: prefer_const_constructors, file_names

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nedusoft/UI/Menu/dashbord_view_model.dart';
import 'package:nedusoft/UI/Menu/profile_view_model.dart';

import 'package:nedusoft/Utils/Colors.dart';
import 'package:nedusoft/models/user_info_model.dart';
import 'package:stacked/stacked.dart';

class Profile extends StatelessWidget {
  UserPerInfoModel? model;
  Uint8List? bytesImage;

  Profile({this.model, this.bytesImage});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => StudentProfileViewModel(),
        onViewModelReady: (vmodel) async => await vmodel.init(),
        builder: (context, viewmodel, child) => DefaultTabController(
              length: 3,
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
                          Tab(text: 'HOSPITAL'),
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
                                    ? Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(color: Colors.white, border: Border.all(color: primaryColor), shape: BoxShape.circle),
                                        child: Center(child: Text(model!.studentName![0], textAlign: TextAlign.center, style: TextStyle(fontSize: 34, fontFamily: "Gilroy Bold", color: primaryColor))),
                                      )
                                    : CircleAvatar(radius: 40, backgroundImage: MemoryImage(bytesImage!)),
                                SizedBox(height: Get.height * 0.01),
                                Text(model!.studentName ?? "", style: TextStyle(fontSize: 18, fontFamily: "Gilroy Bold", color: secondryColor)),
                                SizedBox(height: Get.height * 0.02),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: Divider(color: greycolor, thickness: 1),
                                ),
                                SizedBox(height: Get.height * 0.01),
                                profile(text: "Roll Number", detailstext: model!.rollNo ?? ""),
                                profile(text: "Section", detailstext: model!.section ?? ""),
                                profile(text: "Admission No", detailstext: model!.admissionNo ?? ""),
                                profile(text: "Date of Birth", detailstext: model!.dob ?? ""),
                                profile(text: "Quota", detailstext: model!.quota ?? ""),
                                profile(text: "Gender", detailstext: model!.gender ?? ""),
                                profile(text: "Category", detailstext: model!.category ?? ""),
                                profile(text: "Address", detailstext: model!.addressLine1 ?? ""),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(height: Get.height * 0.01),
                                SizedBox(height: Get.height * 0.01),
                                profile(text: "Father Name", detailstext: viewmodel.familyDetailsModel?.fatherName ?? ""),
                                profile(text: "Qualification", detailstext: viewmodel.familyDetailsModel?.fQualification ?? ""),
                                profile(text: "Profession", detailstext: viewmodel.familyDetailsModel?.fProfession ?? ""),
                                profile(text: "Income", detailstext: viewmodel.familyDetailsModel?.fIncome ?? ""),
                                profile(text: "Company", detailstext: viewmodel.familyDetailsModel?.fCompany ?? ""),
                                profile(text: "Mobile", detailstext: viewmodel.familyDetailsModel?.fMobile ?? ""),
                                profile(text: "Mother Name", detailstext: viewmodel.familyDetailsModel?.motherName ?? ""),
                                profile(text: "Qualification", detailstext: viewmodel.familyDetailsModel?.mQualification ?? ""),
                                profile(text: "Profession", detailstext: viewmodel.familyDetailsModel?.mProfession ?? ""),
                                profile(text: "Income", detailstext: viewmodel.familyDetailsModel?.mIncome ?? ""),
                                profile(text: "Company", detailstext: viewmodel.familyDetailsModel?.mCompany ?? ""),
                                profile(text: "Mobile", detailstext: viewmodel.familyDetailsModel?.mMobile ?? ""),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(height: Get.height * 0.01),
                                SizedBox(height: Get.height * 0.01),
                                profile(text: "Doctor Name", detailstext: viewmodel.hospitalModel?.doctorName ?? ""),
                                profile(text: "File No", detailstext: viewmodel.hospitalModel?.fileNo ?? ""),
                                profile(text: "Hospital Name", detailstext: viewmodel.hospitalModel?.hospitalName ?? ""),
                                profile(text: "Insurance", detailstext: viewmodel.hospitalModel?.insurance ?? ""),
                                profile(text: "Policy", detailstext: viewmodel.hospitalModel?.policy ?? ""),
                                
                              ],
                            ),
                          ),
                        ),
                      ],
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
                child: Text(detailstext, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: secondryColor)),
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

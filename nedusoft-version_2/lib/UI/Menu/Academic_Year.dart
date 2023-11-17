// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
import 'package:nedusoft/Utils/Colors.dart';
import 'package:nedusoft/Utils/Custom_widget.dart';

class AcademicYear extends StatefulWidget {
  const AcademicYear({super.key});

  @override
  State<AcademicYear> createState() => _AcademicYearState();
}

class _AcademicYearState extends State<AcademicYear> {
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WhiteColor,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: AppButton(
          buttonText: "Update",
          ontap: () {},
        ),
      ),
      body: Column(
        children: [
          CustomAppbar(Appbartext: "Select Academic Year"),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Get.height * 0.02),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: academicYear(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  academicYear() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  selectedindex = index;
                });
              },
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedindex = index;
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: selectedindex == index
                                  ? pinkcolor
                                  : greycolor),
                          color:
                              selectedindex == index ? pinkcolor : WhiteColor),
                      child: Center(
                        child: selectedindex == index
                            ? Icon(
                                Icons.done,
                                size: 20,
                                color: WhiteColor,
                              )
                            : SizedBox(),
                      ),
                    ),
                  ),
                  SizedBox(width: Get.width * 0.06),
                  Text(
                    "2020-21",
                    style: TextStyle(
                        color: BlackColor,
                        fontFamily: "Gilroy Medium",
                        fontSize: 18),
                  )
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Divider(color: greycolor)
          ],
        );
      },
    );
  }
}

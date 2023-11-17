// ignore_for_file: file_names, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nedusoft/Utils/Colors.dart';

CustomAppbar({String? Appbartext, Widget? backbutton}) {
  return Stack(
    alignment: Alignment.topCenter,
    children: [
      Container(
        width: double.infinity,
        height: Get.height * 0.115,
        decoration: BoxDecoration(color: Color(0xFF52AB8E).withOpacity(0.9), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35))),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Row(
          children: [
            backbutton ??
                BackButton(
                  color: WhiteColor,
                ),
            SizedBox(width: Get.width * 0.02),
            SizedBox(
              width: Get.width * 0.70,
              child: Text(
                Appbartext!,
                style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: WhiteColor),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      )
    ],
  );
}

textfield({Key? key, double? containerHight, String? hinttext, Function()? ontap, TextInputType? type, double? Width, bool? obscureText, String? Function(String?)? vadlidation, TextEditingController? controller, Widget? suffixIcon}) {
  return Container(
      padding: EdgeInsets.only(top: 8, left: 12),
      width: Width,
      height: containerHight ?? 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: WhiteColor, border: Border.all(color: secondryColor)),
      child: Form(
        key: key,
        child: TextFormField(
          obscureText: obscureText!,
          keyboardType: type ?? TextInputType.text,
          validator: vadlidation,
          style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: "Gilroy Medium"),
          onTap: ontap,
          controller: controller,
          decoration: InputDecoration(
              suffixIcon: suffixIcon,
              hintText: hinttext,
              hintStyle: TextStyle(color: BlackColor, fontFamily: "Gilroy Regular", fontSize: 18),
              labelStyle: TextStyle(
                color: greycolor,
                fontFamily: "Gilroy Medium",
              ),
              border: InputBorder.none),
        ),
      ));
}

AppButton({VoidCallback? ontap, String? buttonText, Color? backgroundColor, Color? textColor}) {
  return InkWell(
    onTap: ontap,
    child: Container(
        height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: backgroundColor ?? primaryColor
            // gradient: LinearGradient(
            //   colors: [Color(0xff667FF7), Color(0xff4361EE).withOpacity(0.9)],
            //   begin: Alignment.bottomLeft,
            //   end: Alignment.topRight,
            //   stops: const [0.1, 2],
            //   // tileMode: TileMode.repeated,
            // ),
            ),
        child: Center(
          child: Text(buttonText!, style: TextStyle(color: textColor ?? WhiteColor, fontSize: 19, fontFamily: "Gilroy Bold")),
        )),
  );
}

List staffMenu = [
  // {"img": "assets/home.png", "subtext": "Deshboard", "status": "1"},
  {"img": "assets/Attendance.png", "subtext": "Attendance", "status": "3"},
  {"img": "assets/NoticeBoard.png", "subtext": "Lesson Update", "status": "8"},
  {"img": "assets/homework.png", "subtext": "Assignment", "status": "2"},

  {"img": "assets/Notification.png", "subtext": "Notification", "status": "14"},
  {"img": "assets/Calender.png", "subtext": "My Time Table", "status": "7"},
  {"img": "assets/Examination.png", "subtext": "Feedback", "status": "5"},
  {"img": "assets/ReportCard.png", "subtext": "Marks", "status": "6"},
  {"img": "assets/AcademicYear.png", "subtext": "My Chapters", "status": "10"},
  {"img": "assets/Multimedia.png", "subtext": "Student Allocation", "status": "9"},
  {"img": "assets/NoticeBoard.png", "subtext": "Faculty Videos", "status": "4"},
  {"img": "assets/Chat.png", "subtext": "Support", "status": "11"},

  // {"img": "assets/FreeDetails.png", "subtext": "Fee Details", "status": "4"},

  // {"img": "assets/Profile.png", "subtext": "Profile", "status": "12"},
  // {"img": "assets/Bus.png", "subtext": "Bus", "status": "13"},
];

List StudentMenu = [
  // {"img": "assets/home.png", "subtext": "Deshboard", "status": "1"},
  {"img": "assets/Attendance.png", "subtext": "Attendance", "status": "3"},
  {"img": "assets/NoticeBoard.png", "subtext": "Lesson Update", "status": "8"},
  {"img": "assets/homework.png", "subtext": "Assignment", "status": "2"},
  {"img": "assets/FreeDetails.png", "subtext": "Fee Details", "status": "4"},
  {"img": "assets/Examination.png", "subtext": "Feedback", "status": "5"},
  {"img": "assets/ReportCard.png", "subtext": "Marks", "status": "6"},
  {"img": "assets/Calender.png", "subtext": "My Time Table", "status": "7"},
  {"img": "assets/Notification.png", "subtext": "Notification", "status": "14"},
  {"img": "assets/NoticeBoard.png", "subtext": "Learn", "status": "13"},
  {"img": "assets/Notification.png", "subtext": "Events", "status": "9"},

  {"img": "assets/Chat.png", "subtext": "Support", "status": "11"},
  //   {"img": "assets/Calender.png", "subtext": "My Time Table", "status": "7"},
  // {"img": "assets/Examination.png", "subtext": "Feedback", "status": "5"},

  // {"img": "assets/Multimedia.png", "subtext": "Multimedia", "status": "9"},
  // {"img": "assets/AcademicYear.png", "subtext": "Academic Year", "status": "10"},

  // {"img": "assets/Profile.png", "subtext": "Profile", "status": "12"},
  // {"img": "assets/Bus.png", "subtext": "Bus", "status": "13"},
];

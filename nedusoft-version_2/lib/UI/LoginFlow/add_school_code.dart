// ignore_for_file: file_names, prefer_const_constructors
import 'dart:developer';
import 'package:nedusoft/core/service_locator/service_locator.dart';
import 'package:nedusoft/core/services/needed_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nedusoft/UI/LoginFlow/login_view_model.dart';
import 'package:nedusoft/Utils/Colors.dart';
import 'package:nedusoft/Utils/Custom_widget.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:stacked/stacked.dart';

import 'Sign_in.dart';

class AddSchoolCode extends StatefulWidget {
  const AddSchoolCode({super.key});

  @override
  State<AddSchoolCode> createState() => _AddSchoolCodeState();
}

class _AddSchoolCodeState extends State<AddSchoolCode> {
  List listitem = ["Staff", "Student"];
  String? selectarrive = 'Student';
  NeededVariables _neededVariables = locator<NeededVariables>();
  final _formKey = GlobalKey<FormState>();
  double hight = 50;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) => LoadingOverlay(
              isLoading: model.isBusy,
              progressIndicator: CircularProgressIndicator(
                color: secondryColor,
              ),
              opacity: 0.5,
              child: Scaffold(
                backgroundColor: WhiteColor,
                body: SingleChildScrollView(
                  child: Stack(children: [
                    Container(
                      width: double.infinity,
                      height: Get.height * 0.5,
                      decoration: BoxDecoration(color: Color(0xFF52AB8E).withOpacity(0.9), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35))),
                      child: Center(
                        child: Image.asset(
                          "assets/Nedusoft-Logo.png",
                          height: MediaQuery.sizeOf(context).height * 0.3,
                          width: MediaQuery.sizeOf(context).height * 0.4,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: Get.height * 0.5),
                          // Center(child: Text("School Code", style: TextStyle(fontSize: 34, fontFamily: "Gilroy Bold", color: WhiteColor))),
                          
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("As", style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: secondryColor)),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                width: MediaQuery.sizeOf(context).width,
                                margin: EdgeInsets.only(right: 12),
                                padding: EdgeInsets.only(left: 4),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: WhiteColor, border: Border.all(color: secondryColor)),
                                child: DropdownButton(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  borderRadius: BorderRadius.circular(10),
                                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                                  iconSize: 20,
                                  isExpanded: true,
                                  underline: const SizedBox(),
                                  value: selectarrive,
                                  onChanged: (newvalue) {
                                    setState(() {
                                      selectarrive = newvalue as String?;
                                    });
                                  },
                                  items: listitem.map((valueItem) {
                                    return DropdownMenuItem(
                                      value: valueItem,
                                      child: Text(valueItem, style: TextStyle(color: BlackColor, fontFamily: 'Gilroy Medium', fontSize: 16)),
                                    );
                                  }).toList(),
                                ),
                              ),
                              SizedBox(height: Get.height * 0.03),
                              Text("Enter School/College Code", style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: secondryColor)),
                              SizedBox(
                                height: 10,
                              ),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                textfield(
                                    key: _formKey,
                                    containerHight: hight,
                                    vadlidation: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                    hinttext: "Enter school code",
                                    Width: Get.width * 0.91,
                                    controller: model.schoolName,
                                    obscureText: false,
                                    ontap: () {})
                              ]),
                              SizedBox(height: Get.height * 0.12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Checkbox(
                                    onChanged: (value) {
                                      model.changeAccept(value!);
                                    },
                                    value: model.isAccept,
                                    activeColor: secondryColor,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text: "I accept ",
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                              text: "Terms of Use",
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () async {
                                                  await launchUrl(Uri.parse("https://nedusoft.com/return-and-refund-policy-duplicate-3485/"));
                                                },
                                              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.orange, decoration: TextDecoration.underline)),
                                          const TextSpan(
                                              text: " & ",
                                              style: TextStyle(
                                                color: Colors.black,
                                              )),
                                          TextSpan(
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () async {
                                                  await launchUrl(Uri.parse("https://nedusoft.com/privacy-policy-2/"));
                                                },
                                              text: "Privacy Policy",
                                              style: TextStyle(color: Colors.orange, decoration: TextDecoration.underline, fontWeight: FontWeight.bold)),
                                        ]),
                                  ),
                                  
                                ],
                              ),
                              Center(
                                child: Text(
                                  "v${_neededVariables.appVersion}(${_neededVariables.appBuildNumber})" ?? "",
                                  style: TextStyle(color: secondryColor),
                                ),
                              ),
                              AppButton(
                                backgroundColor: model.isAccept ? primaryColor : Colors.grey,
                                buttonText: "Submit",
                                ontap: () {
                                  if (_formKey.currentState!.validate()) {
                                    if (model.isAccept) {
                                      model.getBaseUrl(selectarrive!);
                                    }
                                  } else {
                                    setState(() {
                                      hight = 60;
                                    });
                                  }
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ));
  }
}

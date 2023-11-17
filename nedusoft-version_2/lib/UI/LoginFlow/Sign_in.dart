// ignore_for_file: file_names, prefer_const_constructors
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nedusoft/UI/LoginFlow/login_view_model.dart';

import 'package:nedusoft/Utils/Colors.dart';
import 'package:nedusoft/Utils/Custom_widget.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:stacked/stacked.dart';

class Signin extends StatelessWidget {
  String asFor;
  String? image;
  Signin({required this.asFor, required this.image});

  final _formKey = GlobalKey<FormState>();
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
                backgroundColor: Color(0xFF52AB8E).withOpacity(0.9),
                body: SingleChildScrollView(
                  child: Stack(children: [
                    Container(
                      width: double.infinity,
                      height: Get.height * 0.45,
                      decoration: BoxDecoration(color: WhiteColor, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35))),
                      child: image == null
                          ? Center(
                              child: Image.asset(
                                "assets/Nedusoft-Logo.png",
                                height: MediaQuery.sizeOf(context).height * 0.3,
                                width: MediaQuery.sizeOf(context).height * 0.4,
                                fit: BoxFit.fill,
                              ),
                            )
                          : Center(
                              child: Container(
                              height: MediaQuery.sizeOf(context).height * 0.3,
                              width: MediaQuery.sizeOf(context).height * 0.4,
                              child: CachedNetworkImage(
                                imageUrl: image!,
                                placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(
                                  color: primaryColor,
                                )),
                                errorWidget: (context, url, error) => Icon(
                                  Icons.image_not_supported,
                                  size: 100,
                                ),
                              ),
                              // decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://demo.nedusoft.com/Images/5b0a47d5-dfc9-479b-8148-b50407994aa3.png"))),
                            )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: Get.height * 0.41),
                          SizedBox(height: Get.height * 0.15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Phone Number", style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: WhiteColor)),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    textfield(
                                      key: _formKey,
                                      containerHight: model.hight,
                                      vadlidation: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter email / mobile number';
                                        }
                                        return null;
                                      },
                                      hinttext: "Email / Mobile number",
                                      Width: Get.width * 0.9,
                                      controller: model.phone,
                                      obscureText: false,
                                      ontap: () {},
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: Get.height * 0.03),
                              Text("Password", style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: WhiteColor)),
                              SizedBox(
                                height: 10,
                              ),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                textfield(
                                  
                                    hinttext: "*************",
                                    Width: Get.width * 0.91,
                                    controller: model.password,
                                    obscureText: model.isVisible,
                                    ontap: () {},
                                    suffixIcon: model.isVisible
                                        ? InkWell(
                                            onTap: () {
                                              model.changeVisibility(false);
                                            },
                                            child: Icon(
                                              Icons.visibility_off,
                                              color: BlackColor,
                                            ),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              model.changeVisibility(true);
                                            },
                                            child: Icon(
                                              Icons.visibility,
                                              color: BlackColor,
                                            ),
                                          ))
                              ]),
                              SizedBox(height: Get.height * 0.05),
                              AppButton(
                                buttonText: "Sign In",
                                backgroundColor: WhiteColor,
                                textColor: secondryColor,
                                ontap: () {
                                  if (_formKey.currentState!.validate()) {
                                    if (asFor == "Student") {
                                      model.studentLogin(asFor);
                                    } else {
                                      model.staffLogin(asFor);
                                    }
                                  } else {
                                    model.changeHight(60);
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

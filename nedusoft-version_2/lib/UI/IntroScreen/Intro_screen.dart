// ignore_for_file: prefer_const_constructors, file_names, prefer_final_fields, unused_element

import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:nedusoft/Utils/custom_snackbar.dart';
import 'package:upgrader/upgrader.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nedusoft/UI/IntroScreen/intro_view_model.dart';

import 'package:nedusoft/Utils/Colors.dart';
import 'package:nedusoft/Utils/String.dart';
import 'package:nedusoft/app/app.router.dart';
import 'package:nedusoft/core/service_locator/service_locator.dart';
import 'package:nedusoft/core/services/needed_utils.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../LoginFlow/add_school_code.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  // IntroViewModel? introModel;

  @override
  void initState() {
    // WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    // WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) async {
  //   super.didChangeAppLifecycleState(state);
  //   if (state == AppLifecycleState.detached) {
  //     log("detached");
  //   } else if (state == AppLifecycleState.inactive) {
  //     log("inactive");
  //   } else if (state == AppLifecycleState.paused) {
  //     log("paused");
  //   } else if (state == AppLifecycleState.resumed) {
  //     log("resume");
  //     introModel?.authenticate();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        onViewModelReady: (viewModel) {
          // introModel = viewModel;
          viewModel.init();
        },
        viewModelBuilder: () => IntroViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: Color(0xFF52AB8E).withOpacity(0.9),
              bottomNavigationBar: Container(
                height: 20,
                width: MediaQuery.sizeOf(context).width,
                margin: const EdgeInsets.only(bottom: 18),
                child: InkWell(
                  onTap: () async {
                    await launchUrl(Uri.parse("https://nedusoft.com/"));
                  },
                  child: Center(
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "Powered by ",
                        style: TextStyle(color: WhiteColor),
                      ),
                      TextSpan(
                        text: "NEDUSOFT",
                        style: TextStyle(decoration: TextDecoration.underline, color: WhiteColor, fontFamily: "Gilroy Bold", fontWeight: FontWeight.bold),
                      ),
                    ])),
                  ),
                ),
              ),
              body: Stack(
                children: [
                  Center(
                    child: Container(
                      height: MediaQuery.sizeOf(context).height * 0.3,
                      width: MediaQuery.sizeOf(context).height * 0.6,
                      child: Image.asset(
                        "assets/Nedusoft-Logo.png",
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  model.showUnlockButton
                      ? Positioned.fill(
                      bottom: 40,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: () async {
                            if (model.showUnlockButton) {
                                  await model.authenticate();
                            } else {
                              showCustomSnackbar(
                                msg: "Please Wait.....",
                              );
                            }
                          },
                          child: Container(
                            width: 170,
                            height: 40,
                            decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white)),
                            child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                              Icon(
                                Icons.lock,
                                color: secondryColor,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text("Tap To Unlock", style: TextStyle(fontSize: 18, color: WhiteColor, fontFamily: "Gilroy Medium"))
                            ]),
                          ),
                        ),
                          ))
                      : SizedBox()
                ],
              ),
              // body: UpgradeAlert(
              //   upgrader: Upgrader(shouldPopScope: () => true, canDismissDialog: true, durationUntilAlertAgain: Duration(days: 1), dialogStyle: Platform.isIOS ? UpgradeDialogStyle.cupertino : UpgradeDialogStyle.material),
              //   child:
              // ),
            ));
  }
}

class Onbording extends StatefulWidget {
  const Onbording({super.key});

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int _currentPage = 0;
  List<Slide> _slides = [];
  PageController _pageController = PageController();
  NeededVariables _neededVariables = locator<NeededVariables>();
  NavigationService _navigationService = locator<NavigationService>();
  int currentPage = 0;
  @override
  void initState() {
    super.initState();

    _currentPage = 0;

    // _slides = [
    //   Slide("assets/getty.jpg", "provider.bestser", "provider.bestacc"),
    //   Slide("assets/lobby.jpg", " provider.bestservi", "provider.getthe"),
    //   Slide("assets/hotelajanta.jpg", "provider.expeart", "provider.wehave"),
    // ];
    // _pageController = PageController(initialPage: _currentPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      controller: _pageController,
      scrollDirection: Axis.horizontal,
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              color: primaryColor,
            ),
            Column(
              children: [
                SizedBox(height: Get.height * 0.15),
                Center(
                  child: SizedBox(
                    width: Get.width * 0.70,
                    child: Text(provider.welcome, style: TextStyle(color: WhiteColor, fontSize: 34, fontFamily: "Gilroy Bold"), textAlign: TextAlign.center),
                  ),
                ),
                SizedBox(height: Get.height * 0.02),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset("assets/introimg1.png", height: Get.height * 0.5, width: double.infinity),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                InkWell(
                  onTap: () {
                    _pageController.nextPage(duration: const Duration(microseconds: 300), curve: Curves.easeIn);
                  },
                  child: CircleAvatar(
                    backgroundColor: WhiteColor,
                    radius: 35,
                    child: Icon(Icons.arrow_forward_ios, color: secondryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
        Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              color: Color(0xFF52AB8E).withOpacity(0.9),
            ),
            Column(
              children: [
                SizedBox(height: Get.height * 0.15),
                Center(
                  child: SizedBox(
                    width: Get.width * 0.70,
                    child: Text(provider.monitor, style: TextStyle(color: WhiteColor, fontSize: 34, fontFamily: "Gilroy Medium"), textAlign: TextAlign.center),
                  ),
                ),
                SizedBox(height: Get.height * 0.02),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset("assets/introimg2.png", height: Get.height * 0.5, width: double.infinity),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                InkWell(
                  onTap: () {
                    _pageController.nextPage(duration: const Duration(microseconds: 400), curve: Curves.easeIn);
                  },
                  child: CircleAvatar(
                    backgroundColor: WhiteColor,
                    radius: 35,
                    child: Icon(Icons.arrow_forward_ios, color: secondryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
        currentPage == 2
            ? Stack(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                    color: Color(0xFF52AB8E).withOpacity(0.9),
                  ),
                  Column(
                    children: [
                      SizedBox(height: Get.height * 0.15),
                      Center(
                        child: SizedBox(
                          width: Get.width * 0.70,
                          child: Text(provider.bealways, style: TextStyle(color: WhiteColor, fontSize: 34, fontFamily: "Gilroy Medium"), textAlign: TextAlign.center),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.02),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset("assets/introimg3.png", height: Get.height * 0.5, width: double.infinity),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => _pageController.nextPage(duration: const Duration(microseconds: 300), curve: Curves.easeIn));
                        },
                        child: CircleAvatar(
                          backgroundColor: WhiteColor,
                          radius: 35,
                          child: Icon(Icons.arrow_forward_ios, color: secondryColor),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Stack(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                    color: Color(0xFF52AB8E).withOpacity(0.9),
                  ),
                  Column(
                    children: [
                      SizedBox(height: Get.height * 0.15),
                      Center(
                        child: SizedBox(
                          width: Get.width * 0.70,
                          child: Text(provider.bealways, style: TextStyle(color: WhiteColor, fontSize: 34, fontFamily: "Gilroy Medium"), textAlign: TextAlign.center),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.02),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset("assets/introimg3.png", height: Get.height * 0.5, width: double.infinity),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      InkWell(
                        onTap: () {
                          _neededVariables.sharedPreferences.setBool("Onbording", true);
                          _navigationService.clearStackAndShow(Routes.addSchoolCode);
                        },
                        child: CircleAvatar(
                          backgroundColor: WhiteColor,
                          radius: 35,
                          child: Icon(Icons.check, color: secondryColor),
                        ),
                      ),
                    ],
                  ),
                ],
              )
      ],
    ));
  }

  void _handlingOnPageChanged(int page) {
    setState(() => currentPage = page);
  }

  Widget _buildPageIndicator() {
    Row row = Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        "yagnik",
        style: TextStyle(color: WhiteColor),
      )
    ]);
    for (int i = 0; i < _slides.length; i++) {
      row.children.add(_buildPageIndicatorItem(i));
      if (i != _slides.length - 1)
        // ignore: curly_braces_in_flow_control_structures
        row.children.add(const SizedBox(
          width: 10,
        ));
    }
    return row;
  }

  Widget _buildPageIndicatorItem(int index) {
    return Container(
      width: index == _currentPage ? 12 : 8,
      height: index == _currentPage ? 12 : 8,
      decoration: BoxDecoration(shape: BoxShape.circle, color: index == _currentPage ? greenColor : greycolor),
    );
  }
}

class Slide {
  String image;
  String heading;
  String subtext;

  Slide(this.image, this.heading, this.subtext);
}

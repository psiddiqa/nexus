import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/UI/learn/student_learn_view_model.dart';
import 'package:nedusoft/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../Utils/Colors.dart';
import '../../core/service_locator/service_locator.dart';
import '../../core/widget/common_app_bar.dart';
import '../../models/student/student_learn_model.dart';

class StudentLearnChapters extends StatelessWidget {
  StudentLearnChapterModel? model;
  StudentLearnChapters({required this.model});

  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: WhiteColor,
        appBar: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, 60), child: CommonAppBar("Learn Chapters")),
        body: model!.list!.isEmpty
            ? Center(
                child: Text(
                "No Chapters Available",
                style: TextStyle(fontSize: 14, color: primaryColor, fontFamily: "Gilroy Bold"),
              ))
            : GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                scrollDirection: Axis.vertical,
                itemCount: model!.list!.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 220, childAspectRatio: 2 / 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      _navigationService.navigateTo(Routes.chapterVideo, arguments: ChapterVideoArguments(chapterId: model!.list![index].value.toString()));
                    },
                    child: Stack(children: [
                      SizedBox(
                        height: 140,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset("assets/subjects.jpg"),
                        ),
                      ),
                      Positioned.fill(
                          top: 20,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: SizedBox(
                              width: 100,
                              child: Text(
                                model!.list![index].text ?? "",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: primaryColor,
                                  fontFamily: "Gilroy Bold",
                                ),
                              ),
                            ),
                          )),
                      Positioned.fill(
                          top: -60,
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(color: Colors.transparent, border: Border.all(color: primaryColor), shape: BoxShape.circle),
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.black.withOpacity(0.7),
                                )),
                          ))
                    ]),
                  );
                }));
  }
}

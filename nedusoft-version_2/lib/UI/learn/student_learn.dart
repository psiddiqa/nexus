import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/UI/learn/student_learn_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../Utils/Colors.dart';
import '../../core/widget/common_app_bar.dart';

class StudentLearn extends StatelessWidget {
  StudentLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => StudentLearnViewModel(),
        onViewModelReady: (model) async => await model.init(),
        builder: (context, model, child) => LoadingOverlay(
            isLoading: model.isBusy,
            progressIndicator: const CircularProgressIndicator(
              color: Colors.white,
            ),
            opacity: 0.5,
            child: Scaffold(
                backgroundColor: WhiteColor,
                appBar: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, 60), child: CommonAppBar("Learn")),
                body: model.stubjectModel == null
                    ? const SizedBox()
                    : GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        scrollDirection: Axis.vertical,
                        itemCount: model.stubjectModel!.list!.length,
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 220, childAspectRatio: 2 / 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
                        itemBuilder: (context, index) {
                          return InkWell(
                            splashColor: WhiteColor,
                            highlightColor: WhiteColor,
                            onTap: () {
                              model.navigateToChapters(model.stubjectModel!.list![index].subjectId.toString());
                            },
                            child: Column(children: [
                              SizedBox(
                                height: 120,
                                child: model.stubjectModel!.list![index].subjectIcon! == null
                                    ? const Icon(
                                        Icons.image_not_supported,
                                        size: 40,
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.memory(const Base64Decoder().convert(model.stubjectModel!.list![index].subjectIcon!)),
                                      ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                model.stubjectModel!.list![index].subject ?? "",
                                style: TextStyle(fontSize: 14, color: primaryColor, fontFamily: "Gilroy Bold"),
                              )
                            ]),
                          );
                        }))));
  }
}

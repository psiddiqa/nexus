import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/Utils/Colors.dart';
import 'package:nedusoft/models/student/get_mark_dropdown_model.dart';
import 'package:stacked/stacked.dart';

import '../../../core/widget/common_app_bar.dart';
import 'marks_detail_view_model.dart';

// ignore: must_be_immutable
class StudentMarkDetail extends StatelessWidget {
  GetStudentMarksList getStudentMarksList;
  String examName;
  StudentMarkDetail({
    Key? key,
    required this.getStudentMarksList,
    required this.examName,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        // onViewModelReady: (model) async => await model.init(getStudentMarksList),
        viewModelBuilder: () => StudentMarksDetailViewModel(),
        builder: (context, model, child) => LoadingOverlay(
              isLoading: model.isBusy,
              progressIndicator: const CircularProgressIndicator(
                color: Colors.white,
              ),
              opacity: 0.5,
              child: Scaffold(
                  appBar: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, 60), child: CommonAppBar(examName)),
                  backgroundColor: WhiteColor,
            )));
  }
}

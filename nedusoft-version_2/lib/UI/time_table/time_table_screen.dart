import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/UI/time_table/time_table_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../Utils/Colors.dart';
import '../../../core/widget/common_app_bar.dart';
import '../../app/app.router.dart';
import '../../core/service_locator/service_locator.dart';
import '../../models/staff/get_timetable_model.dart';

class StudentTimeTable extends StatelessWidget {
  StudentTimeTable({super.key});
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => StudentTimeTableViewModel(),
        onViewModelReady: (model) async => await model.init(),
        builder: (context, model, child) => LoadingOverlay(
              isLoading: model.isBusy,
              progressIndicator: const CircularProgressIndicator(
                color: Colors.white,
              ),
              opacity: 0.5,
              child: Scaffold(
                  backgroundColor: WhiteColor,
                  appBar: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, 60), child: CommonAppBar("My Time Table")),
                  body: model.getFacultyTimeTableModel == null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28),
                          child: SvgPicture.asset("assets/No data-amico.svg"),
                        )
                      : Column(
                          children: List.generate(
                              model.getFacultyTimeTableModel!.days!.length,
                              (index) => Column(
                                    children: [
                                      WeekWidget(
                                          name: model.getFacultyTimeTableModel!.days![index].day!,
                                          function: () {
                                            _navigationService.navigateTo(Routes.studentBuildClasses, arguments: StudentBuildClassesArguments(heading: model.getFacultyTimeTableModel!.days![index].day!, schedulesList: model.getFacultyTimeTableModel!.days![index].schedules!, today: model.getFacultyTimeTableModel!.days![index].day! == DateFormat('EEEE').format(DateTime.now()) ? true : false));
                                          }),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 12),
                                        child: Divider(
                                          thickness: 1.5,
                                        ),
                                      ),
                                    ],
                                  )),
                        )),
            ));
  }
}

class WeekWidget extends StatelessWidget {
  String name;
  VoidCallback function;
  WeekWidget({
    required this.name,
    required this.function,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 18, color: secondryColor, fontFamily: "Gilroy Medium"),
          ),
          InkWell(
            onTap: function,
            child: CircleAvatar(
              radius: 12,
              backgroundColor: primaryColor,
              child: const Icon(
                Icons.arrow_right,
                size: 20,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class StudentBuildClasses extends StatelessWidget {
  String heading;
  List<Schedule> schedulesList;
  bool today;
  StudentBuildClasses({required this.heading, required this.schedulesList, required this.today});
  final DateFormat dateFormat = DateFormat("hh:mm a");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: WhiteColor,
        appBar: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, 60), child: CommonAppBar("$heading Time Table")),
        body: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          physics: const BouncingScrollPhysics(),
          itemCount: schedulesList.length,
          itemBuilder: (BuildContext context, int index) {
            Schedule c = schedulesList[index];
            today ? _getStatus(c) : null;
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.32,
                      child: Row(
                        children: [
                          Text(
                            dateFormat.format(c.fromTime!),
                            style: TextStyle(
                              color: c.isPassed ? Colors.black.withOpacity(0.4) : Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          _getTime(c, context),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      c.subjectName ?? "Subject",
                      style: TextStyle(
                        color: c.isPassed ? Colors.black.withOpacity(0.4) : Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    c.isHappening
                        ? Container(
                            height: 25.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: const Center(
                                child: Text(
                              "Now",
                              style: TextStyle(color: Colors.white),
                            )),
                          )
                        : Container(),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.27, bottom: 20.0),
                      width: 2,
                      height: 60.0,
                      color: c.isPassed ? primaryColor.withOpacity(0.4) : primaryColor,
                    ),
                    const SizedBox(width: 28.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.class_outlined,
                              color: c.isPassed ? primaryColor.withOpacity(0.4) : primaryColor,
                              size: 20.0,
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              c.className!,
                              style: TextStyle(
                                color: c.isPassed ? const Color(0xFF6C7174).withOpacity(0.4) : const Color(0xFF6C7174),
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6.0),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.person,
                              color: c.isPassed ? primaryColor.withOpacity(0.4) : primaryColor,
                              size: 20.0,
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              c.faculty!,
                              style: TextStyle(
                                color: c.isPassed ? const Color(0xFF6C7174).withOpacity(0.3) : const Color(0xFF6C7174),
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 20.0),
              ],
            );
          },
        ));
  }

  _getStatus(Schedule c) {
    DateTime now = DateTime.now();
    DateTime finishedTime = c.toTime!;
    DateTime startTime = c.fromTime!;
    if (now.difference(startTime).inMinutes >= 39) {
      c.isPassed = true;
    } else if (now.difference(startTime).inMinutes <= 39 && now.difference(finishedTime).inMinutes >= -39) {
      c.isHappening = true;
    }
  }

  _getTime(Schedule c, context) {
    return Container(
      height: 25.0,
      width: 25.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: c.isPassed ? primaryColor.withOpacity(0.4) : primaryColor,
          // width: 2.0,
        ),
      ),
      child: _getChild(c, context),
    );
  }

  _getChild(Schedule c, context) {
    if (c.isPassed) {
      return Icon(
        Icons.check,
        color: c.isPassed ? primaryColor.withOpacity(0.4) : primaryColor,
        size: 15.0,
      );
    } else if (c.isHappening) {
      return Container(
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: primaryColor,
          shape: BoxShape.circle,
        ),
      );
    }
    return null;
  }
}

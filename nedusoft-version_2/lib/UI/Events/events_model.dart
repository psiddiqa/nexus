import 'dart:developer';

import 'package:nedusoft/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../core/API/api_service.dart';
import '../../core/service_locator/service_locator.dart';
import '../../core/services/needed_utils.dart';
import '../../models/student/student_event_model.dart';

class EventsViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  StudentEventModel? eventModel;

  init() async {
    await getEvent();
  }

  Future<void> getEvent() async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      eventModel = await apiService.getEventList({"LoginName": _neededVariables.loginModel!.loginName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "Value": "12262"});

      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }

  String timeAgo(DateTime d) {
    Duration diff = DateTime.now().difference(d);
    if (diff.inDays > 365) return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
    if (diff.inDays > 30) return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
    if (diff.inDays > 7) return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
    if (diff.inDays > 0) return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
    if (diff.inHours > 0) return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
    if (diff.inMinutes > 0) return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
    return "just now";
  }

  navigateToDetails(ListElement element) {
    _navigationService.navigateTo(Routes.eventDetail, arguments: EventDetailArguments(listElement: element));
  }
}

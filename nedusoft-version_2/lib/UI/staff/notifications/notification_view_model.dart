import 'package:nedusoft/app/app.router.dart';
import 'package:nedusoft/models/staff_notification_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/API/api_service.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/services/needed_utils.dart';
import 'notification.dart';

class staffNotificationViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();
  StaffNotificationModel? staffNotificationModel;

  navigateToDetailPage(String nID) {
    _navigationService.navigateTo(Routes.staffNotificationDetail, arguments: StaffNotificationDetailArguments(nId: nID));
  }

  init() async {
    setBusy(true);
    await getAllStaffNotifications();
    notifyListeners();
    setBusy(false);
  }

  Future<void> getAllStaffNotifications() async {
    try {
      setBusy(true);
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      final result = await apiService.staffAllNotification({
        "LoginName": _neededVariables.loginModel!.loginName,
        "LoginId": _neededVariables.loginModel!.loginId,
        "token": _neededVariables.loginModel!.token,
        "password": _neededVariables.pass,
        "cmpid": _neededVariables.loginModel!.cmpid,
        "brcode": _neededVariables.loginModel!.brcode,
      });
      staffNotificationModel = result;
      setBusy(false);
    } catch (e) {
      setBusy(false);
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
}

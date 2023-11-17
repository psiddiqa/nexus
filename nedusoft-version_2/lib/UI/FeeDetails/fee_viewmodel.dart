import 'dart:developer';
import 'package:nedusoft/models/student/fees_detail.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../core/API/api_service.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/services/needed_utils.dart';
import '../../app/app.router.dart';

class StudentFeesViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  // FeetypesList? selectFeeType;
  // List<FeetypesList> feeTypeList = [FeetypesList(feeTypeName: "-- SELECT --")];

  // TermsList? selectTerms;
  // List<TermsList> termsList = [TermsList(text: "-- SELECT --")];

  navigateToBack() {
    _navigationService.back();
  }

  navigateToReceiptscreen() async {
    // if (selectSectionValue!.text != "-- SELECT --" && selectExamMasterValue!.text != "-- SELECT --") {
    //   await getAllMarksList();

    _navigationService.navigateTo(
      Routes.studentFeesReceipts,
    );
    // } else {
    //   showCustomSnackbar(msg: "Please Select Required fields", type: SnackbarType.failure);
    // }
  }

  // changeFeeTypealue(FeetypesList val) async {
  //   selectFeeType = val;
  //   notifyListeners();
  //   if (selectFeeType != "-- SELECT --") {
  //     await feesDetails(selectTerms?.value?.toString() ?? "", selectFeeType!.feeTypeName!);
  //   }
  // }

  // changeTermsValue(TermsList val) async {
  //   selectTerms = val;
  //   notifyListeners();
  //   if (selectTerms != "-- SELECT --") {
  //     await feesDetails(selectTerms!.value!.toString(), selectFeeType?.feeTypeName ?? "");
  //   }
  // }

  StudentFeeModel? feesModel;
  // StudentFeesModel? feesTypeModel;

  init() async {
    setBusy(true);
    await getFeeDetails();
    notifyListeners();
    setBusy(false);
  }

  Future<void> getFeeDetails() async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");
      feesModel = await apiService.getStudentFee({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "Authentication": _neededVariables.loginModel!.authentication, "PersonId": _neededVariables.loginModel!.loginId, "CourseID": _neededVariables.loginModel!.courseId, "YearId": _neededVariables.loginModel!.yearId});
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }

  // Future<void> feesDetails(String type, String val) async {
  //   setBusy(true);
  //   try {
  //     final dio = locator<NeededVariables>().dio;
  //     String url = locator<NeededVariables>().getUrl;
  //     ApiService apiService = ApiService(dio, baseUrl: url);
  //     log(_neededVariables.loginModel!.toMap().toString(), name: "data");
  //     feesTypeModel = await apiService.getTermsFeesDetail({
  //       "LoginName": _neededVariables.loginModel!.fullName,
  //       "LoginId": _neededVariables.loginModel!.loginId,
  //       "token": _neededVariables.loginModel!.token,
  //       "password": _neededVariables.pass,
  //       "cmpid": _neededVariables.loginModel!.cmpid,
  //       "brcode": _neededVariables.loginModel!.brcode,
  //       "Authentication": _neededVariables.loginModel!.authentication,
  //       "PersonId": _neededVariables.loginModel!.loginId,
  //       "CourseID": _neededVariables.loginModel!.courseId,
  //       "YearId": _neededVariables.loginModel!.yearId,
  //       "Value": type,
  //       "Type": val,
  //     });
  //     feesModel!.feeList = feesTypeModel!.feeList;
  //     feesModel!.total = feesTypeModel!.total;
  //     feesModel!.totalpaid = feesTypeModel!.totalpaid;
  //     feesModel!.balance = feesTypeModel!.balance;
  //     notifyListeners();
  //     setBusy(false);
  //   } catch (e) {
  //     setBusy(false);
  //     log(e.toString());
  //   }
  // }
}

import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:nedusoft/app/app.router.dart';
import 'package:nedusoft/models/staff/get_faculty_videos.dart';
import 'package:nedusoft/models/staff/get_video_detail_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../Utils/custom_snackbar.dart';
import '../../../core/API/api_service.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/services/needed_utils.dart';
import '../../../main.dart';
import '../../../models/staff/get_publisher_model.dart';
import '../../../models/staff/get_video_detail_model.dart';

class StaffVideosViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();
  final _bottomSheetService = locator<BottomSheetService>();

  GetFacultyVideoModel? getFacultyVideoModel;
  GetPublisherModel? getpublisherModel;
  GetVideoDetailModel? getVideoDetailModel;

  List<ListElement>? searchList;

  bool search = false;
  TextEditingController searchController = TextEditingController();

  changeSearchOption(bool val) {
    search = val;
    notifyListeners();
  }

  void searchFun(String val) {
    searchList = getFacultyVideoModel!.list!.where((element) {
      final subject = element.subject!.toLowerCase();
      final input = val.toLowerCase();
      return subject.contains(input);
    }).toList();
    notifyListeners();
  }

  List<Cl> classList = [
    Cl(text: "-- SELECT --"),
  ];
  List<Cl> publisherList = [
    Cl(text: "-- SELECT --"),
  ];

  Cl? selectClassValue;
  Cl? selectPublisherValue;

  init() async {
    // await NativeFlutterDownloader.initialize();
    await getVideosList();
    await getPublisher();
    notifyListeners();
  }

  navigateToVideoDetail(ListElement element) {
    _navigationService.navigateTo(Routes.videoDetailScreen, arguments: VideoDetailScreenArguments(model: element));
  }

  navigateToEdit(String val) async {
    await videoDetail(val);
    _navigationService.navigateTo(Routes.addVideoScreen, arguments: AddVideoScreenArguments(videoDetail: getVideoDetailModel, edit: true));
  }

  navigateToAddScreen() {
    _navigationService.navigateTo(Routes.addVideoScreen, arguments: const AddVideoScreenArguments(videoDetail: null));
  }

  Future<File> loadPdfFromNetwork(String url) async {
    setBusy(true);
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    setBusy(false);
    return _storeFile(url, bytes);
  }

  Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    if (kDebugMode) {
      print('$file');
    }
    return file;
  }

  void openPdf(File file, String url, String name) {
    _navigationService.navigateTo(Routes.pdfViewer, arguments: PdfViewerArguments(file: file, url: url, fileName: name));
  }

  Future<void> getVideosList({String? classId, String? publisherId, bool filter = false}) async {
    try {
      setBusy(true);
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      getFacultyVideoModel = await apiService.getFacultyVideo(filter ? {"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "ClassId": classId, "publisher_id": publisherId} : {"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode});
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }

  Future<void> getPublisher() async {
    try {
      setBusy(true);
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      getpublisherModel = await apiService.getPublisher({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "PersonId": _neededVariables.loginModel!.personId, "Authentication": _neededVariables.loginModel!.authentication, "brcode": _neededVariables.loginModel!.brcode});
      if (getpublisherModel!.cls!.isNotEmpty && getpublisherModel!.publishers!.isNotEmpty) {
        classList.addAll(getpublisherModel!.cls!);
        publisherList.addAll(getpublisherModel!.publishers!);
      }
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }

  Future<void> publishVideo(String val, bool publishIt) async {
    try {
      setBusy(true);
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      final result = await apiService.publishVideo({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "PersonId": _neededVariables.loginModel!.personId, "Authentication": _neededVariables.loginModel!.authentication, "Value": val, "publish_it": publishIt, "brcode": _neededVariables.loginModel!.brcode});
      if (result.statusFlag == 1) {
        showCustomSnackbar(msg: result.statusMessage, type: SnackbarType.success);
        await getVideosList();
      }

      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }

  Future<void> videoDetail(String value) async {
    try {
      setBusy(true);
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      getVideoDetailModel = await apiService.videoDetail({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "PersonId": _neededVariables.loginModel!.personId, "Authentication": _neededVariables.loginModel!.authentication, "brcode": _neededVariables.loginModel!.brcode, "Value": value});
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }

  Future showBasicBottomSheet() async {
    await _bottomSheetService.showCustomSheet(
      data: {"classList": classList, "proList": publisherList},
      variant: BottomSheetType.filters,
      title: 'Filters',
      description: 'Use this bottom sheet function to show something to the user. It\'s better than the standard alert dialog in terms of UI quality.',
    ).then((value) async {
      log(value.toString());
      if (value != null) {
        selectClassValue = value.data["class"];
        selectPublisherValue = value.data["publisher"];
        // if (selectClassValue != null && selectPublisherValue != null) {
        await getVideosList(classId: selectClassValue == null ? null : selectClassValue!.value.toString(), publisherId: selectPublisherValue == null ? null : selectPublisherValue!.value.toString(), filter: true);
        // }
        notifyListeners();
      }
    });
  }
}

import 'dart:developer';
import 'dart:io';
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
import '../../models/student/student_learn_model.dart';

class ChapterVideoViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();
  final _bottomSheetService = locator<BottomSheetService>();

  ChapterVideosModel? chapterVideosModel;
  GetPublisherModel? getpublisherModel;
  SynopsisModel? synopsisModel;

  List<Cl> classList = [
    Cl(text: "-- SELECT --"),
  ];
  List<Cl> publisherList = [
    Cl(text: "-- SELECT --"),
  ];

  Cl? selectClassValue;
  Cl? selectPublisherValue;

  init(String chapterId) async {
    await getChapterVideo(chapterId);
    notifyListeners();
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

  navigateToVideo(String videoId) async {
    _navigationService.navigateTo(Routes.videoScreen, arguments: VideoScreenArguments(id: videoId));
  }

  Future<void> getChapterVideo(String chapterId) async {
    try {
      setBusy(true);
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      chapterVideosModel = await apiService.chaptervideos({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "Value": chapterId, "publisher_id": ""});
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }

  Future<void> getSynopsis(String valueId) async {
    try {
      setBusy(true);
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      synopsisModel = await apiService.getSynopsis({"Value": valueId});
      if (synopsisModel!.file != null) {
        final file = await loadPdfFromNetwork(synopsisModel!.file);
        openPdf(file, synopsisModel!.file, synopsisModel!.fileName);
      }
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }
}

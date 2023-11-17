import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/Utils/Colors.dart';
import 'package:nedusoft/Utils/custom_snackbar.dart';
import 'package:nedusoft/main.dart';
import 'package:permission_handler/permission_handler.dart';

class PdfViewer extends StatefulWidget {
  final File file;
  final String url;
  final String fileName;

  const PdfViewer({
    Key? key,
    required this.file,
    required this.url,
    required this.fileName,
  }) : super(key: key);

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  bool isLoading = false;
  String name = "";
  double per = 0.0;
  @override
  void initState() {
    super.initState();
    log(widget.fileName);
    setState(() {
      name = widget.fileName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      progressIndicator: CircularProgressIndicator(
        color: primaryColor,
        // value: per,
      ),
      opacity: 0.5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(name),
          actions: [
            IconButton(
              onPressed: () async {
                await saveFiles(widget.url, widget.fileName);
              },
              icon: Icon(
                Icons.download_rounded,
                color: WhiteColor,
              ),
            ),
          ],
        ),
        body: PDFView(
          filePath: widget.file.path,
        ),
      ),
    );
  }

  Future<bool> saveFiles(String url, String fileName) async {
    if (Platform.isIOS) {
      showCustomSnackbar(msg: 'please check in download folder', title: "Already Download");
      return true;
    } else {
      try {
        setState(() {
          isLoading = true;
        });

        File saveFile;
        saveFile = File("/storage/emulated/0/Download/$fileName");
        log(saveFile.path);
        if (saveFile.existsSync()) {
          setState(() {
            isLoading = false;
          });
          showCustomSnackbar(msg: 'please check in download folder', title: "Already Download");
        } else {
          log(saveFile.path);
          await Dio()
              .download(
            url,
            saveFile.path,
            onReceiveProgress: (count, total) {},
          )
              .then((value) {
            setState(() {
              isLoading = false;
            });
            showCustomSnackbar(msg: 'successfully saved to internal storage "Download" folder', title: "Download Successfully");
          });
        }
        // if (await _requestPermission(Permission.storage)) {
        //   Directory? directory;
        //   directory = await getExternalStorageDirectory();

        //   String newPath = "";
        //   List<String> paths = directory!.path.split("/");
        //   for (int x = 1; x < paths.length; x++) {
        //     String folder = paths[x];
        //     if (folder != "Android") {
        //       newPath += "/$folder";
        //     } else {
        //       newPath += "/Download";
        //       break;
        //     }
        //   }
        //   newPath = newPath;
        //   directory = Directory(newPath);
        //   // setState(() {});
        // }
        return true;
      } catch (e, s) {
        showCustomSnackbar(msg: e.toString(), title: s.toString(), type: SnackbarType.failure);
        setState(() {
          isLoading = false;
        });
        return false;
      }
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }
}

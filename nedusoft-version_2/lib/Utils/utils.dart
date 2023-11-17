import 'package:flutter/material.dart';

import 'package:logger/logger.dart';

abstract class AsfarUtils {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2, // number of method calls to be displayed
      errorMethodCount: 8, // number of method calls if stacktrace is provided
      lineLength: 80, // width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      printTime: true, // Should each log print contain a timestamp
    ),
  );
  static void printV(Object msg) {
    _logger.v(msg);
  }

  static void printD(Object msg) {
    _logger.d(msg);
  }

  static void printE(Object msg) {
    _logger.e(msg);
  }

  static void printI(Object msg) {
    _logger.i(msg);
  }

  static void printW(Object msg) {
    _logger.w(msg);
  }

  static void printWTF(Object msg) {
    _logger.wtf(msg);
  }
}

// String parseHtmlString(String? htmlString) {
//   final document = parse(htmlString);
//   final parsedString = parse(document.body!.text).documentElement!.text;
//   return parsedString;
// }

String attachQueryParametersToUrl(String url, Map<String, dynamic> params) {
  if (params.isNotEmpty) {
    final parameters = params.entries
        .map((e) => e.value == null ? '' : '${e.key}=${e.value}')
        .toList()
        .reduce((value, element) {
      if (value.isEmpty && element.isNotEmpty) {
        return element;
      } else if (value.isNotEmpty && element.isEmpty) {
        return value;
      } else if (value.isEmpty && element.isEmpty) {
        return '';
      } else {
        return '$element&$value';
      }
    });
    return Uri.encodeFull('$url?$parameters');
  } else {
    return Uri.encodeFull(url);
  }
}

class NoGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

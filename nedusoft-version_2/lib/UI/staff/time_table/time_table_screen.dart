import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/UI/staff/time_table/time_yable_view_model.dart';
import 'package:nedusoft/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../Utils/Colors.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/widget/common_app_bar.dart';
import '../../../models/staff/get_timetable_model.dart';

// class StaffTimeTable extends StatelessWidget {
//   StaffTimeTable({super.key});
//   CustomRenderMatcher tableMatcher() => (context) {
//         return context.tree.element?.localName == "table";
//       };

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder.reactive(
//         onViewModelReady: (model) async => await model.init(),
//         viewModelBuilder: () => StaffTimeTableViewModel(),
//         builder: (context, model, child) => LoadingOverlay(
//               isLoading: model.isBusy,
//               progressIndicator: const CircularProgressIndicator(
//                 color: Colors.white,
//               ),
//               opacity: 0.5,
//               child: Scaffold(
//                   appBar: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, 60), child: CommonAppBar("My Time Table")),
//                   backgroundColor: WhiteColor,
//                   body: SingleChildScrollView(
//                     child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
//                       const SizedBox(
//                         height: 12,
//                       ),
//                       model.tableModel == null
//                           ? SizedBox()
//                           : Row(
//                               children: [
//                                 Expanded(
//                                   child: Html(
//                                     shrinkWrap: true,
//                                     style: {
//                                       "table": Style(width: Width.auto(), height: Height.auto(), fontSize: FontSize(12)),
//                                       // some other granular customizations are also possible
//                                       "tr": Style(
//                                         alignment: Alignment.center,
//                                         border: const Border(bottom: BorderSide(color: Colors.black)),
//                                       ),
//                                       "th": Style(width: Width.auto(), height: Height.auto(), alignment: Alignment.center, border: const Border(bottom: BorderSide(color: Colors.black), right: BorderSide(color: Colors.black)), padding: EdgeInsets.all(6), backgroundColor: primaryColor, color: Colors.white, fontWeight: FontWeight.bold, fontSize: FontSize(13)),
//                                       "td": Style(
//                                         padding: const EdgeInsets.all(2),
//                                         alignment: Alignment.center,
//                                         border: const Border(bottom: BorderSide(color: Colors.black), right: BorderSide(color: Colors.black)),
//                                       ),
//                                     },
//                                     customRenders: {
//                                       tableMatcher(): CustomRender.widget(widget: (context, buildChildren) {
//                                         return Container(
//                                           key: context.key,
//                                           padding: context.style.padding,
//                                           alignment: context.style.alignment,
//                                           decoration: BoxDecoration(
//                                             color: context.style.backgroundColor,
//                                             border: context.style.border,
//                                           ),
//                                           child: LayoutBuilder(builder: (_, constraints) => _layoutCells(context, constraints)),
//                                         );
//                                       })
//                                     },
//                                     data: """${model.tableModel!.statusMessage}""",
//                                     onLinkTap: (url, _, __, ___) async {
//                                       print("Opening $url...");
//                                     },
//                                     onCssParseError: (css, messages) {
//                                       print("css that errored: $css");
//                                       print("error messages:");
//                                       messages.forEach((element) {
//                                         print(element);
//                                       });
//                                       return null;
//                                     },
//                                   ),
//                                 ),
//                               ],
//                             ),
//                     ]),
//                   )),
//             ));
//   }

//   Widget _layoutCells(RenderContext context, BoxConstraints constraints) {
//     final rows = <TableRowLayoutElement>[];
//     List<TrackSize> columnSizes = <TrackSize>[];
//     for (var child in context.tree.children) {
//       if (child is TableStyleElement) {
//         // Map <col> tags to predetermined column track sizes
//         columnSizes = child.children
//             .where((c) => c.name == "col")
//             .map((c) {
//               final span = int.tryParse(c.attributes["span"] ?? "1") ?? 1;
//               final colWidth = c.attributes["width"];
//               return List.generate(span, (index) {
//                 if (colWidth != null && colWidth.endsWith("%")) {
//                   if (!constraints.hasBoundedWidth) {
//                     // In a horizontally unbounded container; always wrap content instead of applying flex
//                     return IntrinsicContentTrackSize();
//                   }
//                   final percentageSize = double.tryParse(colWidth.substring(0, colWidth.length - 1));
//                   return percentageSize != null && !percentageSize.isNaN ? FlexibleTrackSize(percentageSize * 0.01) : IntrinsicContentTrackSize();
//                 } else if (colWidth != null) {
//                   final fixedPxSize = double.tryParse(colWidth);
//                   return fixedPxSize != null ? FixedTrackSize(fixedPxSize) : IntrinsicContentTrackSize();
//                 } else {
//                   return IntrinsicContentTrackSize();
//                 }
//               });
//             })
//             .expand((element) => element)
//             .toList(growable: false);
//       } else if (child is TableSectionLayoutElement) {
//         rows.addAll(child.children.whereType());
//       } else if (child is TableRowLayoutElement) {
//         rows.add(child);
//       }
//     }

//     // All table rows have a height intrinsic to their (spanned) contents
//     final rowSizes = List.generate(rows.length, (_) => IntrinsicContentTrackSize());

//     // Calculate column bounds
//     int columnMax = 0;
//     List<int> rowSpanOffsets = [];
//     for (final row in rows) {
//       final cols = row.children.whereType<TableCellElement>().fold(0, (int value, child) => value + child.colspan) + rowSpanOffsets.fold<int>(0, (int offset, child) => child);
//       columnMax = max(cols, columnMax);
//       rowSpanOffsets = [
//         ...rowSpanOffsets.map((value) => value - 1).where((value) => value > 0),
//         ...row.children.whereType<TableCellElement>().map((cell) => cell.rowspan - 1),
//       ];
//     }

//     // Place the cells in the rows/columns
//     final cells = <GridPlacement>[];
//     final columnRowOffset = List.generate(columnMax, (_) => 0);
//     final columnColspanOffset = List.generate(columnMax, (_) => 0);
//     int rowi = 0;
//     for (var row in rows) {
//       int columni = 0;
//       for (var child in row.children) {
//         if (columni > columnMax - 1) {
//           break;
//         }
//         if (child is TableCellElement) {
//           while (columnRowOffset[columni] > 0) {
//             columnRowOffset[columni] = columnRowOffset[columni] - 1;
//             columni += columnColspanOffset[columni].clamp(1, columnMax - columni - 1);
//           }
//           cells.add(GridPlacement(
//             columnStart: columni,
//             columnSpan: min(child.colspan, columnMax - columni),
//             rowStart: rowi,
//             rowSpan: min(child.rowspan, rows.length - rowi),
//             child: Container(
//               width: 90,
//               height: 90,
//               // height: 50,
//               padding: child.style.padding?.nonNegative ?? row.style.padding?.nonNegative,
//               decoration: BoxDecoration(
//                 color: child.style.backgroundColor ?? row.style.backgroundColor,
//                 border: child.style.border ?? row.style.border,
//               ),
//               child: SizedBox.expand(
//                 child: Container(
//                   alignment: child.style.alignment ?? context.style.alignment ?? Alignment.centerLeft,
//                   child: StyledText(
//                     textSpan: context.parser.parseTree(context, child),
//                     style: child.style,
//                     renderContext: context,
//                   ),
//                 ),
//               ),
//             ),
//           ));
//           columnRowOffset[columni] = child.rowspan - 1;
//           columnColspanOffset[columni] = child.colspan;
//           columni += child.colspan;
//         }
//       }
//       while (columni < columnRowOffset.length) {
//         columnRowOffset[columni] = columnRowOffset[columni] - 1;
//         columni++;
//       }
//       rowi++;
//     }

//     // Create column tracks (insofar there were no colgroups that already defined them)
//     List<TrackSize> finalColumnSizes = columnSizes.take(columnMax).toList();
//     finalColumnSizes += List.generate(max(0, columnMax - finalColumnSizes.length), (_) => IntrinsicContentTrackSize());

//     if (finalColumnSizes.isEmpty || rowSizes.isEmpty) {
//       // No actual cells to show
//       return SizedBox();
//     }

//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: LayoutGrid(
//         gridFit: GridFit.loose,
//         columnSizes: finalColumnSizes,
//         rowSizes: rowSizes,
//         children: cells,
//       ),
//     );
//   }
// }

// class StyledText extends StatelessWidget {
//   InlineSpan? textSpan;
//   Style? style;
//   double? textScaleFactor;
//   RenderContext? renderContext;

//   StyledText({
//     this.textSpan,
//     this.style,
//     this.textScaleFactor = 1.0,
//     this.renderContext,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: calculateWidth(Display.inlineBlock, renderContext!),
//       child: Text.rich(
//         textSpan!,
//         style: style!.generateTextStyle(),
//         textAlign: style!.textAlign,
//         textDirection: style!.direction,
//         textScaleFactor: textScaleFactor,
//       ),
//     );
//   }

//   double calculateWidth(Display display, RenderContext context) {
//     if ((display == Display.block || display == Display.listItem) && !renderContext!.parser.shrinkWrap) {
//       return double.infinity;
//     }
//     if (renderContext!.parser.shrinkWrap) {
//       return MediaQuery.of(context.buildContext).size.width;
//     }
//     return 0.0;
//   }
// }

class StaffTimeTable extends StatelessWidget {
  StaffTimeTable({super.key});
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => StaffTimeTableViewModel(),
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
                                            _navigationService.navigateTo(Routes.buildClasses, arguments: BuildClassesArguments(heading: model.getFacultyTimeTableModel!.days![index].day!, schedulesList: model.getFacultyTimeTableModel!.days![index].schedules!, today: model.getFacultyTimeTableModel!.days![index].day! == DateFormat('EEEE').format(DateTime.now()) ? true : false));
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

class BuildClasses extends StatelessWidget {
  String heading;
  List<Schedule> schedulesList;
  bool today;
  BuildClasses({required this.heading, required this.schedulesList, required this.today});
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
                        // Row(
                        //   children: <Widget>[
                        //     Icon(
                        //       Icons.person,
                        //       color: c.isPassed ? primaryColor.withOpacity(0.4) : primaryColor,
                        //       size: 20.0,
                        //     ),
                        //     const SizedBox(width: 8.0),
                        //     Text(
                        //       c.faculty!,
                        //       style: TextStyle(
                        //         color: c.isPassed ? const Color(0xFF6C7174).withOpacity(0.3) : const Color(0xFF6C7174),
                        //         fontSize: 15.0,
                        //         fontWeight: FontWeight.w600,
                        //       ),
                        //     ),
                        //   ],
                        // ),
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
    log(now.difference(finishedTime).inMinutes.toString());
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

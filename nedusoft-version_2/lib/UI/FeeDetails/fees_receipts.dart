// ignore_for_file: file_names, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:nedusoft/Utils/Colors.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/core/widget/text_widget.dart';
import 'package:nedusoft/models/student/on_page_receipts_mode.dart';
import 'package:stacked/stacked.dart';
import 'fees_receipts_view_model.dart';

class StudentFeesReceipts extends StatelessWidget {
  const StudentFeesReceipts({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) => viewModel.init(),
        viewModelBuilder: () => StudentFeesReceiptsViewModel(),
        builder: (context, model, child) => LoadingOverlay(
              isLoading: model.isBusy,
              progressIndicator: const CircularProgressIndicator(
                color: Colors.white,
              ),
              opacity: 0.5,
              child: Scaffold(
                  appBar: PreferredSize(
                      preferredSize: Size(MediaQuery.sizeOf(context).width, 60),
                      child: AppBar(
                        backgroundColor: primaryColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(24),
                          ),
                        ),
                        title: Text(
                          "Fee Receipts",
                          style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: WhiteColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )),
                  backgroundColor: WhiteColor,
                  body: SingleChildScrollView(
                    child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                      SizedBox(height: Get.height * 0.012),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 16,
                            ),
                            CommonRequiedTextWidget(text: "Year"),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.sizeOf(context).width,
                              margin: EdgeInsets.only(right: 12),
                              padding: EdgeInsets.only(left: 4),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: WhiteColor, border: Border.all(color: secondryColor)),
                              child: Center(
                                child: DropdownButton(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  borderRadius: BorderRadius.circular(10),
                                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                                  iconSize: 20,
                                  isExpanded: true,
                                  underline: const SizedBox(),
                                  value: model.selectYear ?? model.yearList[0],
                                  onChanged: (newvalue) {
                                    model.changeFeeTypealue(newvalue as Year);
                                  },
                                  items: model.yearList.map((Year valueItem) {
                                    return DropdownMenuItem<Year>(
                                      value: valueItem,
                                      child: Text(valueItem.text!, style: TextStyle(color: BlackColor, fontFamily: 'Gilroy Medium', fontSize: 16)),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                              decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.15,
                                    child: Text("Date", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.18,
                                    child: Text("Rcpt No", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.17,
                                    child: Text("Amount", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.2,
                                    child: Text("Download", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor)),
                                  ),
                                ],
                              ),
                            ),
                            model.onPageReceiptsModel == null
                                ? const SizedBox()
                                : ListView.separated(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: model.onPageReceiptsModel!.list!.length,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        // crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: Get.width * 0.17,
                                            child: Text(DateFormat.yMMMMd().format(model.onPageReceiptsModel!.list![index].fDate!), textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.15,
                                            child: Text(model.onPageReceiptsModel!.list![index].frNo.toString() ?? "",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: "Gilroy Medium",
                                                  color: BlackColor,
                                                )),
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.17,
                                            child: Text(model.onPageReceiptsModel!.list![index].fPaid.toString() ?? "", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor)),
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.25,
                                            child: InkWell(
                                              onTap: () {
                                                model.downloadReceipts(model.onPageReceiptsModel!.list![index].fId);
                                              },
                                              child: Icon(
                                                Icons.download,
                                                color: primaryColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 18),
                                        child: Divider(
                                          color: secondryColor,
                                        ),
                                      );
                                    },
                                  )
                          ],
                        ),
                      ),
                    ]),
                  )),
            ));
  }
}

// ignore_for_file: file_names, prefer_const_constructors
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:nedusoft/Utils/Colors.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/core/widget/text_widget.dart';
import 'package:nedusoft/models/student/fees_detail.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../core/widget/common_app_bar.dart';
import '../../app/app.router.dart';
import '../../core/service_locator/service_locator.dart';
import '../../core/services/needed_utils.dart';
import '../staff/marks/add_marks.dart';
import 'fee_viewmodel.dart';

class StudentFeesDetail extends StatelessWidget {
  const StudentFeesDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) => viewModel.init(),
        viewModelBuilder: () => StudentFeesViewModel(),
        builder: (context, model, child) => LoadingOverlay(
              isLoading: model.isBusy,
              progressIndicator: const CircularProgressIndicator(
                color: Colors.white,
              ),
              opacity: 0.5,
              child: model.feesModel == null
                  ? Scaffold(
                      backgroundColor: Colors.white,
                    )
                  : DefaultTabController(
                      length: model.feesModel?.feetypes?.length ?? 1,
                      child: Scaffold(
                          appBar: PreferredSize(
                              preferredSize: Size(MediaQuery.sizeOf(context).width, 90),
                              child: AppBar(
                                backgroundColor: primaryColor,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(24),
                                  ),
                                ),
                                bottom: TabBar(
                                    onTap: (val) async {
                                      // await viewmodel.getFamiltInfo();
                                    },
                                    indicatorWeight: 2,
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Gilroy Bold",
                                    ),
                                    indicatorPadding: EdgeInsets.symmetric(horizontal: 18),
                                    indicatorColor: secondryColor,
                                    tabs: List.generate(
                                      model.feesModel?.feetypes?.length ?? 1,
                                      (index) => Tab(text: model.feesModel?.feetypes?[index].feeType ?? ""),
                                    )),
                                actions: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12, top: 16),
                                    child: InkWell(
                                      onTap: () {
                                        model.navigateToReceiptscreen();
                                      },
                                      child: Text(
                                        "Fee Receipts",
                                        style: TextStyle(fontSize: 12, fontFamily: "Gilroy Medium", color: WhiteColor),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                                title: Text(
                                  "Fee Details",
                                  style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: WhiteColor),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )),
                          backgroundColor: WhiteColor,
                          body: TabBarView(
                            children: List.generate(
                              model.feesModel?.feetypes?.length ?? 1,
                              (index) => SingleChildScrollView(
                                child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  SizedBox(height: Get.height * 0.012),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: List.generate(
                                            model.feesModel!.feetypes![index].terms!.length,
                                            (idx) => FeeCardWidget(
                                                  desc: model.feesModel?.feetypes![index].terms?[idx].descs ?? [],
                                                  termName: model.feesModel!.feetypes![index].terms![idx].term ?? "",
                                                  date: "14 Sept",
                                                  paidAmount: model.feesModel!.feetypes?[index].terms?[idx].paid.toString() ?? "",
                                                  totalFee: model.feesModel!.feetypes?[index].terms?[idx].total.toString() ?? "",
                                                  balanceFee: model.feesModel!.feetypes?[index].terms?[idx].balance.toString() ?? "",
                                                  fine: model.feesModel!.feetypes?[index].terms?[idx].fine.toString() ?? "",
                                                  discount: model.feesModel!.feetypes?[index].terms?[idx].discount.toString() ?? "",
                                                  feeId: model.feesModel!.feetypes?[index].terms?[idx].feeId ?? 0,
                                                ))),
                                  ),
                                ]),
                              ),
                            ),
                          )),
                    ),
            ));
  }
}

class FeeCardWidget extends StatelessWidget {
  String termName;
  String date;
  String paidAmount;
  String totalFee;
  String balanceFee;
  String fine;
  String discount;
  int feeId;
  List<Desc> desc;

  FeeCardWidget({
    required this.balanceFee,
    required this.date,
    required this.discount,
    required this.fine,
    required this.paidAmount,
    required this.termName,
    required this.totalFee,
    required this.desc,
    required this.feeId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(8),
          // height: 95,
          width: MediaQuery.sizeOf(context).width,
          color: primaryColor.withOpacity(0.15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    termName,
                    style: TextStyle(fontSize: 16, fontFamily: "Gilroy Medium", color: secondryColor),
                  ),
                  Text(
                    date,
                    style: TextStyle(fontSize: 12, fontFamily: "Gilroy Medium", color: secondryColor),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    // ignore: unrelated_type_equality_checks
                    balanceFee == "0.0" ? "₹ $paidAmount" : "₹ $balanceFee",
                    style: TextStyle(fontSize: 22, fontFamily: "Gilroy Bold", color: BlackColor),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      balanceFee == "0.0" ? "Paid" : "Unpaid",
                      style: TextStyle(fontSize: 12, fontFamily: "Gilroy Bold", color: WhiteColor),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Fee",
                    style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: BlackColor),
                  ),
                  Text(
                    "₹ $totalFee",
                    style: TextStyle(fontSize: 16, fontFamily: "Gilroy Medium", color: BlackColor),
                  ),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Paid Fee",
                    style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: BlackColor),
                  ),
                  Text(
                    " ₹ $paidAmount",
                    style: TextStyle(fontSize: 16, fontFamily: "Gilroy Medium", color: BlackColor),
                  ),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Fine",
                    style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: BlackColor),
                  ),
                  Text(
                    "₹ $fine",
                    style: TextStyle(fontSize: 16, fontFamily: "Gilroy Medium", color: BlackColor),
                  ),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discount",
                    style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: BlackColor),
                  ),
                  Text(
                    "- ₹ $discount",
                    style: TextStyle(fontSize: 16, fontFamily: "Gilroy Medium", color: BlackColor),
                  ),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Divider(
                color: Colors.grey,
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Balance Fee",
                    style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: BlackColor),
                  ),
                  Text(
                    "₹ $balanceFee",
                    style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: BlackColor),
                  ),
                ],
              ),
              balanceFee == "0.0"
                  ? SizedBox()
                  : SizedBox(
                      height: 16,
                    ),
              balanceFee == "0.0"
                  ? SizedBox()
                  : InkWell(
                      onTap: () {
                        showModalBottomSheet<dynamic>(
                          isScrollControlled: true,
                          useRootNavigator: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) {
                            return PayScreen(
                              desc: desc,
                              feeId: feeId.toString(),
                              totalAmount: totalFee,
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(24)),
                        child: Center(
                          child: Text(
                            "Click to Pay",
                            style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: WhiteColor),
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class PayScreenViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  List<String> feeDesc = [];

  addFeeDesc(String val) {
    feeDesc.add(val);
    notifyListeners();
  }

  subFeeDesc(String val) {
    feeDesc.remove(val);
    notifyListeners();
  }

  double totalPay = 0;
  addTotalPay(double val) {
    totalPay = totalPay + val;
    notifyListeners();
  }

  subTotalPay(double val) {
    totalPay = totalPay - val;
    notifyListeners();
  }

  navigatetowebViewScreen(String feesId, String totalAmount) {
    String feeDes = feeDesc.join(":");
    var url = "${_neededVariables.webUrl}AcademicMaster/StudentAppPaymentPage?std_id=${_neededVariables.loginModel!.loginId}&fee_id=$feesId&fee_desc=$feeDes&amt=${totalPay.toInt()}&cmp_id=${_neededVariables.loginModel!.cmpid}&brcode=${_neededVariables.loginModel!.brcode}";

    log(url);
    _navigationService.navigateTo(Routes.webviewScreen, arguments: WebviewScreenArguments(url: url));
  }
}

class PayScreen extends StatelessWidget {
  List<Desc> desc;
  String feeId;
  String totalAmount;
  PayScreen({required this.desc, required this.feeId, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => PayScreenViewModel(),
        builder: (context, viewModel, child) => Container(
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(
                            height: 16,
                          ),
                          Center(
                              child: Container(
                            width: 45,
                            height: 6,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          )),
                          const SizedBox(
                            height: 8,
                          )
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.arrow_back),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Payment",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: BlackColor, fontFamily: 'sfSemibold'),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.close, color: Colors.black, size: 30),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Column(
                    children: List.generate(
                      desc.length,
                      (index) {
                        return PayCardWidget(
                          desc: desc[index],
                          model: viewModel,
                          adsorb: desc[index].bal == 0.0 ? true : false,
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x1C000000),
                          blurRadius: 4,
                          offset: Offset(0, -4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Payable',
                                style: TextStyle(fontSize: 16, fontFamily: "Gilroy Medium", color: BlackColor, height: 1.58),
                              ),
                              // const SizedBox(height: 10),
                              Text(
                                '₹ ${viewModel.totalPay}',
                                style: TextStyle(fontSize: 16, fontFamily: "Gilroy Medium", color: BlackColor, height: 1.58),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              if (viewModel.totalPay != 0.0) {
                                Navigator.pop(context);
                                viewModel.navigatetowebViewScreen(feeId, totalAmount);
                              }
                            },
                            child: Container(
                              width: 193,
                              height: 43,
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                              decoration: ShapeDecoration(
                                color: viewModel.totalPay == 0.0 ? Colors.grey : primaryColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Center(
                                child: Text(
                                  "Pay Now",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: WhiteColor),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}

class PayCardWidget extends StatefulWidget {
  PayCardWidget({
    super.key,
    required this.desc,
    required this.model,
    this.adsorb = false,
  });

  Desc desc;
  bool adsorb;
  PayScreenViewModel model;

  @override
  State<PayCardWidget> createState() => _PayCardWidgetState();
}

class _PayCardWidgetState extends State<PayCardWidget> {
  bool check = false;
  bool close = false;
  TextEditingController marks = TextEditingController();

  @override
  void initState() {
    marks.text = widget.desc.bal.toString() ?? "0.0";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.adsorb,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(color: widget.desc.bal == 0.0 ? Colors.grey.withOpacity(0.5) : WhiteColor, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey, width: 0.5)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: check,
                      activeColor: primaryColor,
                      onChanged: (onChanged) {
                        if (onChanged!) {
                          widget.model.addTotalPay(double.parse(marks.text));
                          widget.model.addFeeDesc("${widget.desc.descId}-${marks.text}-${widget.desc.total}");
                        } else {
                          widget.model.subTotalPay(double.parse(marks.text));
                          widget.model.subFeeDesc("${widget.desc.descId}-${marks.text}-${widget.desc.total}");
                        }
                        setState(() {
                          check = !check;
                        });
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    Text(
                      widget.desc.desc ?? "",
                      style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: BlackColor),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  height: 35,
                  child: TextField(
                    controller: marks,
                    onChanged: (value) {},
                    readOnly: check,
                    decoration: InputDecoration(
                      // isDense: true,

                      prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "₹",
                          style: TextStyle(fontSize: 20, fontFamily: "Gilroy Bold", color: BlackColor),
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor, width: 1.0),
                      ),
                      hintText: 'Enter Amount',
                      hintStyle: TextStyle(fontSize: 12, fontFamily: "Gilroy Regular", color: BlackColor),
                    ),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      // FilteringTextInputFormatter.digitsOnly,
                      DecimalTextInputFormatter(decimalRange: 2),
                    ], // Only numbers can be entered
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Detail",
                    style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: BlackColor.withOpacity(0.5)),
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          close = !close;
                        });
                      },
                      child: close ? Icon(Icons.expand_more, color: BlackColor.withOpacity(0.5)) : Icon(Icons.expand_less, color: BlackColor.withOpacity(0.5)))
                ],
              ),
            ),
            close
                ? Divider(
                    color: BlackColor.withOpacity(0.7),
                  )
                : SizedBox(),
            close
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: BlackColor.withOpacity(0.8)),
                              ),
                              Text(
                                "₹ ${widget.desc.total}",
                                style: TextStyle(fontSize: 16, fontFamily: "Gilroy Medium", color: BlackColor.withOpacity(0.8)),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: secondryColor.withOpacity(0.8),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Cons",
                                style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: BlackColor.withOpacity(0.8)),
                              ),
                              Text(
                                "-₹ ${widget.desc.cons}",
                                style: TextStyle(fontSize: 16, fontFamily: "Gilroy Medium", color: primaryColor.withOpacity(0.8)),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: secondryColor.withOpacity(0.8),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Paid",
                                style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: BlackColor.withOpacity(0.8)),
                              ),
                              Text(
                                "₹ ${widget.desc.paid}",
                                style: TextStyle(fontSize: 16, fontFamily: "Gilroy Medium", color: BlackColor.withOpacity(0.8)),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: secondryColor.withOpacity(0.8),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Balance",
                                style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: BlackColor.withOpacity(0.8)),
                              ),
                              Text(
                                "₹ ${widget.desc.bal}",
                                style: TextStyle(fontSize: 16, fontFamily: "Gilroy Medium", color: BlackColor.withOpacity(0.8)),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: secondryColor.withOpacity(0.8),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Due Date",
                                style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: BlackColor.withOpacity(0.8)),
                              ),
                              Text(
                                widget.desc.dueDate == null ? "" : DateFormat("dd-MM-yyyy").format(DateTime.parse(widget.desc.dueDate)),
                                style: TextStyle(fontSize: 16, fontFamily: "Gilroy Medium", color: BlackColor.withOpacity(0.8)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nedusoft/models/staff/get_publisher_model.dart';
import 'package:stacked_services/stacked_services.dart';
import '../core/widget/text_widget.dart';
import 'Colors.dart';

class FiltersBoxBottomSheet extends StatefulWidget {
  final SheetRequest? request;
  final Function(SheetResponse)? completer;
  const FiltersBoxBottomSheet({
    this.request,
    this.completer,
  });

  @override
  State<FiltersBoxBottomSheet> createState() => _FiltersBoxBottomSheetState();
}

class _FiltersBoxBottomSheetState extends State<FiltersBoxBottomSheet> {
  List<Cl> classList = [];
  Cl? selectClassValue;

  List<Cl> professionalList = [];
  Cl? selectProValue;

  @override
  void initState() {
    classList = widget.request!.data["classList"];
    professionalList = widget.request!.data["proList"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 5, bottom: 30),
      decoration: BoxDecoration(color: WhiteColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: Text(
            widget.request!.title!,
            style: TextStyle(fontSize: 24, fontFamily: "Gilroy Bold", color: BlackColor),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        CommonRequiedTextWidget(
          text: "Class",
        ),
        const SizedBox(
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
              value: selectClassValue ?? classList[0],
              onChanged: (newvalue) {
                setState(() {
                  selectClassValue = newvalue;
                });
              },
              items: classList.map((Cl valueItem) {
                return DropdownMenuItem<Cl>(
                  value: valueItem,
                  child: Text(valueItem.text!, style: TextStyle(color: BlackColor, fontFamily: 'Gilroy Medium', fontSize: 16)),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        CommonRequiedTextWidget(
          text: "Publisher",
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          width: MediaQuery.sizeOf(context).width,
          margin: EdgeInsets.only(right: 12),
          padding: EdgeInsets.only(left: 4),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: WhiteColor, border: Border.all(color: secondryColor)),
          child: DropdownButton(
            padding: EdgeInsets.symmetric(horizontal: 10),
            borderRadius: BorderRadius.circular(10),
            icon: const Icon(Icons.keyboard_arrow_down_outlined),
            iconSize: 20,
            isExpanded: true,
            underline: const SizedBox(),
            value: selectProValue ?? professionalList[0],
            onChanged: (newvalue) {
              setState(() {
                selectProValue = newvalue;
              });
            },
            items: professionalList.map((Cl valueItem) {
              return DropdownMenuItem<Cl>(
                value: valueItem,
                child: Text(valueItem.text!, style: TextStyle(color: BlackColor, fontFamily: 'Gilroy Medium', fontSize: 16)),
              );
            }).toList(),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        InkWell(
          // onTap: ontap,
          onTap: () async {
            widget.completer!(SheetResponse(data: {
              "class": selectClassValue,
              "publisher": selectProValue,
            }));
          },
          child: Container(
              height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: selectClassValue == null && selectProValue == null ? Colors.grey : primaryColor),
              child: Center(
                child: Text("Search", style: TextStyle(color: WhiteColor, fontSize: 19, fontFamily: "Gilroy Bold")),
              )),
        ),
      ]),
    );
  }
}

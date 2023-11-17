// // ignore_for_file: file_names, prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
 
// import 'package:nedusoft/Utils/Colors.dart';
// import 'package:nedusoft/Utils/Custom_widegt.dart';

// import 'Generate_otp.dart';

// class Forgotpassword extends StatefulWidget {
//   const Forgotpassword({super.key});

//   @override
//   State<Forgotpassword> createState() => _ForgotpasswordState();
// }

// class _ForgotpasswordState extends State<Forgotpassword> {
//   final mobile = TextEditingController();
//   List listitem = [
//     '+91',
//     '+41',
//     '+81',
//     '+1',
//   ];
//   String? selectarrive = '+91';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: WhiteColor,
//       body: SingleChildScrollView(
//         child: Stack(children: [
//           Image.asset("assets/bg.png",
//               width: double.infinity,
//               height: Get.height * 0.5,
//               fit: BoxFit.cover),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: Get.height * 0.4),
//                 Center(
//                     child: Text("Forgot Password",
//                         style: TextStyle(
//                             fontSize: 34,
//                             fontFamily: "Gilroy Medium",
//                             color: WhiteColor))),
//                 SizedBox(height: Get.height * 0.06),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text("Phone Number",
//                         style: TextStyle(
//                             fontSize: 18, fontFamily: "Gilroy Medium")),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           height: 50,
//                           width: 50,
//                           padding: EdgeInsets.only(left: 4),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               color: greycolor.withOpacity(0.2)),
//                           child: Center(
//                             child: DropdownButton(
//                               borderRadius: BorderRadius.circular(10),
//                               icon: const Icon(
//                                   Icons.keyboard_arrow_down_outlined),
//                               iconSize: 20,
//                               // isExpanded: true,
//                               underline: const SizedBox(),
//                               value: selectarrive,
//                               onChanged: (newvalue) {
//                                 setState(() {
//                                   selectarrive = newvalue as String?;
//                                 });
//                               },
//                               items: listitem.map((valueItem) {
//                                 return DropdownMenuItem(
//                                   value: valueItem,
//                                   child: Text(valueItem,
//                                       style: TextStyle(
//                                           color: BlackColor,
//                                           fontFamily: 'Gilroy Bold',
//                                           fontSize: 16)),
//                                 );
//                               }).toList(),
//                             ),
//                           ),
//                         ),
//                         textfield(
//                           hinttext: "9876543210",
//                           Width: Get.width * 0.78,
//                           controller: mobile,
//                           obscureText: false,
//                           ontap: () {},
//                         )
//                       ],
//                     ),
//                     SizedBox(height: Get.height * 0.25),
//                     AppButton(
//                       buttonText: "Generate OTP",
//                       ontap: () {
//                         Get.to(() => GenerateOtp());
//                       },
//                     ),
//                     SizedBox(height: Get.height * 0.02),
//                     Center(
//                       child: InkWell(
//                         onTap: () {
//                           Get.to(() => Forgotpassword());
//                         },
//                         child: Text("Cancle",
//                             style: TextStyle(
//                                 fontSize: 18,
//                                 fontFamily: "Gilroy Medium",
//                                 color: pinkcolor)),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }

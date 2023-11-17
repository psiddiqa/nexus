// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
 
// import 'package:pinput/pinput.dart';
// import 'package:nedusoft/Utils/Colors.dart';
// import 'package:nedusoft/Utils/Custom_widegt.dart';

// import 'New_password.dart';

// class GenerateOtp extends StatefulWidget {
//   const GenerateOtp({super.key});

//   @override
//   State<GenerateOtp> createState() => _GenerateOtpState();
// }

// class _GenerateOtpState extends State<GenerateOtp> {
//   final defaultPinTheme = PinTheme(
//     width: 56,
//     height: 56,
//     textStyle:
//         TextStyle(fontSize: 20, color: BlackColor, fontFamily: "Gilroy Bold"),
//     decoration: BoxDecoration(
//       color: boxcolor,
//       borderRadius: BorderRadius.circular(10),
//     ),
//   );
//   final pinController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: WhiteColor,
//       body: SingleChildScrollView(
//         child: Stack(children: [
//           Image.asset(
//             "assets/bg.png",
//             width: double.infinity,
//             height: Get.height * 0.5,
//             fit: BoxFit.cover,
//           ),
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
//                     const Text("Enter OTP",
//                         style: TextStyle(
//                             fontSize: 18, fontFamily: "Gilroy Medium")),
//                     SizedBox(height: Get.height * 0.02),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 12),
//                       child: Pinput(
//                         length: 5,
//                         controller: pinController,
//                         // submittedPinTheme: ,
//                         // onSubmitted: ,
//                         defaultPinTheme: defaultPinTheme,
//                         errorText: 'Wrong otp',
//                       ),
//                     ),
//                     SizedBox(height: Get.height * 0.02),
//                     Text("Send Again",
//                         style: TextStyle(
//                             fontSize: 18,
//                             fontFamily: "Gilroy Medium",
//                             color: pinkcolor)),
//                     SizedBox(height: Get.height * 0.2),
//                     AppButton(
//                       buttonText: "Verify",
//                       ontap: () {
//                         Get.to(() => const Newpassword());
//                       },
//                     ),
//                     SizedBox(height: Get.height * 0.02),
//                     Center(
//                       child: InkWell(
//                         onTap: () {
//                           // Get.to(() => const Newpassword());
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

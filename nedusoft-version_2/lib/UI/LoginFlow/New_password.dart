// // ignore_for_file: file_names, prefer_const_constructors
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
 
// import 'package:nedusoft/Utils/Colors.dart';
// import 'package:nedusoft/Utils/Custom_widegt.dart';

// import 'Forgot_password.dart';
// import 'Sign_in.dart';

// class Newpassword extends StatefulWidget {
//   const Newpassword({super.key});

//   @override
//   State<Newpassword> createState() => _NewpasswordState();
// }

// class _NewpasswordState extends State<Newpassword> {
//   final mobile = TextEditingController();
//   final password = TextEditingController();
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
//                     child: Text("Sign In",
//                         style: TextStyle(
//                             fontSize: 34,
//                             fontFamily: "Gilroy Medium",
//                             color: WhiteColor))),
//                 SizedBox(height: Get.height * 0.05),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: Get.height * 0.03),
//                     const Text("Create New Password",
//                         style: TextStyle(
//                             fontSize: 18, fontFamily: "Gilroy Medium")),
//                     textfield(
//                         hinttext: "*************",
//                         Width: Get.width * 0.91,
//                         controller: mobile,
//                         obscureText: true,
//                         ontap: () {}),
//                     SizedBox(height: Get.height * 0.03),
//                     const Text("Confirm New Password",
//                         style: TextStyle(
//                             fontSize: 18, fontFamily: "Gilroy Medium")),
//                     textfield(
//                         hinttext: "*************",
//                         Width: Get.width * 0.91,
//                         controller: password,
//                         obscureText: true,
//                         ontap: () {}),
//                     SizedBox(height: Get.height * 0.12),
//                     AppButton(
//                       buttonText: "Verify",
//                       ontap: () {
//                         // Get.to(() => Signin());
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

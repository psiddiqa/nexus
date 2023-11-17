// // ignore_for_file: file_names, sized_box_for_whitespace

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nedusoft/UI/Menu/dashbord_view_model.dart';

// import 'package:nedusoft/Utils/Colors.dart';
// import 'package:nedusoft/Utils/Custom_widegt.dart';
// import 'package:loading_overlay/loading_overlay.dart';
// import 'package:stacked/stacked.dart';

// import '../lesson_update/lesson_update.dart';
// import 'Menu.dart';
// import 'Profile.dart';

// class Deshboard extends StatelessWidget {
//   const Deshboard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder.reactive(
//         onViewModelReady: (viewModel) => viewModel.init(),
//         viewModelBuilder: () => DashBoardViewModel(),
//         builder: (context, model, child) => LoadingOverlay(
//               isLoading: model.isBusy,
//               progressIndicator: const CircularProgressIndicator(
//                 color: Colors.white,
//               ),
//               opacity: 0.5,
//               child: Scaffold(
                
//                 backgroundColor: WhiteColor,
//                 body: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Stack(
//                       children: [
//                         // Image.asset("assets/appbgg.png"),
//                         Container(
//                           height: 110,
//                           decoration: BoxDecoration(color: Color(0xFF52AB8E),borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24),bottomRight: Radius.circular(24))),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(
//                                 children: [
//                                   InkWell(
//                                       onTap: () {
//                                         model.navigateToMENU();
//                                       },
//                                       child: Image.asset("assets/dot.png", height: 27)),
//                                   SizedBox(width: Get.width * 0.08),
//                                   Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(model.userPerIndoModel?.studentName ?? "", style: TextStyle(fontSize: 18, fontFamily: "Gilroy Bold", color: WhiteColor)),
//                                       Text(model.userPerIndoModel?.semester ?? "", style: TextStyle(fontSize: 16, fontFamily: "Gilroy Medium", color: WhiteColor)),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   InkWell(
//                                     onTap: () {
//                                       model.navigateToProfile();
//                                     },
//                                     child: Stack(
//                                       children: [
//                                         CircleAvatar(
//                                             radius: 23,
//                                             // backgroundColor: Colors.black,
//                                             backgroundImage: MemoryImage(
//                                               model.bytesImage!,
//                                             )),
//                                         Positioned(
//                                           right: 0,
//                                           child: CircleAvatar(
//                                             radius: 6,
//                                             backgroundColor: RedColor,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(height: Get.height * 0.01),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 14),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text("Notice Board", style: TextStyle(fontSize: 16, fontFamily: "Gilroy Medium", color: Color(0xFF301A4B))),
//                           InkWell(
//                             onTap: () {
//                               Get.to(() => const LessonUpdateScreen());
//                             },
//                             child: Text("View All", style: TextStyle(fontSize: 16, fontFamily: "Gilroy Medium", color: darkpurple)),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: SingleChildScrollView(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(height: Get.height * 0.01),
//                             SizedBox(height: 200, child: noticebord()),
//                             SizedBox(height: Get.height * 0.02),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 12),
//                               child: Text("Homework", style: TextStyle(fontSize: 16, fontFamily: "Gilroy Medium", color: Color(0xFF1a5e63))),
//                             ),
//                             SizedBox(height: Get.height * 0.01),
//                             homeworklist()
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ));
//   }

//   noticebord() {
//     return ListView.builder(
//       scrollDirection: Axis.horizontal,
//       itemCount: noticboard.length,
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       itemBuilder: (BuildContext context, int index) {
//         return InkWell(
//           onTap: () {
//             Get.to(() => const LessonUpdateScreen());
//           },
//           child: Container(
//             margin: const EdgeInsets.symmetric(horizontal: 6),
//             padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
//             width: Get.width * 0.50,
//             decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: boxshadow.withOpacity(0.5), border: Border.all(color: Darkblue)),
//             child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
//               Container(
//                 height: 80,
//                 width: 80,
//                 child: Image.asset(noticboard[index]["img"], fit: BoxFit.cover),
//               ),
//               SizedBox(height: Get.height * 0.015),
//               Text(
//                 noticboard[index]["title"],
//                 style: TextStyle(fontSize: 16, fontFamily: "Gilroy Bold", color: BlackColor),
//                 maxLines: 3,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               SizedBox(height: Get.height * 0.005),
//               Text("02 March 2020", style: TextStyle(fontSize: 14, fontFamily: "Gilroy Medium", color: greycolor)),
//             ]),
//           ),
//         );
//       },
//     );
//   }
// }

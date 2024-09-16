// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:multi_vendor/constants/constants.dart';

// class CustomContainer extends StatelessWidget {
//   CustomContainer({super.key, required this.content});

//   Widget content;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         height: MediaQuery.of(context).size.height * 0.75,
//         width: width,
//         child: ClipRRect(
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(30.r),
//             bottomRight: Radius.circular(30.r),
//           ),
//           child: Container(
//               height: 110.h,
//               width: width,
//               color: kOffwhite,
//               child: SingleChildScrollView(
//                 child: Container(
//                   margin: EdgeInsets.only(top: 20.h),
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             CircleAvatar(
//                               radius: 25.r,
//                               backgroundColor: KSecondary,
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(bottom: 6.h, left: 8.w),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   //  ReusableText()
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                         Text(
//                           ('@'),
//                         )
//                       ]),
//                 ),
//               )),
//         ));
//   }
// }

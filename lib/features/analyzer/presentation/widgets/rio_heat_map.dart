// import 'package:flutter/material.dart';
// import 'package:trading/helper/responsive_helper/responsive_helper.dart';
//
//
// class ROIHeatmap extends StatelessWidget {
//   final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
//   final List<String> timeSlots = [
//     '00:00AM-\n03:00AM',
//     '04:00AM-\n07:00AM',
//     '08:00AM-\n11:00AM',
//     '12:00PM-\n03:00PM',
//     '04:00PM-\n07:00PM',
//     '08:00PM-\n11:00PM'
//   ];
//
//   // Dummy Data: 6 rows (times) x 7 columns (days)
//   final List<List<double>> heatmapData;
//
//   ROIHeatmap({super.key, required this.heatmapData});
//
//   Color _getColor(double value) {
//     if (value <= -0.5) return const Color(0xFFF25C54); // Deep Red
//     if (value < 0) return const Color(0xFFF28482);    // Light Red
//     if (value < 0.5) return const Color(0xFFF6BD60);  // Orange/Yellow
//     if (value < 1.0) return const Color(0xFF84A59D);  // Muted Green
//     return const Color(0xFF2ECC71);                   // Bright Green
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: ResponsiveHelper.all(16),
//       decoration: BoxDecoration(
//         color: const Color(0xFF11141D),
//         borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(24)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "ROI Heatmap",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: ResponsiveHelper.fontSize(18),
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: ResponsiveHelper.height(20)),
//           Table(
//             border: TableBorder.all(
//               color: Colors.white10,
//               width: ResponsiveHelper.width(0.5),
//             ),
//             children: [
//               // Rows based on time slots
//               for (int i = 0; i < timeSlots.length; i++)
//                 TableRow(
//                   children: [
//                     // Time Label Column
//                     Container(
//                       padding: ResponsiveHelper.all(4),
//                       height: ResponsiveHelper.height(50),
//                       alignment: Alignment.center,
//                       child: Text(
//                         timeSlots[i],
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: ResponsiveHelper.fontSize(8),
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     // Data Columns (Days)
//                     for (int j = 0; j < 7; j++)
//                       Container(
//                         height: ResponsiveHelper.height(50),
//                         alignment: Alignment.center,
//                         color: _getColor(heatmapData[i][j]),
//                         child: Text(
//                           heatmapData[i][j].toString(),
//                           style: TextStyle(
//                             color: Colors.black87,
//                             fontWeight: FontWeight.bold,
//                             fontSize: ResponsiveHelper.fontSize(10),
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               // Bottom Day Labels
//               TableRow(
//                 children: [
//                   const SizedBox(), // Empty corner cell
//                   for (var day in days)
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: ResponsiveHelper.height(8)),
//                       child: Center(
//                         child: Text(
//                           day,
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: ResponsiveHelper.fontSize(10),
//                           ),
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ],
//           ),
//           SizedBox(height: ResponsiveHelper.height(15)),
//           // Gradient Legend at bottom
//           Row(
//             children: [
//               Text(
//                 "-1.0%",
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: ResponsiveHelper.fontSize(10),
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   height: ResponsiveHelper.height(6),
//                   margin: EdgeInsets.symmetric(horizontal: ResponsiveHelper.width(8)),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(3)),
//                     gradient: const LinearGradient(
//                       colors: [
//                         Color(0xFFF25C54),
//                         Color(0xFFF6BD60),
//                         Color(0xFF2ECC71)
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Text(
//                 "+2.0%",
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: ResponsiveHelper.fontSize(10),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

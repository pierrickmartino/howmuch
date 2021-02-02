// import 'package:flutter/material.dart';

// import '../chart/balance_analysis_per_month.dart';
// import '../chart/balance_analysis_per_year.dart';
// import '../common/custom_card.dart';

// class LeftFooterLayout extends StatelessWidget {
//   LeftFooterLayout();

//   @override
//   Widget build(BuildContext context) {
//     double containerHeight = (MediaQuery.of(context).size.height - 20) -
//         ((MediaQuery.of(context).size.height - 20 - 80) * 5 / 10);

//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Expanded(
//           flex: 5,
//           child: Container(
//             height: containerHeight,
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 6.0),
//                         child: Text(
//                           'Balance Analytic per Month',
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Expanded(
//                     child: CustomCard(
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: BalanceAnalysisPerMonth(),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 3,
//           child: Container(
//             height: containerHeight,
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 6.0),
//                         child: Text(
//                           'per Year',
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Expanded(
//                     child: CustomCard(
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: BalanceAnalysisPerYear(),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';

// import '../../constant/fake_data.dart';
// import '../common/custom_card.dart';
// import 'summary.dart';

// class LeftHeaderLayout extends StatelessWidget {
//   LeftHeaderLayout();

//   @override
//   Widget build(BuildContext context) {
//     double containerHeight = (MediaQuery.of(context).size.height - 20) -
//         ((MediaQuery.of(context).size.height - 20 - 80) * 3 / 10);

//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Expanded(
//           flex: 3,
//           child: Container(
//             height: containerHeight,
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: CustomCard(
//                 child: Summary(
//                   widgetType: 'INCOME',
//                   amount: FakeData.fakeIncome,
//                   variation: FakeData.fakeIncomeVariation / 100.0,
//                   variationAmount: FakeData.fakeIncomeVariationAmount,
//                 ),
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
//               child: CustomCard(
//                 child: Summary(
//                   widgetType: 'OUTCOME',
//                   amount: FakeData.fakeOutcome,
//                   variation: FakeData.fakeOutcomeVariation / 100.0,
//                   variationAmount: FakeData.fakeOutcomeVariationAmount,
//                 ),
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
//               child: CustomCard(
//                 child: Summary(
//                   widgetType: 'SAVINGS',
//                   amount: FakeData.fakeSavings,
//                   variation: FakeData.fakeSavingsVariation / 100.0,
//                   variationAmount: FakeData.fakeSavingsVariationAmount,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

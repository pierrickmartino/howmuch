// import 'package:badges/badges.dart';
// import 'package:flutter/material.dart';
// import 'package:fluid_layout/fluid_layout.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:howmuch/constant/const.dart';
// import 'package:howmuch/src/bloc/bloc.dart';
// import 'package:howmuch/src/database/database.dart';
// import 'package:line_awesome_icons/line_awesome_icons.dart';
// import 'package:undo/undo.dart';

// import 'add_category_dialog.dart';
// import 'edit_category_dialog.dart';

// class Categories extends StatefulWidget {
//   @override
//   _CategoriesState createState() => _CategoriesState();
// }

// class _CategoriesState extends State<Categories> {
//   refresh() {
//     setState(() {});
//   }

//   HowMuchAppBloc get bloc => BlocProvider.of<HowMuchAppBloc>(context);

//   @override
//   Widget build(BuildContext context) {
//     GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

//     return BlocBuilder<HowMuchAppBloc, ChangeStack>(
//       builder: (context, cs) => Scaffold(
//         key: _scaffoldKey,
//         body: Container(
//           color: Color(backgroundColor),
//           child: FluidLayout(
//             child: Builder(
//               builder: (context) => SingleChildScrollView(
//                 child: Column(
//                   children: <Widget>[
//                     SizedBox(height: 6),
//                     Fluid(
//                       child: Container(
//                         padding: EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           color: Color(menuBackgroundColor),
//                           borderRadius: BorderRadius.all(Radius.circular(
//                                   5.0) //         <--- border radius here
//                               ),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Color(menuBackgroundColor),
//                               blurRadius: 10,
//                               spreadRadius: 0.01,
//                               offset: Offset(3, 3),
//                             ),
//                           ],
//                         ),
//                         height: 50,
//                         width: double.infinity,
//                         child: Row(
//                           children: [
//                             Text(
//                               'Categories',
//                               style: TextStyle(
//                                 color: Color(menuTextColor),
//                               ),
//                             ),
//                             Spacer(),
//                             IconButton(
//                               onPressed: () {
//                                 showDialog(
//                                   context: context,
//                                   builder: (_) =>
//                                       AddCategoryDialog(contextParent: context),
//                                 );
//                               },
//                               tooltip: 'New category',
//                               icon: Icon(
//                                 LineAwesomeIcons.plus,
//                                 size: 16,
//                                 color: Color(menuTextColor),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 24),
//                     Fluid(
//                       child: Container(
//                         height: MediaQuery.of(context).size.height - 284,
//                         width: double.infinity,
//                         child: Center(
//                           child: StreamBuilder<List<CategoryWithInfo>>(
//                             stream: bloc.getCategoriesWithCount,
//                             builder: (context, snapshot) {
//                               if (!snapshot.hasData) {
//                                 return const Align(
//                                   alignment: Alignment.center,
//                                   child: CircularProgressIndicator(),
//                                 );
//                               }

//                               final activeCategoriesWithCount = snapshot.data;

//                               return CategoryList(
//                                   list: activeCategoriesWithCount);
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CategoryList extends StatelessWidget {
//   CategoryList({@required this.list});

//   final list;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: this.list.length,
//       itemBuilder: (context, index) {
//         final CategoryWithInfo categoryWithInfo = this.list[index];
//         return CategoryItem(
//             category: categoryWithInfo.category,
//             counter: categoryWithInfo.count);
//       },
//     );
//   }
// }

// class CategoryItem extends StatelessWidget {
//   CategoryItem({@required this.category, @required this.counter});

//   final Category category;
//   final int counter;

//   @override
//   Widget build(BuildContext context) {
//     Color categoryColor;
//     IconData categoryIcon;
//     Chip performanceChip;

//     if (category.color == null) {
//       categoryColor = Colors.grey;
//     } else {
//       categoryColor = Color(category.color).withOpacity(1);
//     }

//     if (category.icon == null) {
//       categoryIcon = LineAwesomeIcons.info_circle;
//     } else {
//       categoryIcon = IconData(category.icon,
//           fontFamily: category.iconFamily, fontPackage: category.iconPackage);
//     }

//     if (category.performance == 0) {
//       performanceChip = Chip(
//         backgroundColor: Color(chipBackgroundColor),
//         label: Text('perf. incl.'),
//       );
//     } else {
//       performanceChip = Chip(
//         backgroundColor: Color(chipBackgroundColor),
//         label: Text(
//           'perf. excl.',
//         ),
//       );
//     }

//     return Slidable(
//       actionPane: SlidableStrechActionPane(),
//       actionExtentRatio: 0.25,
//       movementDuration: const Duration(milliseconds: 100),
//       enabled: category.editable,
//       child: Badge(
//         position: BadgePosition.topEnd(top: 10, end: 10),
//         child: Card(
//           color: Color(cardBackgroundColor),
//           elevation: 2,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               children: <Widget>[
//                 Icon(
//                   categoryIcon,
//                   size: 26.0,
//                   color: categoryColor,
//                 ),
//                 const SizedBox(width: 8.0),
//                 Expanded(
//                   child: context.breakpoint.isLargerThanM
// // in case of a big size screen
//                       ? Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 3.0),
//                               child: Text(
//                                 category.description,
//                                 style: TextStyle(
//                                   color: Color(cardTextColor),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 12.0),
//                             performanceChip,
//                             /*, creationDate, lastUpdateDate*/
//                           ],
//                         )
// // otherwise
//                       : Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 3.0),
//                               child: Text(
//                                 category.description,
//                                 style: TextStyle(
//                                   color: Color(cardTextColor),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         badgeColor: const Color(badgeBackgroundColor),
//         animationType: BadgeAnimationType.scale,
//         animationDuration: Duration(milliseconds: 500),
//         shape: BadgeShape.circle,
//         badgeContent: Text(
//           counter.toString(),
//           style: TextStyle(
//             color: Color(badgeTextColor),
//           ),
//         ),
//       ),
//       actions: <Widget>[
//         IconSlideAction(
//           caption: 'Edit',
//           color: Colors.blue,
//           icon: LineAwesomeIcons.edit,
//           onTap: () {
//             showDialog(
//               context: context,
//               barrierDismissible: false,
//               builder: (ctx) => CategoryEditDialog(
//                 entry: category,
//                 contextParent: context,
//               ),
//             );
//           },
//         ),
//       ],
//       secondaryActions: <Widget>[
//         IconSlideAction(
//           caption: 'Delete',
//           color: Colors.red,
//           icon: LineAwesomeIcons.trash,
//           onTap: () {
//             BlocProvider.of<HowMuchAppBloc>(context).deleteCategory(category);
//           },
//         ),
//       ],
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluid_layout/fluid_layout.dart';
import '../chart/example_bar_chart.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:http/http.dart';

import 'add_category_dialog.dart';
import 'index.dart';
import '../../src/model/category.dart';
import '../../src/utils/category_utils.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Colors.grey[200],
        child: FluidLayout(
          child: Builder(
            builder: (context) => SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: FluidLayout.of(context).horizontalPadding),
                child: Column(
                  children: <Widget>[
                    Fluid(
                        child: Container(
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text(
                            'Categories',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => AddCategoryDialog(
                                        notifyParent: refresh,
                                        scaffoldKeyParent: _scaffoldKey,
                                        contextParent: context,
                                      ));
                            },
                            tooltip: 'New category',
                            icon: Icon(LineAwesomeIcons.plus),
                          )
                        ],
                      ),
                    )),
                    SizedBox(height: 24),
                    Container(
                      height: 180,
                      child: ListView.separated(
                        itemCount: 4,
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                FluidLayout.of(context).horizontalPadding +
                                    FluidLayout.of(context).fluidPadding),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => ExempleBarChart(),
                        separatorBuilder: (_, __) => SizedBox(
                            width: FluidLayout.of(context).horizontalPadding),
                      ),
                    ),
                    SizedBox(height: 24),
                    Fluid(
                        child: Container(
                      height: MediaQuery.of(context).size.height - 380,
                      width: double.infinity,
                      child: Center(
                        child: FutureBuilder(
                          future: getCategoryList(),
                          builder: (context, snapshot) {
                            if (snapshot.data != null) {
                              List<Category> categoryList = snapshot.data;

                              return ListView.builder(
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                itemBuilder: (_, position) {
                                  return CategoryCard(
                                      entry: categoryList[position],
                                      notifyParent: refresh);
                                },
                                itemCount: categoryList.length,
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<List<Category>> getCategoryList() async {
    List<Category> categoryList = [];

    Response response = await CategoryUtils.getCategoryList();
    print("Code is ${response.statusCode}");
    print("Response is ${response.body}");

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      var results = body["results"];

      for (var category in results) {
        categoryList.add(Category.fromJson(category));
      }
    } else {
      //Handle error
    }
    return categoryList;
  }
}

//import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/carousel.dart';
import '../widgets/category_heading.dart';
import '../widgets/category_list.dart';
import '../widgets/destination_heading.dart';
import '../widgets/featured_heading.dart';
import '../widgets/featured_tiles.dart';
import '../widgets/floating_quick_access_bar.dart';
import '../widgets/howmuch_drawer.dart';
import '../widgets/importation.dart';
import '../widgets/number_heading.dart';
import '../widgets/number_tiles.dart';
import '../widgets/responsive.dart';
import '../widgets/top_bar_contents.dart';
import '../widgets/web_scrollbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController;
  //double _scrollPosition = 0;
  double _opacity = 0;

  // void _scrollListener() {
  //   setState(() {
  //     _scrollPosition = _scrollController.position.pixels;
  //   });
  // }

  @override
  void initState() {
    _scrollController = ScrollController();
    // the listener is causing some multiple request on database so I prefer avoid it
    //_scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // _opacity = _scrollPosition < screenSize.height * 0.40
    //     ? _scrollPosition / (screenSize.height * 0.40)
    //     : 1;

    _opacity = 0.85;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor:
                  Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
              elevation: 0,
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.brightness_6),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    // DynamicTheme.of(context).setBrightness(
                    //     Theme.of(context).brightness == Brightness.dark
                    //         ? Brightness.light
                    //         : Brightness.dark);
                    //print(Theme.of(context).brightness);
                  },
                ),
              ],
              title: Text(
                'HOWMUCH',
                style: TextStyle(
                  color: Colors.blueGrey[100],
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopBarContents(opacity: _opacity),
            ),
      drawer: const HowMuchDrawer(),
      body: WebScrollbar(
        color: Colors.blueGrey,
        backgroundColor: Colors.blueGrey.withOpacity(0.3),
        width: 10,
        heightFraction: 0.3,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: ResponsiveWidget.isSmallScreen(context)
                        ? screenSize.height * 0.2
                        : screenSize.height * 0.45,
                    width: screenSize.width,
                    child: Image.asset(
                      'asset/images/cover.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      FloatingQuickAccessBar(screenSize: screenSize),
                      Column(
                        children: [
                          FeaturedHeading(screenSize: screenSize),
                          FeaturedTiles(screenSize: screenSize)
                        ],
                      ),
                    ],
                  )
                ],
              ),
              // SizedBox(height: screenSize.height / 8),
              NumberHeading(screenSize: screenSize),
              NumberTiles(screenSize: screenSize),

              CategoryHeading(screenSize: screenSize),
              CategoryList(screenSize: screenSize),

              DestinationHeading(screenSize: screenSize),
              const DestinationCarousel(),
              Importation(screenSize: screenSize),
              SizedBox(height: screenSize.height / 10),
              if (ResponsiveWidget.isSmallScreen(context))
                const SizedBox.shrink()
              else
                const BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}

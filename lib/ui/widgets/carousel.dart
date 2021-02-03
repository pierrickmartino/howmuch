import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'responsive.dart';

class DestinationCarousel extends StatefulWidget {
  const DestinationCarousel({Key key}) : super(key: key);
  @override
  _DestinationCarouselState createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  final String imagePath = 'asset/images/';

  final CarouselController _controller = CarouselController();

  final List<dynamic> _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  final List<dynamic> _isSelected = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  int _current = 0;

  final List<String> images = [
    'asset/images/asia.jpg',
    'asset/images/africa.jpg',
    'asset/images/europe.jpg',
    'asset/images/south_america.jpg',
    'asset/images/australia.jpg',
    'asset/images/antarctica.jpg',
  ];

  final List<String> places = [
    'ASIA',
    'AFRICA',
    'EUROPE',
    'SOUTH AMERICA',
    'AUSTRALIA',
    'ANTARCTICA',
  ];

  List<Widget> generateImageTiles(screenSize) {
    return images
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              element,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final imageSliders = generateImageTiles(screenSize);

    return Stack(
      children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              scrollPhysics: ResponsiveWidget.isSmallScreen(context)
                  ? const PageScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              enlargeCenterPage: true,
              aspectRatio: 18 / 8,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                  for (int i = 0; i < imageSliders.length; i++) {
                    if (i == index) {
                      _isSelected[i] = true;
                    } else {
                      _isSelected[i] = false;
                    }
                  }
                });
              }),
          carouselController: _controller,
        ),
        AspectRatio(
          aspectRatio: 18 / 8,
          child: Center(
            child: Text(
              places[_current],
              style: TextStyle(
                letterSpacing: 8,
                fontFamily: 'Electrolize',
                fontSize: screenSize.width / 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
        if (ResponsiveWidget.isSmallScreen(context))
          Container()
        else
          AspectRatio(
            aspectRatio: 17 / 8,
            child: Center(
              heightFactor: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: screenSize.width / 8,
                    right: screenSize.width / 8,
                  ),
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: screenSize.height / 50,
                        bottom: screenSize.height / 50,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int i = 0; i < places.length; i++)
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  onHover: (value) {
                                    setState(() {
                                      value
                                          ? _isHovering[i] = true
                                          : _isHovering[i] = false;
                                    });
                                  },
                                  onTap: () {
                                    _controller.animateToPage(i);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: screenSize.height / 80,
                                        bottom: screenSize.height / 90),
                                    child: Text(
                                      places[i],
                                      style: TextStyle(
                                        color: _isHovering[i]
                                            ? Theme.of(context)
                                                .primaryTextTheme
                                                .button
                                                .decorationColor
                                            : Theme.of(context)
                                                .primaryTextTheme
                                                .button
                                                .color,
                                      ),
                                    ),
                                  ),
                                ),
                                Visibility(
                                  maintainSize: true,
                                  maintainAnimation: true,
                                  maintainState: true,
                                  visible: _isSelected[i],
                                  child: AnimatedOpacity(
                                    duration: const Duration(milliseconds: 400),
                                    opacity: _isSelected[i] ? 1 : 0,
                                    child: Container(
                                      height: 5,
                                      decoration: const BoxDecoration(
                                        color: Colors.blueGrey,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      width: screenSize.width / 10,
                                    ),
                                  ),
                                )
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

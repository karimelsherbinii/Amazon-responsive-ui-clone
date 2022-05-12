import 'package:amazon_clone/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'dart:async';

// ignore: must_be_immutable
class CustomPageView extends StatefulWidget {
  // List<String>? imagesList;

  CustomPageView({
    Key? key,
    // this.imagesList,
  }) : super(key: key);

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView>
    with TickerProviderStateMixin {
  List<Image> _imagesList = [
    Image.asset(
      'assets/images/ad1.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/ad2.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/ad3.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/ad4.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/ad5.jpg',
      fit: BoxFit.cover,
    ),
  ];
  //declare the variables
  AnimationController? _animationController;
  Animation<double>? _nextPage;
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  //  final PageController _pageController = PageController(initialPage: 0);
//  int _currentIndex = 0;
  bool end = false;
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_currentIndex == 4) {
        end = true;
      } else if (_currentIndex == 0) {
        end = false;
      }
      if (end == false) {
        _currentIndex++;
      } else {
        _currentIndex--;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(seconds: 2),
        curve: Curves.easeIn,
      );
    });
  }
  
  

  @override
  Widget build(BuildContext context) {
    // _animationController!.forward(); //Start controller with widget
    // print(_nextPage!.value);
    return SizedBox(
      height: MySizeConfig.safeBlockVerticalWithAppBar! * 21.5,
      width: MySizeConfig.safeBlockHorizontal! * 100,
      child:
        
          PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _imagesList.length,
        controller: _pageController,

     
        onPageChanged: (value) {
          setState(() {
            // _animationController!.forward();
            _currentIndex = value;
          });
        },
        itemBuilder: (BuildContext context, int index) {
          return _imagesList[index];
        },
      ),
    );
  }
}


// Other choise :
// void initState() {
  //   super.initState();
  //   _animationController = AnimationController(
  //     vsync: this,
  //     duration: const Duration(
  //       seconds: 2,
  //     ),
  //   );
  //   _nextPage = Tween(begin: 0.0, end: 1.0).animate(_animationController!);
  //   //@@@@@@@
  //   _animationController!.addListener(() {
  //     if (_animationController!.status == AnimationStatus.completed) {
  //       _animationController!.reset();
  //       final int images = 4;
  //       if (_currentIndex < images) {
  //         _currentIndex++;
  //         _pageController.animateTo(_currentIndex,
  //             duration: const Duration(milliseconds: 300),
  //             curve: Curves.easeIn);
  //       } else {
  //         _currentIndex = 0;
  //       }
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   _animationController!.dispose();
  //   super.dispose();
  // }
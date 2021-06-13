import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:roistegapp/constants/constants.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  RouteSettings route = RouteSettings();
  void _onIntroEnd(context) {
    Get.off(route);
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/mimi$assetName.gif', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
          color: Colors.brown, fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 8, right: 16),
            child: Text(
              'Stegie',
              style: TextStyle(
                fontSize: 26,
                color: brown,
                fontWeight: FontWeight.bold,
              ),
            ),
            // _buildImage('9', 100),
          ),
        ),
      ),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: GestureDetector(
          onTap: () => _onIntroEnd(context),
          child: Container(
            color: Colors.brown,
            child: Center(
              child: Text(
                'Aaarhh Let\s dive right in Stegie!',
                style: TextStyle(
                    color: white, fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Welcome to Stegie!\n Yes, You've Made it.",
          body:
              "This is a Region Of Interest Based Reversible Data Hiding Scheme in Encrypted Images.\n\n Take a very short tour to get familiar with your space.",
          image: _buildImage('2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Send And Receive Hidden Messages",
          body: "Made just for that. with a Real Time Advanced Chat System",
          image: _buildImage('3'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Hide Sensitive Data",
          body:
              "Hide Your Important Data in the Image without any worry and send it easily",
          image: _buildImage('3'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Trick the Trickster",
          body: "Keep Your Data Hidden on a Particular region within the Image",
          image: _buildImage('4'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Secure Your Data",
          body:
              "With SHA-512 Image Encryption Algorithm, your Data is fully Secured ",
          image: _buildImage('5'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Decode Images Faster",
          body:
              "Reveal or Decode the Message in the Image in Real time and very Fast.",
          image: _buildImage('6'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Compress Losslessly",
          body:
              "With 99% Effective Rate, None of your Pixels are lost during the Image Processing.",
          image: _buildImage('7'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Congratulations!!",
          body:
              "You have Finished the Simple Stegie tour. We can't wait to have you around.\nLets Roll",
          image: _buildImage('2'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text(
        'Skip',
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      dotsDecorator: const DotsDecorator(
        size: Size(7.0, 7.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeColor: Colors.brown,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
      ),
      dotsFlex: 1,
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
      ),
    );
  }
}

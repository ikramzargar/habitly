import 'package:flutter/material.dart';
import 'package:habitly/globals/colors.dart';
import 'package:habitly/globals/text_styles.dart';
import 'package:habitly/screens/splash_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const SplashScreen()),
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset(assetName, width: width);
  }

  @override
  Widget build(BuildContext context) {
    //const bodyStyle = TextStyle(fontSize: 19.0);

    final pageDecoration = PageDecoration(
      titleTextStyle:
          const TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: AppTextStyles.bodyText,
      bodyPadding: const EdgeInsets.fromLTRB(6.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: const EdgeInsets.only(top: 100),
      bodyAlignment: Alignment.topLeft,
      bodyFlex: 1,
    );

    Widget buildTitle(String title1, String title2) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title1,
            style: AppTextStyles.heading1,
          ),
          Text(
            title2,
            style: AppTextStyles.heading1.copyWith(color: AppColors.blue),
          ),
        ],
      );
    }

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      infiniteAutoScroll: true,
      pages: [
        PageViewModel(
          titleWidget: buildTitle('Forge lasting', 'daily habits'),
          bodyWidget: Text(
            'With our intuitive interface and powerful tracking features, you`ll find it easier than ever to stay on course towards your goals.',
            style: AppTextStyles.bodyText,
          ),
          image: _buildImage('images/splsh_3.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: buildTitle('Empower your', 'daily progress'),
          bodyWidget: Text(
            'Start today and experience the empowering impact of the consistent, meaningful, progress in every area of your life.',
            style: AppTextStyles.bodyText,
          ),
          image: _buildImage('images/splsh_1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: buildTitle('Chase growth,', 'track triumphs'),
          bodyWidget: Text(
            'Empower your journey, chasing growth while meticulously tracking triumphs with the Habitly',
            style: AppTextStyles.bodyText,
          ),
          image: _buildImage('images/splsh_2.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      //back: const Icon(Icons.arrow_back),
      // skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Padding(
        padding: EdgeInsets.only(left: 90.0),
        child: CircleAvatar(
          backgroundColor: AppColors.blue,
          radius: 40,
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ),
      ),
      done: const Padding(
        padding: EdgeInsets.only(left: 90.0),
        child: CircleAvatar(
          backgroundColor: AppColors.blue,
          radius: 40,
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(6),
      controlsPadding: const EdgeInsets.fromLTRB(0.0, 4.0, 10.0, 60.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeColor: AppColors.blue,
        activeSize: Size(10.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

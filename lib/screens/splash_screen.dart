import 'package:flutter/material.dart';

import '../globals/colors.dart';
import '../globals/text_styles.dart';
import '../widgtes/blue_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Image.asset('images/splsh_4.png',width: 350,),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Begin, track,',
                style: AppTextStyles.heading1,
              ),
              Text(
                'conquer daily',
                style: AppTextStyles.heading1.copyWith(color: AppColors.blue),
              ),
            ],
          ),
          Text(
            'Embrace each day, track your progress, and conquer your goals with the Habitly app, making daily success a habit .',
            style: AppTextStyles.bodyText,
          ),
          BlueButton(
            text: 'Let`s get started',
            callback: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const Material()),
              );
            },
          ),
          MaterialButton(
            onPressed: () {},
            child: Text(
              'I already have an account',
              style: AppTextStyles.bodyText.copyWith(
                color: AppColors.blue,
              ),
            ),
          )
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../globals/colors.dart';
class BlueButton extends StatelessWidget {

  final String text;
  final void Function()? callback;
  const BlueButton( {super.key, required this.text, required this.callback});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: callback,
      color: AppColors.blue,
      height: 55.0,
      minWidth: 350.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child:  Text(
          text,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 15.0
          )
      ),
    );
  }
}

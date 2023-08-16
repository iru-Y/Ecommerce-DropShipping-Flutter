import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:trizi/utils/custom_styles.dart';

class SignSignup extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function() onTap;

  const SignSignup({
    Key? key,
    required this.text1,
    required this.text2,
    required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Align(
        alignment: Alignment.center,
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: text1,
              style: const TextStyle(fontFamily: 'Dmsans-light', color: ColorsCustom.TEXT_COLOR_LIGHT_2)),
          TextSpan(
              recognizer: TapGestureRecognizer()..onTap = onTap,
              text: text2,
              style:
                  const TextStyle(fontFamily: 'Dmsans-black', color: Colors.black))
        ])),
      ),
    );
  }
}

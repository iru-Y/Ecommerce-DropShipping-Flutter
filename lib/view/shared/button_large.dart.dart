import 'package:flutter/material.dart';

class ButtonLarge extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final String sufixIcon;
  final void Function() onPressed;

  const ButtonLarge({
    Key? key,
    required this.backgroundColor,
    required this.text,
    required this.sufixIcon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Text(text, style: const TextStyle(
            color: Colors.white
          ),),
          Image.asset(sufixIcon)
        ],
      ),
      ),
    );
  }
}

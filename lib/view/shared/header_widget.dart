import 'package:flutter/material.dart';
import '../../utils/fonts.dart';

class HeaderWidget extends StatelessWidget {
  final String txt1;
  final String txt2;

  const HeaderWidget({
    Key? key,
    required this.txt1,
    required this.txt2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset('assets/icons/location_icon.png'),
            const SizedBox(width: 10),
            const Text('Bacabal-ma'),
          ],
        ),
        const SizedBox(height: 10,),
        Text(txt1, style: DMSANS_BLACK),
        const SizedBox(height: 40,),
        Text(txt2, style: DMSANS_LIGHT),
        const SizedBox(height: 20,),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../utils/fonts.dart';

class FormLoginRegister extends StatelessWidget {
  final String title;
  final TextInputType inputType;
  final String prefixIcon;
  final String? sufixIcon;
  final TextEditingController editingController;

  const FormLoginRegister({
    Key? key,
    required this.title,
    required this.inputType,
    required this.prefixIcon,
    this.sufixIcon,
    required this.editingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      
      Text(title,
          style: DMSANS_LIGHT),
      TextField(
        controller: editingController,
        cursorColor: Colors.black,
        keyboardType: inputType,
        decoration: InputDecoration(
          prefixIcon: Image.asset(prefixIcon, scale: 1),
          suffixIcon: sufixIcon != null ? Image.asset(sufixIcon!) : null,
          fillColor: Colors.black,
          focusColor: Colors.black,
        ),
      ),
    ]);
  }
}

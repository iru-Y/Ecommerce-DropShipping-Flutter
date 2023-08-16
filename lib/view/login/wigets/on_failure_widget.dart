import 'package:flutter/material.dart';

class OnFailureWidget extends StatelessWidget {
  const OnFailureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(

      child: Column(
        children: [
           const Text('Login ou senha inválido'),
            TextButton(
              onPressed: (){Navigator.of(context).pop();},
               child: const Text('f'))
        ],
      )
    );
  }
}

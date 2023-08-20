import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class OnErrorWidget extends StatelessWidget {
  final String title;
  final String content;
  final String btnText;
  final void Function() onConfirmBtnTap;
  const OnErrorWidget({
    Key? key,
    
    required this.btnText,
    required this.title,
    required this.content,
    required this.onConfirmBtnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              ElevatedButton(
                onPressed: () async {
                  onConfirmBtnTap();
                  Navigator.of(context).pop();
                },
                child: Text(btnText),
              ),
            ],
          );
        },
      );
    });
    return const CircularProgressIndicator();
  }
}

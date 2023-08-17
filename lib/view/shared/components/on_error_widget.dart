import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class OnErrorWidget extends StatelessWidget {
  final void Function() onConfirmBtnTap;
  const OnErrorWidget({
    Key? key,
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
            title: const Text('Error'),
            content: const Text('An error occurred.'),
            actions: [
              ElevatedButton(
                onPressed: () async {
                  onConfirmBtnTap();
                  Navigator.of(context).pop();
                },
                child: const Text('Tentar novamente'),
              ),
            ],
          );
        },
      );
    });
    return const CircularProgressIndicator();
  }
}

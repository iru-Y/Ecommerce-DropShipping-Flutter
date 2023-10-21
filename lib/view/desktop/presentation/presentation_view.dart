import 'package:flutter/material.dart';

class PresentationView extends StatefulWidget {
  const PresentationView({super.key});

  @override
  State<PresentationView> createState() => _PresentationViewState();
}

class _PresentationViewState extends State<PresentationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: Text('olá')));
  }
}

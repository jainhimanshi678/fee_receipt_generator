import 'dart:async';

import 'package:fee_receipt_generator/views/InvoicesPage.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _Splash();
}

class _Splash extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => InvoicesPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: FlutterLogo(size: MediaQuery.of(context).size.height));
  }
}

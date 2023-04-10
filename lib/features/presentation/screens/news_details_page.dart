import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsDetailsPage extends StatelessWidget {
  const NewsDetailsPage({super.key, required int index});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('this is detailes page')),
    );
  }
}

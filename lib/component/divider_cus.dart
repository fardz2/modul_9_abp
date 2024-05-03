import 'package:flutter/material.dart';

class DividerCus extends StatelessWidget {
  const DividerCus({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: Divider()),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text("Or $title with")),
        const Expanded(child: Divider()),
      ],
    );
  }
}

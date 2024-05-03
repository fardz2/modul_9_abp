import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ButtonMedia extends StatelessWidget {
  const ButtonMedia({super.key});
  static const double width = 105;
  static const double height = 56;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: width,
          height: height,
          child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("images/facebook_ic.svg"),
              style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                          width: 1, color: Colors.grey.withOpacity(0.5))))),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: width,
          height: height,
          child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("images/google_ic.svg"),
              style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                          width: 1, color: Colors.grey.withOpacity(0.5))))),
        )
      ],
    );
  }
}

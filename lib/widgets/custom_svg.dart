import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

Widget CSvg(String svg, {Color color = Colors.black, double height = 32}) {
  return SvgPicture.asset(
    height: height,
    svg,
    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
  );
}

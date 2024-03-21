import 'package:flutter/material.dart';
import 'package:iphone_dial_pad/common_attribute/common_value.dart';

class CommonText extends StatelessWidget {

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Color? color;

  const CommonText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? TextSize.label,
        fontWeight: fontWeight ?? TextWeight.regular,
        color: color ?? Colors.black,
        height: 0
      ),
    );
  }
}

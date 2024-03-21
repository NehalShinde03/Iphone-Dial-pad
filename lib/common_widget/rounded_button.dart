import 'package:flutter/material.dart';
import 'package:iphone_dial_pad/common_attribute/common_value.dart';
import 'package:iphone_dial_pad/common_widget/common_text.dart';

class CommonRoundedButton extends StatelessWidget {

  final String title;
  final String? subTitle;
  final VoidCallback? onTap;
  final double? titleTextSize;
  final double? subTitleTextSize;

  const CommonRoundedButton({
    super.key,
    required this.title,
    this.subTitle,
    this.onTap,
    this.titleTextSize,
    this.subTitleTextSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Colors.grey.shade300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: CommonText(
                text: title,
                fontWeight: TextWeight.semiBold,
                fontSize: titleTextSize ?? TextSize.largeHHeading,
                textAlign: TextAlign.center,
              ),
            ),
            CommonText(
              text: subTitle ?? "",
              fontWeight: TextWeight.regular,
              fontSize: subTitleTextSize ?? TextSize.content,
            ),
          ],
        ),
      ),
    )
    ;
  }
}

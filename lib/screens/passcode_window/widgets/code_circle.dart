import 'package:flutter/material.dart';
import 'package:vault_app/utils/dimensions.dart';
import 'package:vault_app/utils/styles.dart';

// ignore: must_be_immutable
class CodeCircle extends StatelessWidget {
  Color? borderColor;
  final Color bgColor;
  CodeCircle({
    super.key,
    this.borderColor,
    required this.bgColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.screenWidth*0.14,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor,
        border: Border.all(color: borderColor ?? Styles.white, width: 2)
      ),
    );
  }
}
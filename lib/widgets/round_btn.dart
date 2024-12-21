import 'package:flutter/material.dart';
import 'package:vault_app/utils/dimensions.dart';

// ignore: must_be_immutable
class RoundBtn extends StatelessWidget {
  final Color borderColor;
  final Color iconColor;
  final IconData icon;
  final Function onTap;
  Color? bgColor;
  double? size;
  RoundBtn({
    super.key,
    required this.borderColor,
    required this.iconColor,
    required this.icon,
    required this.onTap,
    this.bgColor,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.all(Dimensions.xxPad*0.4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: 2),
          color: bgColor ?? const Color(0X00FFFFFF)
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: size ?? Dimensions.screenWidth*0.05,
        ),
      ),
    );
  }
}
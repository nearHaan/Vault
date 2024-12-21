import 'package:flutter/material.dart';
import 'package:vault_app/utils/dimensions.dart';
import 'package:vault_app/utils/styles.dart';

class RectRoundBtn extends StatelessWidget {
  final String text;
  final Function onPressed;
  const RectRoundBtn({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed(text);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.xxPad, vertical: Dimensions.xxPad/2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius10),
          color: Styles.verdigris
        ),
        child: Center(
          child: Text(
            text,
            style: Styles.normalBoldTextStyle.copyWith(color: Styles.white),
          ),
        ),
      ),
    );
  }
}
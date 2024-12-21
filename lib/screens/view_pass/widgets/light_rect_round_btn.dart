import 'package:flutter/material.dart';
import 'package:vault_app/utils/dimensions.dart';
import 'package:vault_app/utils/styles.dart';

class LightRectRoundBtn extends StatelessWidget {
  final String text;
  final Function onPressed;
  const LightRectRoundBtn({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed();
      },
      child: Container(
        height: Dimensions.screenHeight*0.05,
        padding: EdgeInsets.symmetric(horizontal: Dimensions.xxPad*1.4, vertical: Dimensions.xxPad/2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius10),
          color: Styles.white
        ),
        child: Center(
          child: Text(
            text,
            style: Styles.normalBoldTextStyle,
          ),
        ),
      ),
    );
  }
}
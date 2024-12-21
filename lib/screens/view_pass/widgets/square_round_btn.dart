import 'package:flutter/material.dart';
import 'package:vault_app/utils/dimensions.dart';
import 'package:vault_app/utils/styles.dart';

class SquareRoundBtn extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  const SquareRoundBtn({
    super.key,
    required this.icon,
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
        width: Dimensions.screenHeight*0.05,
        padding: EdgeInsets.all(Dimensions.xxPad*0.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius20*0.8),
          color: Styles.verdigris,
        ),
        child: Center(
          child: Icon(
            icon,
            color: Styles.white,
          ),
        ),
      ),
    );
  }
}
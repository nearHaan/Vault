import 'package:flutter/material.dart';
import 'package:vault_app/utils/dimensions.dart';
import 'package:vault_app/utils/styles.dart';

class RoundEdgeButton extends StatelessWidget {
  final Function onPressed;
  const RoundEdgeButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        padding: EdgeInsets.all(Dimensions.xxPad*0.4),
        decoration: BoxDecoration(
          color: Styles.white,
          borderRadius: BorderRadius.circular(Dimensions.radius20)
        ),
        child: Center(
          child: Text(
            'Copy',
            style: Styles.normalBoldTextStyle.copyWith(fontWeight: FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:vault_app/utils/dimensions.dart';
import 'package:vault_app/utils/styles.dart';

class BigRoundButton extends StatelessWidget {
  final Function onPressed;
  const BigRoundButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed();
      },
      child: Container(
        padding: EdgeInsets.all(Dimensions.xxPad*0.8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Styles.black, width: 2)
        ),
        child: Icon(
          FluentIcons.dismiss_24_regular,
          color: Styles.black,
          size: Dimensions.screenHeight*0.03,
        ),
      ),
    );
  }
}
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:vault_app/utils/dimensions.dart';
import 'package:vault_app/utils/styles.dart';

class CodeButton extends StatelessWidget {
  final int num;
  final Function onTapFunc;
  const CodeButton({
    super.key,
    required this.num,
    required this.onTapFunc
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapFunc(num);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Styles.codeBtnColor,
          borderRadius: BorderRadius.circular(Dimensions.radius20)
        ),
        child: Center(
          child: num!=12?Text(
            num.toString(),
            style: Styles.bigThinTextStyle,
          ):Icon(
            FluentIcons.backspace_24_regular,
            color: Styles.verdigris,
            size: Dimensions.screenWidth*0.08
          )
        )
      ),
    );
  }
}
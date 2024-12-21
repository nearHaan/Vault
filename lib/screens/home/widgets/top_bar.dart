import 'package:flutter/material.dart';
import 'package:vault_app/utils/dimensions.dart';
import 'package:vault_app/utils/styles.dart';
import 'package:vault_app/widgets/rect_round_btn.dart';
import 'package:vault_app/widgets/round_btn.dart';

class TopBar extends StatelessWidget {
  final String title;
  final String rectBtnText;
  final Color circleBtnBorderColor;
  final IconData circleBtnIcon;
  final Function onRectBtnTap;
  final Function onCircleBtnTap;
  const TopBar({
    super.key,
    required this.title,
    required this.rectBtnText,
    required this.circleBtnBorderColor,
    required this.circleBtnIcon,
    required this.onRectBtnTap,
    required this.onCircleBtnTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.screenHeight*0.15,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              title,
              style: Styles.bigBoldTextStyle,
              textAlign: TextAlign.left,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RectRoundBtn(
                text: rectBtnText,
                onPressed: onRectBtnTap
              ),
            ],
          ),
          SizedBox(width: Dimensions.xxPad*0.5),
          RoundBtn(
            borderColor: circleBtnBorderColor,
            iconColor: Styles.black,
            icon: circleBtnIcon,
            onTap: onCircleBtnTap,
          )
        ],
      ),
    );
  }
}
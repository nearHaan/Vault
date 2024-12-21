import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vault_app/screens/view_pass/widgets/round_edge_btn.dart';
import 'package:vault_app/utils/dimensions.dart';
import 'package:vault_app/utils/styles.dart';
import 'package:vault_app/widgets/round_btn.dart';

// ignore: must_be_immutable
class PasswordBox extends StatelessWidget {
  final String password;
  final Function onEyeTap;
  final Function onCopy;
  List<Effect> effect;
  bool reveal;
  PasswordBox({
    super.key,
    required this.password,
    required this.onEyeTap,
    required this.onCopy,
    required this.effect,
    required this.reveal,
  });

  List<String> splitPassword = [];

  splitPass(String pass){
    splitPassword = pass.split('');
  }

  @override
  Widget build(BuildContext context) {
    splitPass(password);
    return Container(
      height: Dimensions.screenHeight*0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius20),
        color: Styles.verdigris
      ),
      child: Stack(
        children: [
          Positioned(
            width: Dimensions.screenWidth*0.8,
            top: Dimensions.xxPad,
            left: Dimensions.xxPad,
            child: Animate(
              effects: effect,
              child: RichText(
                text: TextSpan(
                  style: Styles.bigPasswordTextStyle,
                  children: List.generate(
                    splitPassword.length,
                    (index) {
                      return TextSpan(
                        text: splitPassword[index],
                        style: splitPassword[index].isAlphabetOnly? Styles.bigPasswordAlphaTextStyle
                        :splitPassword[index].isNum? Styles.bigPasswordNumTextStyle : Styles.bigPasswordSymbTextStyle,
                      );
                    }
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: Dimensions.xxPad,
            right: Dimensions.xxPad*3.5,
            child: RoundEdgeButton(
              onPressed: onCopy,
            ),
          ),
          Positioned(
            bottom: Dimensions.xxPad,
            right: Dimensions.xxPad,
            child: RoundBtn(
              borderColor: Styles.black,
              iconColor: Styles.white,
              icon: reveal?FluentIcons.eye_24_regular:FluentIcons.eye_off_24_regular,
              onTap: onEyeTap,
              bgColor: Styles.black,
            ),
          )
        ],
      ),
    );
  }
}
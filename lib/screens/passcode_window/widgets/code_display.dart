import 'package:flutter/material.dart';
import 'package:vault_app/screens/passcode_window/widgets/code_circle.dart';
import 'package:vault_app/utils/dimensions.dart';
import 'package:vault_app/utils/styles.dart';

// ignore: must_be_immutable
class CodeDispBox extends StatelessWidget {
  final int length;
  CodeDispBox({
    super.key,
    required this.length
  });

  List<Color> dispColors = [
    Styles.darkBlue,
    Styles.darkBlue,
    Styles.darkBlue,
    Styles.darkBlue
  ];

  updateColor(){
    if(length == 0){
      dispColors = [
        Styles.lightGrey,
        Styles.lightGrey,
        Styles.lightGrey,
        Styles.lightGrey
      ];
    } else if (length == 1) {
      dispColors = [
        Styles.verdigris,
        Styles.lightGrey,
        Styles.lightGrey,
        Styles.lightGrey
      ];
    } else if (length == 2) {
      dispColors = [
        Styles.verdigris,
        Styles.verdigris,
        Styles.lightGrey,
        Styles.lightGrey
      ];
    } else if (length == 3) {
      dispColors = [
        Styles.verdigris,
        Styles.verdigris,
        Styles.verdigris,
        Styles.lightGrey
      ];
    } else if (length == 4) {
      dispColors = [
        Styles.verdigris,
        Styles.verdigris,
        Styles.verdigris,
        Styles.verdigris
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    updateColor();
    return SizedBox(
      height: Dimensions.screenHeight*0.15,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Positioned(
            left: Dimensions.screenWidth*0.24,
            right: 0,
            child: CodeCircle(bgColor: dispColors[3]),
          ),
          Positioned(
            left: Dimensions.screenWidth*0.08,
            right: 0,
            child: CodeCircle(bgColor: dispColors[2]),
          ),
          Positioned(
            left: -Dimensions.screenWidth*0.08,
            right: 0,
            child: CodeCircle(bgColor: dispColors[1]),
          ),
          Positioned(
            left: -Dimensions.screenWidth*0.24,
            right: 0,
            child: CodeCircle(bgColor: dispColors[0]),
          ),
        ],
      ),
    );
  }
}
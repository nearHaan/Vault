import 'package:flutter/material.dart';
import 'package:vault_app/screens/passcode_window/widgets/code_display.dart';
import 'package:vault_app/utils/dimensions.dart';

class CodePageTop extends StatelessWidget {
  final String infoText;
  final int length;
  const CodePageTop({
    super.key,
    required this.infoText,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.screenWidth*0.5,
      child: Column(
        children: [
          Text(
            infoText
          ),
          Expanded(
            child: Center(
              child: CodeDispBox(length: length,),
            )
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:vault_app/utils/dimensions.dart';
import 'package:vault_app/utils/styles.dart';

// ignore: must_be_immutable
class AnswerBox extends StatelessWidget {
  final TextEditingController ansController;
  final GlobalKey formKey;
  const AnswerBox({
    super.key,
    required this.ansController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(Dimensions.xxPad),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius10),
        color: Styles.white
      ),
      child: Form(
        key: formKey,
        child: TextFormField(
          style: Styles.normalBoldTextStyle,
          controller: ansController,
          validator: (value) {
            if (value!.trim().isEmpty) {
              return 'Please enter answer';
            }
            return null;
          },
        ),
      ),
    );
  }
}
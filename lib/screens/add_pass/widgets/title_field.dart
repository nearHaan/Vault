import 'package:flutter/material.dart';
import 'package:vault_app/utils/dimensions.dart';
import 'package:vault_app/utils/styles.dart';

// ignore: must_be_immutable
class TitleAndField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  String? Function(String?)? validator;
  int? maxLength;
  int? maxLines;
  double? fieldHeight;
  TitleAndField({
    super.key,
    required this.title,
    required this.controller,
    this.validator,
    this.maxLength,
    this.maxLines,
    this.fieldHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: Styles.smallTextStyle,
        ),
        Container(
          // height: fieldHeight ?? Dimensions.screenHeight*0.05,
          padding: EdgeInsets.symmetric(horizontal: Dimensions.xxPad*0.5),
          decoration: BoxDecoration(
            color: Styles.lightGrey,
            borderRadius: BorderRadius.circular(Dimensions.radius10),
          ),
          child: TextFormField(
            controller: controller,
            style: Styles.normalBoldTextStyle,
            maxLines: maxLines ?? 1,
            validator: validator,
            maxLength: maxLength,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: Dimensions.xPad,
        )
      ],
    );
  }
}
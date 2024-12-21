import 'package:flutter/material.dart';
import 'package:vault_app/utils/dimensions.dart';
import 'package:vault_app/utils/styles.dart';

class TitleValueSet extends StatelessWidget {
  final String title;
  final String value;
  const TitleValueSet({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: Styles.smallTextStyle.copyWith(height: Dimensions.smallfontSize*0.04),
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: Dimensions.xxPad*0.5,
        ),
        Text(
          value,
          style: Styles.normalBoldTextStyle,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: Dimensions.xxPad,
        )
      ],
    );
  }
}
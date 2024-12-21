import 'package:flutter/material.dart';
import 'package:vault_app/utils/dimensions.dart';
import 'package:vault_app/utils/styles.dart';

// ignore: must_be_immutable
class SelectedQnAnsCard extends StatelessWidget {
  final String selectedQn;
  Function? onClick;
  SelectedQnAnsCard({
    super.key,
    required this.selectedQn,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onClick != null) {
          onClick!();
        }
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(Dimensions.xxPad),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius10),
          color: Styles.white
        ),
        child: Text(
          selectedQn,
          style: Styles.normalBoldTextStyle,
          maxLines: null,
        ),
      ),
    );
  }
}
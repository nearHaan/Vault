import 'package:flutter/material.dart';
import 'package:vault_app/utils/dimensions.dart';
import 'package:vault_app/utils/styles.dart';

class QuestionEditTile extends StatelessWidget {
  final String title;
  final Function onTap;
  final int index;
  final int selected;
  const QuestionEditTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.index,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: Dimensions.xxPad*0.5),
            child: Text(
              title,
              style: index==selected?Styles.normalBoldTextStyle.copyWith(color: Styles.verdigris):Styles.normalBoldTextStyle,
            ),
          ),
          Divider(
            color: Styles.lightGrey,
            thickness: 2,
          )
        ],
      ),
    );
  }
}
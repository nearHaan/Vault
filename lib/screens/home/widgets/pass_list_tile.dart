import 'package:flutter/material.dart';
import 'package:vault_app/utils/dimensions.dart';
import 'package:vault_app/utils/styles.dart';

class PassListTile extends StatelessWidget {
  final int index;
  final String title;
  final String subtitle;
  final Function onPressed;
  const PassListTile({
    super.key,
    required this.index,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed(title);
      },
      child: Container(
        height: Dimensions.screenHeight*0.1,
        margin: EdgeInsets.only(bottom: Dimensions.xxPad*0.8),
        padding: EdgeInsets.all(Dimensions.xxPad),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius20),
          color: Styles.lightGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Styles.normalBoldTextStyle,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              subtitle==''?'NO EMAIL PROVIDED':subtitle,
              style: Styles.smallTextStyle,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
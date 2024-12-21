import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:vault_app/utils/dimensions.dart';
import 'package:vault_app/utils/styles.dart';
import 'package:vault_app/widgets/round_btn.dart';

class SettingsTopBar extends StatelessWidget {
  final Function onDismiss;
  const SettingsTopBar({
    super.key,
    required this.onDismiss,
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
              'Settings',
              style: Styles.bigBoldTextStyle,
              textAlign: TextAlign.left,
            ),
          ),
          RoundBtn(
            borderColor: Styles.black,
            iconColor: Styles.black,
            icon: FluentIcons.dismiss_24_regular,
            onTap: onDismiss,
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:vault_app/utils/dimensions.dart';
import 'package:vault_app/utils/styles.dart';

class SettingCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function function;
  final bool requireSwitch;
  final bool switchState;
  const SettingCard({
    super.key,
    required this.title,
    required this.icon,
    required this.function,
    this.requireSwitch = false,
    this.switchState = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (requireSwitch == false) {
          function();
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: Dimensions.xxPad),
        padding: EdgeInsets.all(Dimensions.xxPad),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius20),
          color: Styles.lightGrey
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Styles.verdigris,
            ),
            SizedBox(
              width: Dimensions.xxPad
            ),
            Expanded(
              child: Text(
                title,
                style: Styles.normalBoldTextStyle,
              ),
            ),
            Builder(
              builder: (context) {
                if (requireSwitch) {
                  return Switch(
                    value: switchState,
                    onChanged: (bool state){
                      function(state);
                    }
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
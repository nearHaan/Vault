import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:vault_app/utils/dimensions.dart';
import 'package:vault_app/utils/styles.dart';

// ignore: must_be_immutable
class SearchButton extends StatelessWidget {
  int mode;
  final Function onPressed;
  final Function onChanged;
  final TextEditingController controller;
  final Function onSearchDismiss;
  SearchButton({
    super.key,
    required this.mode,//0-Search button, 1-TextField
    required this.onPressed,
    required this.onChanged,
    required this.controller,
    required this.onSearchDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GestureDetector(
        onTap: () {
          onPressed(controller);
        },
        child: Container(
          height: Dimensions.screenHeight*0.05,
          padding: EdgeInsets.all(Dimensions.xxPad*0.5),
          margin: EdgeInsets.symmetric(vertical: Dimensions.xxPad),
          decoration: BoxDecoration(
            color: Styles.lightGrey,
            borderRadius: BorderRadius.circular(Dimensions.radius10),
          ),
          child: mode==0? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Search',
                style: Styles.smallTextStyle,
              ),
              Icon(
                FluentIcons.search_24_regular,
                color: Styles.black
              )
            ],
          ):Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: (value) {
                    onChanged(value);
                  },
                  autofocus: true,
                  scrollPhysics: const AlwaysScrollableScrollPhysics(),
                ),
              ),
              GestureDetector(
                onTap: () {
                  onSearchDismiss();
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    FluentIcons.dismiss_24_regular
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
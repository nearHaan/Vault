import 'package:flutter/material.dart';
import 'package:vault_app/screens/settings/widgets/qn_edit_tile.dart';
import 'package:vault_app/utils/dimensions.dart';
import 'package:vault_app/utils/styles.dart';

class QuestionEditBox extends StatelessWidget {
  final List<String> qnList;
  final Function onQnChanged;
  final int selected;
  const QuestionEditBox({
    super.key,
    required this.qnList,
    required this.onQnChanged,
    required this.selected,
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
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: qnList.length,
        itemBuilder: (context, index) {
          return QuestionEditTile(
            title: qnList[index],
            onTap: onQnChanged,
            index: index,
            selected: selected,
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:vault_app/utils/styles.dart';

class DetailsTitleAndEmail extends StatelessWidget {
  final String title;
  final String email;
  final String lastUpdate;
  const DetailsTitleAndEmail({
    super.key,
    required this.title,
    required this.email,
    required this.lastUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Styles.bigThinTextStyle.copyWith(color: Styles.darkBlue),
          overflow: TextOverflow.ellipsis,
          textWidthBasis: TextWidthBasis.parent,
        ),
        Text(
          email,
          style: Styles.smallTextStyle,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          lastUpdate,
          style: Styles.smallTextStyle.copyWith(color: Styles.verdigris),
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
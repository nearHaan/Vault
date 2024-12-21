import 'package:flutter/material.dart';
import 'package:vault_app/screens/view_pass/widgets/title_value_set.dart';

class PasswordDetailsList extends StatelessWidget {
  final String username;
  final String addDetails;
  const PasswordDetailsList({
    super.key,
    required this.username,
    required this.addDetails,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        TitleValueSet(
          title: 'Username',
          value: username,
        ),
        TitleValueSet(
          title: 'Additional Details',
          value: addDetails,
        ),
      ],
    );
  }
}
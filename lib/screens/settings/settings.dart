import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vault_app/controllers/home_controller.dart';
import 'package:vault_app/controllers/passcode_controller.dart';
import 'package:vault_app/screens/settings/widgets/answer_box.dart';
import 'package:vault_app/screens/settings/widgets/qn_edit_box.dart';
import 'package:vault_app/screens/settings/widgets/selected_qn_card.dart';
import 'package:vault_app/screens/settings/widgets/settings_card.dart';
import 'package:vault_app/screens/settings/widgets/settings_top_bar.dart';
import 'package:vault_app/utils/dimensions.dart';
import 'package:vault_app/utils/styles.dart';
import 'package:vault_app/widgets/rect_round_btn.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  final HomeController homeController = Get.find<HomeController>();
  final PassCodeController codeController = Get.find<PassCodeController>();
  final TextEditingController ansController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  validate(String text){
    if (codeController.isQnEditOn || codeController.isAnsEditOn) {
      if (_formKey.currentState!.validate()) {
        codeController.onSaveQnAns(ansController.text.trim().toLowerCase());
      }
    } else {
      codeController.onEditQn();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(Dimensions.xPad),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SettingsTopBar(
                  onDismiss: homeController.onDismiss,
                ),
                SettingCard(
                  title: 'Change PassCode',
                  icon: FluentIcons.lock_closed_24_regular,
                  function: codeController.onChangePassCode,
                ),
                GetBuilder<PassCodeController>(
                  builder: (_) {
                    return SettingCard(
                      title: 'Use Biometric Authentication',
                      icon: FluentIcons.fingerprint_24_regular,
                      function: codeController.changeBioAuthUse,
                      requireSwitch: true,
                      switchState: codeController.useAuthState,
                    );
                  }
                ),
                Text(
                  'PASSCODE RECOVERY',
                  style: Styles.smallTextStyle,
                ),
                SizedBox(
                  height: Dimensions.xxPad,
                ),
                GetBuilder<PassCodeController>(
                  builder: (_) {
                    return Container(
                      padding: EdgeInsets.all(Dimensions.xxPad),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius10),
                        color: Styles.lightGrey
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Security Question',
                            style: Styles.smallTextStyle,
                          ),
                          codeController.isQnEditOn?QuestionEditBox(
                            qnList: codeController.recoveryQns,
                            onQnChanged: codeController.onNewQnSel,
                            selected: codeController.selectedQnIndex,
                          ):SelectedQnAnsCard(
                            selectedQn: codeController.recoveryQns[codeController.selectedQnIndex],
                            onClick: codeController.isAnsEditOn?codeController.onEditQn:(){},
                          ),
                          SizedBox(height: Dimensions.xxPad,),
                          Text(
                            'Answer',
                            style: Styles.smallTextStyle,
                          ),
                          codeController.isAnsEditOn?AnswerBox(
                            ansController: ansController,
                            formKey: _formKey,
                          ):SelectedQnAnsCard(
                            selectedQn: codeController.answer,
                          ),
                          SizedBox(height: Dimensions.xxPad,),
                          RectRoundBtn(text: (codeController.isQnEditOn || codeController.isAnsEditOn)?'Save':'Edit', onPressed: validate)
                        ],
                      ),
                    );
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
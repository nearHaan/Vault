import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vault_app/controllers/passcode_controller.dart';
import 'package:vault_app/screens/settings/widgets/answer_box.dart';
import 'package:vault_app/screens/settings/widgets/qn_edit_box.dart';
import 'package:vault_app/utils/dimensions.dart';
import 'package:vault_app/utils/styles.dart';
import 'package:vault_app/widgets/rect_round_btn.dart';

class ForgotPassCodeBS extends StatelessWidget {
  final String scenario;
  ForgotPassCodeBS({
    super.key,
    required this.scenario,
  });

  final PassCodeController controller = Get.find<PassCodeController>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController ansController = TextEditingController();

  onValidate(String text){
    if (_formKey.currentState!.validate()) {
      if (scenario == 'first') {
        controller.setSecurityAns(ansController.text.trim().toLowerCase());
      } else {
        controller.validateAns(ansController.text.trim().toLowerCase());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PassCodeController>(
      builder: (_) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(Dimensions.xxPad),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius10),
            color: Styles.white
          ),
          child: Scrollbar(
            thumbVisibility: scenario=='first'?false:true,
            thickness: 5,
            radius: const Radius.circular(5),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(Dimensions.xxPad),
                    child: Text(
                      'Security Question',
                      style: Styles.bigBoldTextStyle,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        scenario=='first'?'In case you forget your PassCode':'Please enter your saved answer',
                        style: Styles.smallTextStyle,
                      ),
                      SizedBox(
                        height: Dimensions.xxPad,
                      ),
                      Text(
                        'Question',
                        style: Styles.smallTextStyle,
                      ),
                      QuestionEditBox(
                        qnList: controller.recoveryQns,
                        onQnChanged: controller.onTempNewQnSel,
                        selected: controller.selectedTempQnIndex,
                      ),
                      SizedBox(height: Dimensions.xxPad,),
                      Text(
                        'Answer',
                        style: Styles.smallTextStyle,
                      ),
                      AnswerBox(
                        ansController: ansController,
                        formKey: _formKey,
                      ),
                      SizedBox(height: Dimensions.xxPad,),
                      RectRoundBtn(text: scenario=='first'?'Save':'Validate', onPressed: onValidate)
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
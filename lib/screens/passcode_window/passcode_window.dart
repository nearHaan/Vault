import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vault_app/controllers/passcode_controller.dart';
import 'package:vault_app/screens/passcode_window/widgets/code_btn.dart';
import 'package:vault_app/screens/passcode_window/widgets/forgot_passcode_bs.dart';
import 'package:vault_app/screens/passcode_window/widgets/passcode_top.dart';
import 'package:vault_app/utils/dimensions.dart';
import 'package:vault_app/utils/styles.dart';

// ignore: must_be_immutable
class PassCodePage extends StatelessWidget {
  PassCodePage({super.key});

  PassCodeController controller = Get.put(PassCodeController());

  onForgotPassCode(){
    Get.bottomSheet(
      ForgotPassCodeBS(scenario: 'forgot')
    );
  }

  @override
  Widget build(BuildContext context) {
    // controller.onInit();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.white,
        body: GetBuilder<PassCodeController>(
          builder: (_) {
            return controller.secQnVisible == false?Center(
              child: Padding(
                padding: EdgeInsets.all(Dimensions.passWinPad),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CodePageTop(
                      infoText: controller.infoText,
                      length: controller.passCode.length,
                    ),
                    GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      childAspectRatio: 1,
                      crossAxisSpacing: Dimensions.xxPad,
                      mainAxisSpacing: Dimensions.xxPad,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(
                        12,
                        (index) {
                          if (index != 9) {
                            if (index == 10) {
                              return CodeButton(
                                num: 0,
                                onTapFunc: controller.onNumTap,
                              );
                            } else {
                              return CodeButton(
                                num: index+1,
                                onTapFunc: controller.onNumTap,
                              );
                            }
                          } else {
                            return Container();
                          }
                        }
                      ),
                    ),
                    GetBuilder<PassCodeController>(
                      builder: (_) {
                        return (controller.mode == 0)?Padding(
                          padding: EdgeInsets.only(top: Dimensions.xPad),
                          child: GestureDetector(
                            onTap: onForgotPassCode,
                            child: Text(
                              'Forgot Passcode?',
                              style: Styles.smallTextStyle.copyWith(color: Styles.verdigris),
                            ),
                          ),
                        ): Container();
                      },
                    )
                  ],
                ),
              ),
            ):ForgotPassCodeBS(
              scenario: 'first',
            );
          },
        )
      ),
    );
  }
}
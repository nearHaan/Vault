import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vault_app/controllers/home_controller.dart';
import 'package:vault_app/screens/view_pass/widgets/big_circle_btn.dart';
import 'package:vault_app/screens/view_pass/widgets/details_list.dart';
import 'package:vault_app/screens/view_pass/widgets/light_rect_round_btn.dart';
import 'package:vault_app/screens/view_pass/widgets/pass_show_box.dart';
import 'package:vault_app/screens/view_pass/widgets/square_round_btn.dart';
import 'package:vault_app/screens/view_pass/widgets/title_email_box.dart';
import 'package:vault_app/utils/dimensions.dart';
import 'package:vault_app/utils/styles.dart';

class ViewPassPage extends StatelessWidget {
  ViewPassPage({
    super.key,
  });

  final HomeController controller = Get.find<HomeController>();

  onEdit(){
    controller.onEditClick(controller.tempData!.title);
  }

  copyText(){
    controller.onCopyTap(controller.tempData!.password);
  }

  onDelete(){
    controller.onDeleteClick(controller.tempData!.title);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.white,
        body: GetBuilder<HomeController>(
          builder: (_) {
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.xPad),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: Dimensions.xPad),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: DetailsTitleAndEmail(
                                  title: controller.tempData!.title,
                                  email: controller.tempData!.email==''?'--':controller.tempData!.email,
                                  lastUpdate: 'Last updated on: ${controller.tempData!.lastUpdate}',
                                ),
                              ),
                              BigRoundButton(
                                onPressed: controller.onDismiss,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                PasswordBox(
                                  password: controller.tempData!.password,
                                  onEyeTap: controller.onEyeTap,
                                  onCopy: copyText,
                                  effect: controller.passwordEffect,
                                  reveal: controller.reveal,
                                ),
                                SizedBox(
                                  height: Dimensions.xPad,
                                ),
                                PasswordDetailsList(
                                  username: controller.tempData!.username==''? '--':controller.tempData!.username,
                                  addDetails: controller.tempData!.addDetails==''?'--':controller.tempData!.addDetails,
                            
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.xPad),
                  height: Dimensions.screenHeight*0.1,
                  decoration: BoxDecoration(
                    color: Styles.lightGrey,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LightRectRoundBtn(
                        text: 'Edit',
                        onPressed: onEdit
                      ),
                      SquareRoundBtn(
                        icon: FluentIcons.delete_24_regular,
                        onPressed: onDelete
                      )
                    ],
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
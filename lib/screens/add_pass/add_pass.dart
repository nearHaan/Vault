import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vault_app/controllers/home_controller.dart';
import 'package:vault_app/screens/add_pass/widgets/title_field.dart';
import 'package:vault_app/screens/home/widgets/top_bar.dart';
import 'package:vault_app/utils/dimensions.dart';
import 'package:vault_app/utils/styles.dart';

class AddPass extends StatelessWidget {
  final int mode;
  AddPass({
    super.key,
    required this.mode,
  });

  final TextEditingController titleController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController adDetailsController = TextEditingController();

  final controller = Get.find<HomeController>();
  final _formKey = GlobalKey<FormState>();

  validate(String text){
    if (_formKey.currentState!.validate()) {
      controller.onSave(
        mode,
        titleController.text.trim(),
        usernameController.text,
        passwordController.text,
        emailController.text,
        adDetailsController.text
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (mode == 1) {
      titleController.text = controller.tempData!.title;
      usernameController.text = controller.tempData!.username;
      passwordController.text = controller.tempData!.password;
      emailController.text = controller.tempData!.email;
      adDetailsController.text = controller.tempData!.addDetails;
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.white,
        body: Padding(
          padding: EdgeInsets.all(Dimensions.xxPad),
          child: Column(
            children: [
              TopBar(
                title: mode==0?'Add\nPassword':'Edit\nPassword',
                rectBtnText: 'Save',
                circleBtnBorderColor: Styles.black,
                circleBtnIcon: FluentIcons.dismiss_24_regular,
                onRectBtnTap: validate,
                onCircleBtnTap: controller.onDismiss
              ),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      TitleAndField(
                        title: 'Title',
                        controller: titleController,
                        maxLength: 30,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Enter a valid Title';
                          } else if (controller.keyMap.keys.contains(value.trim().toLowerCase()) && mode == 0){
                            return 'Title already exists';
                          }
                          return null;
                        },
                      ),
                      TitleAndField(
                        title: 'Username',
                        controller: usernameController,
                      ),
                      TitleAndField(
                        title: 'Password',
                        controller: passwordController,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Enter a valid password';
                          }
                          return null;
                        },
                      ),
                      TitleAndField(
                        title: 'Email',
                        controller: emailController,
                      ),
                      TitleAndField(
                        title: 'Additional Details',
                        controller: adDetailsController,
                        fieldHeight: Dimensions.screenHeight*0.2,
                        maxLines: 5,
                        maxLength: 100,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
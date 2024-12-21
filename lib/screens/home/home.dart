import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vault_app/controllers/home_controller.dart';
import 'package:vault_app/screens/home/widgets/pass_list_tile.dart';
import 'package:vault_app/screens/home/widgets/search_btn.dart';
import 'package:vault_app/screens/home/widgets/top_bar.dart';
import 'package:vault_app/utils/dimensions.dart';
import 'package:vault_app/utils/styles.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.put(HomeController());
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.xPad),
          child: GetBuilder<HomeController>(
            builder: (_) {
              return Column(
                children: [
                  TopBar(
                    title: 'Saved\nPasswords',
                    rectBtnText: 'Add',
                    circleBtnBorderColor: Styles.white,
                    circleBtnIcon: FluentIcons.data_bar_horizontal_24_filled,
                    onRectBtnTap: controller.onAddClick,
                    onCircleBtnTap: controller.onSettingsClicked,
                  ),
                  SearchButton(
                    mode: controller.searchMode,
                    onPressed: controller.toggleSearchView,
                    onChanged: controller.searchFilter,
                    controller: searchController,
                    onSearchDismiss: (){
                      controller.toggleSearchView(searchController);
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.dataKeys.length,
                      itemBuilder: (context, index) {
                        return PassListTile(
                          index: index,
                          title: controller.keyMap[controller.dataKeys[index]]!.title,
                          subtitle: controller.keyMap[controller.dataKeys[index]]!.email,
                          onPressed: controller.onItemTap,
                        );
                      },
                    ),
                  )
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
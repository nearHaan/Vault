import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:vault_app/models/pass_model.dart';
import 'package:vault_app/screens/add_pass/add_pass.dart';
import 'package:vault_app/screens/settings/settings.dart';
import 'package:vault_app/screens/view_pass/view_pass.dart';
import 'package:vault_app/utils/dimensions.dart';
import 'package:vault_app/widgets/rect_round_btn.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController{

  Box<PassData> dataBox = Hive.box('data');
  Map<String, PassData> keyMap = {};

  bool _reveal = false;
  List<Effect> _passwordEffect = [];
  int _searchMode = 0;
  late List<String> _dataKeys;

  bool get reveal => _reveal;
  List<Effect> get passwordEffect => _passwordEffect;
  int get searchMode => _searchMode;
  List<String> get dataKeys => _dataKeys;

  @override
  onInit(){
    // dataBox.clear();
    _dataKeys = dataBox.keys.cast<String>().toList();
    for (var key in _dataKeys) {
      keyMap[key] = dataBox.get(key)!;
    }
    
    update();
    super.onInit();
  }

  toggleSearchView(TextEditingController controller){
    if (_searchMode == 0) {
      controller.text = '';
      _searchMode = 1;
    } else {
      _searchMode = 0;
    }
    onInit();
  }

  onAddClick(String text){
    Get.to(AddPass(mode: 0,), transition: Transition.upToDown);
  }

  PassData? _tempData;
  PassData? get  tempData => _tempData;

  onSave(
    int mode,
    String title,
    String username,
    String password,
    String email,
    String addDet,
  ){
    PassData newData = PassData(
      title: title,
      password: password,
      username: username,
      email: email,
      addDetails: addDet,
      lastUpdate: DateFormat('dd-MM-yyyy').format(DateTime.now()),
    );
    if (mode == 0) {
      dataBox.put(title.toLowerCase(),newData);
    } else {
      if (title != _tempData!.title.toLowerCase()) {
        dataBox.delete(_tempData!.title.toLowerCase());
      }
      _tempData = newData;
      dataBox.put(title.toLowerCase(),newData);
    }
    onInit();
    Get.back();
  }

  onItemTap(String title){
    _reveal = false;
    _passwordEffect = [
      const BlurEffect(
        duration: Duration(),
        delay: Duration(),
        curve: Curves.linear
      ),
      const BlurEffect(
        duration: Duration(),
        delay: Duration(),
        curve: Curves.linear
      ),
      const BlurEffect(
        duration: Duration(),
        delay: Duration(),
        curve: Curves.linear
      ),
      const BlurEffect(
        delay: Duration(),
        duration: Duration(),
        curve: Curves.linear
      ),
      const BlurEffect(
        duration: Duration(),
        delay: Duration(),
        curve: Curves.linear
      )
    ];
    _tempData = keyMap[title.toLowerCase()];
    Get.to(ViewPassPage(), transition: Transition.native);
  }

  onDismiss(){
    Get.back();
  }

  onEditClick(String title){
    _tempData = keyMap[title.toLowerCase()];
    Get.to(AddPass(mode: 1,), transition: Transition.upToDown);
    update();
  }

  onDeleteClick(String title){
    Get.showSnackbar(
      GetSnackBar(
        title: 'Delete $title',
        message: 'Are you sure?',
        mainButton: RectRoundBtn(text: 'YES', onPressed: (String text)=>deleteItem(title)),
        snackPosition: SnackPosition.TOP,
        snackStyle: SnackStyle.FLOATING,
        padding: EdgeInsets.all(Dimensions.xxPad),
        animationDuration: const Duration(milliseconds: 500),
      )
    );
  }

  deleteItem(String title){
    Get.closeAllSnackbars();
    Get.back(closeOverlays: true);
    dataBox.delete(title.toLowerCase());
    onInit();
  }

  searchFilter(String text){
    _dataKeys = [];
    for (var key in dataBox.keys) {
      if (key.toLowerCase().contains(text.toLowerCase())) {
        _dataKeys.add(key);
      }
    }
    update();
  }

  onEyeTap(){
    if (_reveal) {
      _passwordEffect = [
        const BlurEffect(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut
        ),
        const BlurEffect(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut
        ),
        const BlurEffect(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut
        ),
        const BlurEffect(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut
        ),
        const BlurEffect(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut
        ),
      ];
      _reveal = false;
    } else {
      _passwordEffect = [];
      _reveal = true;
    }
    update();
  }

  onCopyTap(String text){
    Clipboard.setData(ClipboardData(text: text));
    Get.showSnackbar(const GetSnackBar(message: 'Password copied', duration: Duration(seconds: 2),));
  }

  onSettingsClicked(){
    Get.to(SettingsPage(), transition: Transition.downToUp);
  }
}
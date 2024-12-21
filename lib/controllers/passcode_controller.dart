import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:local_auth/local_auth.dart';
import 'package:vault_app/screens/home/home.dart';
import 'package:vault_app/screens/passcode_window/passcode_window.dart';
import 'package:vault_app/utils/styles.dart';

class PassCodeController extends GetxController with WidgetsBindingObserver {

  final Box _box = Hive.box('utils');
  String _corCode = '';
  String _tempPass = '';
  bool _restart = false;

  int _mode = 0;
  //0 - enter passCode
  //1 - first setup: enter a passCode
  //2 - first setup: enter confirm PassCode
  //3 - change: enter current passCode
  //4 - change: enter new passCode
  //5 - change: enter confirm new passCode

  int get mode => _mode;

  List<String> recoveryQns = [
    'What is your favorite color?',
    'What is your favorite food?',
    'What year would you say was a critical chapter in your story?',
    'What is the name of the town where you were born?',
    'Who was your childhood hero?',
    'What is the name of your first pet?'
  ];
  String _passCode = '';
  String _infoText = 'Enter PassCode';
  bool _useAuthState = false;
  int _selectedQnIndex = 0;
  int _selectedTempQnIndex = -1;
  String _answer = '';
  bool _isQnEditOn = false;
  bool _isAnsEditOn = false;
  bool _secQnVisible = false;

  String get passCode => _passCode;
  String get infoText => _infoText;
  bool get useAuthState => _useAuthState;
  int get selectedQnIndex => _selectedQnIndex;
  int get selectedTempQnIndex => _selectedTempQnIndex;
  String get answer => _answer;
  bool get isQnEditOn => _isQnEditOn;
  bool get isAnsEditOn => _isAnsEditOn;
  bool get secQnVisible => _secQnVisible;

  final LocalAuthentication auth = LocalAuthentication();

  @override
  onInit() async {
    // _box.clear();
    _mode = 0;
    _passCode = '';
    _infoText = 'Enter PassCode';
    _useAuthState = _box.get('is-bio-auth-enabled', defaultValue: false);
    _selectedQnIndex = _box.get('rec-qn-index', defaultValue: 0);
    _selectedTempQnIndex = 0;
    _answer = _box.get('rec-ans', defaultValue: '');
    if (_answer == '') {
      _secQnVisible = true;
    } else {
      if (_box.get('code', defaultValue: '') == '') {
      _mode = 1;
      _infoText = 'Enter a 4 digit PassCode';
    } else {
      _corCode = _box.get('code');
      if (_useAuthState == true) {
        try {
          final bool didAuthenticate = await auth.authenticate(localizedReason: 'or enter PassCode');
          if (didAuthenticate) {
            Get.offAll(HomePage());
          }
        } on PlatformException {
          Get.showSnackbar(GetSnackBar(
            message: 'Biometric authentication failed',
            animationDuration: const Duration(milliseconds: 500),
            snackPosition: SnackPosition.TOP,
            backgroundColor: Styles.red,
            duration: const Duration(seconds: 2),
          ));
        }
      }
    }
    }
    update();
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (_restart) {
        Get.offAll(PassCodePage());
        _restart = false;
        onInit();
      }
    } else if (state == AppLifecycleState.paused) {
      if (!_restart) {
        _restart = true;
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  onNumTap(int num){
    HapticFeedback.heavyImpact();
    if (num != 12) {
      if (_passCode.length < 4) {
        _passCode += num.toString();
        if (_passCode.length == 4){
          if (_mode == 0 || _mode == 3) {
            if (_passCode == _corCode) {
              if (_mode == 0) {
                Get.offAll(HomePage());
              } else {
                _mode = 4;
                _infoText = 'Enter new PassCode';
                _passCode = '';
              }
            } else {
              _passCode = '0000';
              Get.showSnackbar(GetSnackBar(
                message: 'Incorrect PassCode. Re-Enter',
                animationDuration: const Duration(milliseconds: 500),
                snackPosition: SnackPosition.TOP,
                backgroundColor: Styles.red,
                duration: const Duration(seconds: 2),
              ));
              update();
              Future.delayed(const Duration(seconds: 1)).then((value) => {
                _passCode = '',
                update(),
              });
            }
          } else if(_mode == 1 || _mode == 4) {
            _tempPass = _passCode;
            _passCode = '';
            _infoText = 'Enter Confirm PassCode';
            _mode = _mode==1?2:5;
          } else if(_mode == 2 || _mode == 5){
            if (_tempPass == _passCode) {
              _box.put('code', _passCode);
              if (_mode == 2) {
                _corCode = _passCode;
                Get.offAll(HomePage());
              } else {
                Get.back(closeOverlays: true);
              }
              Get.showSnackbar(GetSnackBar(message: _mode==2?'PassCode set':'PassCode updated', duration: const Duration(seconds: 2),));
            } else {
              _passCode = '0000';
              Get.showSnackbar(GetSnackBar(
                message: 'PassCode does not mactch. Re-Enter',
                animationDuration: const Duration(milliseconds: 500),
                snackPosition: SnackPosition.TOP,
                backgroundColor: Styles.red,
                duration: const Duration(seconds: 2),
              ));
              update();
              Future.delayed(const Duration(seconds: 1)).then((value) => {
                _passCode = '',
                _mode = _mode==2?1:4,
                _infoText = _mode==2?'Enter a 4 digit PassCode':'Enter new PassCode',
                update(),
              });
            }
          }
        }
      }
    } else {
      if (_passCode.isNotEmpty) {
        _passCode = _passCode.substring(0, _passCode.length-1);
      }
    }
  update();
  }

  onChangePassCode(){
    Get.to(PassCodePage());
    _passCode = '';
    _mode = 3;
    _infoText = 'Enter current PassCode';
    update();
  }

  changeBioAuthUse(bool state) async {
    if (state) {
      if (await auth.canCheckBiometrics && (await auth.isDeviceSupported())) {
        _box.put('is-bio-auth-enabled', true);
        _useAuthState = true;
      } else {
        Get.showSnackbar(GetSnackBar(
          message: 'Some Error occured',
          animationDuration: const Duration(milliseconds: 500),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Styles.red,
          duration: const Duration(seconds: 2),
        ));
      }
    } else {
      _box.put('is-bio-auth-enabled', false);
      _useAuthState = false;
    }
    update();
  }

  onEditQn(){
    _isQnEditOn = true;
    _isAnsEditOn = true;
    update();
  }

  onNewQnSel(int index){
    _selectedQnIndex = index;
    update();
  }

  onTempNewQnSel(int index){
    _selectedTempQnIndex = index;
    update();
  }

  onSaveQnAns(String ans){
    _answer = ans;
    _box.put('rec-qn-index', _selectedQnIndex);
    _box.put('rec-ans', ans);
    _isQnEditOn = false;
    _isAnsEditOn = false;
    update();
  }

  setSecurityAns(String ans){
    _box.put('rec-qn-index', _selectedTempQnIndex);
    _box.put('rec-ans', ans);
    _secQnVisible = false;
    onInit();
    update();
  }

  validateAns(String ans){
    if (_selectedTempQnIndex == _selectedQnIndex && ans == _answer) {
      _box.delete('code');
      Get.close(1);
      Get.showSnackbar(GetSnackBar(
        message: 'Enter a new PassCode',
        animationDuration: const Duration(milliseconds: 500),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Styles.fernGreen,
        duration: const Duration(seconds: 2),
      ));
      onInit();
    } else {
      Get.showSnackbar(GetSnackBar(
        message: 'Icorrect Question and Answer. Try Again',
        animationDuration: const Duration(milliseconds: 500),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Styles.red,
        duration: const Duration(seconds: 2),
      ));
    }
  }
}
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vault_app/models/pass_model.dart';
import 'package:vault_app/screens/passcode_window/passcode_window.dart';
import 'package:vault_app/utils/styles.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
  ]);
  const secureStorage = FlutterSecureStorage();
  // if key not exists return null
  final encryptionKeyString = await secureStorage.read(key: 'sec_key');
  if (encryptionKeyString == null) {
    final key = Hive.generateSecureKey();
    await secureStorage.write(
      key: 'sec_key',
      value: base64UrlEncode(key),
    );
  }
  final key = await secureStorage.read(key: 'sec_key');
  final encryptionKeyUint8List = base64Url.decode(key!);
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(PassDataAdapter());
  await Hive.openBox('utils', encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
  await Hive.openBox<PassData>('data', encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vault',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Styles.darkBlue),
        useMaterial3: true,
      ),
      home: PassCodePage()
    );
  }
}
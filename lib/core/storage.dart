import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const AndroidOptions androidOptions = AndroidOptions(
  encryptedSharedPreferences: true,
);

const FlutterSecureStorage storage = FlutterSecureStorage(
  aOptions: androidOptions,
);

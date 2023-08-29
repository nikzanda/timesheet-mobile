import 'package:flutter_secure_storage/flutter_secure_storage.dart';
export 'storage.dart' show storage;

const AndroidOptions androidOptions = AndroidOptions(
  encryptedSharedPreferences: true,
);

const IOSOptions iosOptions = IOSOptions(
  groupId: 'YOUR_GROUP_ID',
);

const FlutterSecureStorage storage = FlutterSecureStorage(
  aOptions: androidOptions,
  iOptions: iosOptions,
);

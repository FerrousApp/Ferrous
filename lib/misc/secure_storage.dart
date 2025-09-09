import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> writeToSecureStorage(String key, dynamic value) async {
  // init secure storage
  const storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  // write to secure storage
  await storage.write(key: key, value: value.toString());
}

/// retrieve access token from flutter secure storage
Future<String?> readFromSecureStorage(String key) async {
  String? value;

  const storage = FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));

  value = await storage.read(key: key);

  return value;
}

Future<void> deleteFromSecureStorage(String key) async {
  const storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  await storage.delete(key: key);
}

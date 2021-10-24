import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String apiKey = dotenv.get('PUBLICKEY');
  static String pk = dotenv.get('PRIVATEKEY');
  static int timestamp = DateTime.now().millisecondsSinceEpoch;
  static String hash =
      md5.convert(utf8.encode("$timestamp$pk$apiKey")).toString();
}

import 'dart:convert';
import 'package:flutter/services.dart';

class Database {
  static late dynamic DatabaseA;
  static late dynamic DatabaseB;

  static Future<List<dynamic>> getDB(String filePath) async {
    // Load the JSON file from assets
    final jsonString = await rootBundle.loadString(filePath);

    // Decode the JSON
    final jsonData = jsonDecode(jsonString);

    // Ensure the data is a list
    if (jsonData is List) {
      return jsonData;
    } else {
      throw const FormatException('Expected a list in the JSON file');
    }
  }
}

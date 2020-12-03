import 'dart:convert';

import 'package:zpastel/gateway/HttpGateway.dart';
import 'package:zpastel/model/Flavor.dart';

class FlavorRepository {
  HttpGateway _httpGateway;

  FlavorRepository() {
    _httpGateway = new HttpGateway();
  }

  Future<List<Flavor>> findAll() async {
    final response = await _httpGateway.get('http://10.0.2.2:49985/api/pasteis');

    return parseFlavors(response.body);
  }

  List<Flavor> parseFlavors(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Flavor>((json) => Flavor.fromJson(json)).toList();
  }
}

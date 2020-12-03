import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zpastel/model/StorableEntity.dart';

class HttpGateway {
  HttpGateway();

  Future<http.Response> get(String url) async {
    return await http.get(url);
  }

  Future<http.Response> post(url, StorableEntity body) async {
    var json = jsonEncode(body.toJson());
    try {
      return await http.post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body:'{"id":null,"orderItems":[{"id":null,"orderId":null,"quantity":1,"ingredients":null,"flavor":{"id":3,"name":"Pastel de Calabresa com Catupiry","ingredients":"Calabresa e Catupiry","price":5.5,"flavorImageUrl":"https://www.goomer.app/webmenu/pastelaria-barao-rp/product/1020048/picture/medium/200626212205","createdById":1,"createdOn":"2020-11-12T12:18:16.676666","lastModifiedById":1,"lastModifiedOn":"2020-11-12T12:18:16.676666"},"extraInformation":"","createdById":null,"createdOn":null,"lastModifiedById":null,"lastModifiedOn":null}],"createdByUsername":null,"createdById":null,"createdOn":null,"lastModifiedById":null,"lastModifiedOn":null}');
    }
    catch(e) {
      return null;
    }
  }
}

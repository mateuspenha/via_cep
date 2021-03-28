import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:via_cep/src/extensions/string_extensions.dart';
import 'package:via_cep/src/models/via_cep_address.dart';

class ViaCep {
  static const String _serviceUrl = 'https://viacep.com.br/ws/:cep/json';

  static Future<ViaCepAddress> search(String cep) async {
    cep = cep.getValidatedCEP();

    final url = Uri.parse(_serviceUrl.replaceAll(':cep', cep));

    var response = await http.get(url);

    if (response.statusCode == 400) {
      throw Exception('Bad request. Please check the cep.');
    } else if (response.statusCode != 200) {
      throw Exception('Bad response from VIA Cep service');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    if (json.containsKey('erro') == true && json['erro'] == true) {
      throw Exception('The ViaCEP API returned an error');
    }

    return ViaCepAddress.fromJson(json);
  }
}

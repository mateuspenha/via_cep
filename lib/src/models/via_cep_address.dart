import 'package:via_cep/src/extensions/string_extensions.dart';

class ViaCepAddress {
  final String uf;
  final String localidade;
  final String cep;
  final String ddd;
  final String bairro;
  final String? logradouro;
  final String? complemento;
  final String? unidade;
  final String? ibge;
  final String? gia;
  final String? siafi;

  ViaCepAddress({
    required this.uf,
    required this.localidade,
    required this.cep,
    required this.ddd,
    required this.bairro,
    this.logradouro,
    this.complemento,
    this.unidade,
    this.ibge,
    this.gia,
    this.siafi,
  });

  factory ViaCepAddress.fromJson(Map<String, dynamic> data) {
    return ViaCepAddress(
      uf: data['uf'],
      localidade: data['localidade'],
      cep: data['cep'],
      ddd: data['ddd'],
      bairro: data['bairro'],
      logradouro: (data['logradouro'] as String?).nullWhenEmptySpace(),
      complemento: (data['complemento'] as String?).nullWhenEmptySpace(),
      unidade: (data['unidade'] as String?).nullWhenEmptySpace(),
      ibge: (data['ibge'] as String?).nullWhenEmptySpace(),
      gia: (data['gia'] as String?).nullWhenEmptySpace(),
      siafi: (data['siafi'] as String?).nullWhenEmptySpace(),
    );
  }
}

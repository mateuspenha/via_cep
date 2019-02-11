import 'package:via_cep/via_cep.dart';

main() async {
  var CEP = new via_cep();

  var result = await CEP.searchCEP('12512170', 'json', '');

  // Sucesso
  if (CEP.getResponse() == 200) {
    print('CEP: '+CEP.getCEP());
    print('Logradouro: '+CEP.getLogradouro());
    print('Complemento: '+CEP.getComplemento());
    print('Bairro: '+CEP.getBairro());
    print('Localidade: '+CEP.getLocalidade());
    print('UF: '+CEP.getUF());
    print('Unidade: '+CEP.getUnidade());
    print('IBGE '+CEP.getIBGE());
    print('GIA: '+CEP.getGIA());
  } else {
    print('Código de Retorno: '+CEP.getResponse().toString());
    print('Erro: '+CEP.getBody());
  }
}
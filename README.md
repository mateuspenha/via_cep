Package para integração com API ViaCEP (https://www.viacep.com.br). Se você estava procurando um webservice gratuito e de alto desempenho para consultar Códigos de Endereçamento Postal (CEP) do Brasil? Utilize o serviço, melhore a qualidade de suas aplicações e colabore para manter esta base de dados atualizada.

## Uso

Um simples exemplo de uso:

```dart
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
  // Falha
  } else {
    print('Código de Retorno: '+CEP.getResponse().toString());
    print('Erro: '+CEP.getBody());
  }
}
```

## Recursos

searchCEP - Método que realiza a consulta do CEP.

    Parâmetros: searchCEP(String CEP, output, sensitive)
        Srting CEP = CEP (somente números, sem caracteres especiais e com 8 digitos)
        
        String output = Tipo de saída de dados, para retorno por meio de get() é indiferente ao usuário, porém para retorno do Body haverá diferenciação (recomenda-se sempre usar json).
            Opções: json
                    xml
                    piped
                    querty
                    
        String sensitive = Tipo de saída dos dados, normal, lowercase ou upppercase.
            Opções: '' (em branco) ou null
                    lower
                    uper
                    
             Qualquer formato texto informado não reconhecido será inerpretad como branco ou nulo.

gets

    getBody(); // Retorna na integralidade a resposta da API.
    getResponse(); // Retorna o código da consulta a API (Padrão 200 para sucesso).
    
    Quando houver sucesso (código 200) os métodos abaixo trazem retorno, do contrário retornam null;
    
    getCEP(); // Recupera o CEP (formatado). 
    getLogradouro(); // Recupera o Lograouro (Ex.: Rua... Avenida, Etc.).
    getComplemento(); // Recupera o Complemento.
    getBairro(); // Recupera o Bairro.
    getLocalidade(); // Recupera a Cidade do CEP.
    getUF(); // Recupera o Estado (sigla) do CEP.
    getUnidade(); // Recupera a Unidade do CEP. 
    getIBGE(); // Recupera o Código de Município IBGE do CEP.
    getGIA(); // Recupera o Código GIA do CEP.
    
    
Para conhecer melhor o funcionamento acesse o site de origem da API (https://www.viacep.com.br)

## Funcionalidades e Bugs

Por favor para requisições de funcionalidades e bugs [issue tracker][tracker].

[tracker]: https://github.com/mateuspenha/via_cep/issues
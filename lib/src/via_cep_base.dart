import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart' as xml;
import 'dart:convert';

class via_cep {
  String _URLBase = 'https://viacep.com.br/ws/';

  String _Body;

  int _Response;

  String _LastCEP;

  String _sensitive;

  // variables return
  String _return01, _return02, _return03, _return04, _return05, _return06, _return07, _return08, _return09;

  via_cep() {
    clear();

    _LastCEP = null;

    _Body = null;

    _Response = null;
  }

  void clear() {
    _return01 = null;
    _return02 = null;
    _return03 = null;
    _return04 = null;
    _return05 = null;
    _return06 = null;
    _return07 = null;
    _return08 = null;
    _return09 = null;

    _sensitive = null;
  }

  Future searchCEP(String CEP, output, sensitive) async {
    _LastCEP = CEP;

    _sensitive = sensitive.toString().toLowerCase().trim();

    String _URLAccess = _URLBase+CEP+'/'+output;

    var response = await http.get(_URLAccess);

    _Response = response.statusCode;
    _Body = response.body;

    if (_Response != 200)
      clear();
    else {
      if (output == 'json') {
        Map<String, dynamic> CEPdata = jsonDecode(_Body);

        _return01 = CEPdata['cep'];
        _return02 = CEPdata['logradouro'];
        _return03 = CEPdata['complemento'];
        _return04 = CEPdata['bairro'];
        _return05 = CEPdata['localidade'];
        _return06 = CEPdata['uf'];
        _return07 = CEPdata['unidade'];
        _return08 = CEPdata['ibge'];
        _return09 = CEPdata['gia'];

      } else if (output == 'xml') {
        xml.Xml2Json myTransformer = xml.Xml2Json();

        String content = _Body;

        myTransformer.parse(content);

        content = myTransformer.toParker();

        Map<String, dynamic> CEPdata = jsonDecode(content)['xmlcep'];

        _return01 = CEPdata['cep'];
        _return02 = CEPdata['logradouro'];
        _return03 = CEPdata['complemento'];
        _return04 = CEPdata['bairro'];
        _return05 = CEPdata['localidade'];
        _return06 = CEPdata['uf'];
        _return07 = CEPdata['unidade'];
        _return08 = CEPdata['ibge'];
        _return09 = CEPdata['gia'];

      } else if (output == 'piped') {
        var text = _Body.split('|');

        _return01 = text[0].split(':')[1];
        _return02 = text[1].split(':')[1];
        _return03 = text[2].split(':')[1];
        _return04 = text[3].split(':')[1];
        _return05 = text[4].split(':')[1];
        _return06 = text[5].split(':')[1];
        _return07 = text[6].split(':')[1];
        _return08 = text[7].split(':')[1];
        _return09 = text[8].split(':')[1];
      } else if (output == 'querty') {
        var text = _Body.replaceAll('+', ' ').split('&');

        _return01 = text[0].split('=')[1];
        _return02 = text[1].split('=')[1];
        _return03 = text[2].split('=')[1];
        _return04 = text[3].split('=')[1];
        _return05 = text[4].split('=')[1];
        _return06 = text[5].split('=')[1];
        _return07 = text[6].split('=')[1];
        _return08 = text[7].split('=')[1];
        _return09 = text[8].split('=')[1];
      }

    }

  }

  String getBody() {
    return _Body;
  }

  int getResponse() {
    return _Response;
  }

  String getLastCEP() {
    return _LastCEP;
  }

  String getCEP() {
    return _return01;
  }

  String getLogradouro() {
    if (_sensitive != null) {
      if (_sensitive == 'lower') {
        return _return02.toLowerCase();
      } else if (_sensitive == 'upper') {
        return _return02.toUpperCase();
      } else {
        return _return02;
      }
    } else {
      return _return02;
    }
  }

  String getComplemento() {
    if (_sensitive != null) {
      if (_sensitive == 'lower') {
        return _return03.toLowerCase();
      } else if (_sensitive == 'upper') {
        return _return03.toUpperCase();
      } else {
        return _return03;
      }
    } else {
      return _return03;
    }
  }

  String getBairro() {
    if (_sensitive != null) {
      if (_sensitive == 'lower') {
        return _return04.toLowerCase();
      } else if (_sensitive == 'upper') {
        return _return04.toUpperCase();
      } else {
        return _return04;
      }
    } else {
      return _return04;
    }
  }

  String getLocalidade() {
    if (_sensitive != null) {
      if (_sensitive == 'lower') {
        return _return05.toLowerCase();
      } else if (_sensitive == 'upper') {
        return _return05.toUpperCase();
      } else {
        return _return05;
      }
    } else {
      return _return05;
    }
  }

  String getUF() {
    if (_sensitive != null) {
      if (_sensitive == 'lower') {
        return _return06.toLowerCase();
      } else if (_sensitive == 'upper') {
        return _return06.toUpperCase();
      } else {
        return _return06;
      }
    } else {
      return _return06;
    }
  }

  String getUnidade() {
    if (_sensitive != null) {
      if (_sensitive == 'lower') {
        return _return07.toLowerCase();
      } else if (_sensitive == 'upper') {
        return _return07.toUpperCase();
      } else {
        return _return07;
      }
    } else {
      return _return07;
    }
  }

  String getIBGE() {
    if (_sensitive != null) {
      if (_sensitive == 'lower') {
        return _return08.toLowerCase();
      } else if (_sensitive == 'upper') {
        return _return08.toUpperCase();
      } else {
        return _return08;
      }
    } else {
      return _return08;
    }
  }

  String getGIA() {
    if (_sensitive != null) {
      if (_sensitive == 'lower') {
        return _return09.toLowerCase();
      } else if (_sensitive == 'upper') {
        return _return09.toUpperCase();
      } else {
        return _return09;
      }
    } else {
      return _return09;
    }
  }

}
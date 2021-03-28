import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:via_cep/via_cep.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _cepController = TextEditingController();

  ViaCepAddress? _address;
  String? _error;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Buscar CEP'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(55),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CupertinoTextField(
                  controller: _cepController,
                  textAlign: TextAlign.center,
                  placeholder: 'Digite o CEP aqui',
                  keyboardType: TextInputType.number,
                  maxLength: 8,
                  onChanged: (_) {
                    setState(() {
                      _error = null;
                    });
                  },
                ),
                if (_error != null)
                  Text(
                    _error!,
                    style: TextStyle(color: Colors.red),
                  ),
                Container(
                  height: 10,
                ),
                if (loading == false)
                  ElevatedButton(
                    onPressed: () async {
                      if (loading == true) {
                        return;
                      }

                      setState(() {
                        _error = null;
                        _address = null;
                        loading = true;
                      });

                      try {
                        _address = await ViaCep.search(_cepController.text);
                      } catch (e) {
                        setState(() {
                          if (e is Exception) {
                            _error = e.toString();
                          } else {
                            _error = 'Erro ao buscar CEP';
                          }
                          _address = null;
                        });
                      }

                      setState(() {
                        loading = false;
                      });
                    },
                    child: Text('Buscar'),
                  ),
                if (loading == true) CircularProgressIndicator(),
                if (_address != null)
                  Column(
                    children: [
                      Row(children: [
                        Text(
                          'CEP: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(_address!.cep)
                      ]),
                      Row(children: [
                        Text(
                          'UF: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(_address!.uf)
                      ]),
                      Row(children: [
                        Text(
                          'Localidade: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(_address!.localidade)
                      ]),
                      Row(children: [
                        Text(
                          'DDD: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(_address!.ddd)
                      ]),
                      Row(children: [
                        Text(
                          'Bairro: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(_address!.bairro)
                      ]),
                      Row(children: [
                        Text(
                          'Logradouro: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text((_address!.logradouro ?? ''))
                      ]),
                      Row(children: [
                        Text(
                          'Complemento: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text((_address!.complemento ?? ''))
                      ]),
                      Row(children: [
                        Text(
                          'Unidade: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text((_address!.unidade ?? ''))
                      ]),
                      Row(children: [
                        Text(
                          'IBGE: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text((_address!.ibge ?? ''))
                      ]),
                      Row(children: [
                        Text(
                          'SIAFI: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text((_address!.siafi ?? ''))
                      ]),
                    ],
                  ),
              ],
            ),
          ),
        ));
  }
}

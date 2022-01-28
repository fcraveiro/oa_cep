import 'package:flutter/material.dart';
import 'package:oa_cep/oa_cep.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//var campo = '';

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca Cep'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<ViaCepProcura>(
              future: ViaCepProcura.getInstance('11060410'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.cep == '99999999') {
                    return Text(snapshot.data!.bairro.toString());
                  } else {
                    return Column(
                      children: [
                        Text(snapshot.data!.cep.toString()),
                        Text(snapshot.data!.logradouro.toString()),
                        Text(snapshot.data!.complemento.toString()),
                        Text(snapshot.data!.bairro.toString()),
                        Text(snapshot.data!.localidade.toString()),
                        Text(snapshot.data!.uf.toString()),
                        Text(snapshot.data!.ibge.toString()),
                        Text(snapshot.data!.gia.toString()),
                        Text(snapshot.data!.ddd.toString()),
                        Text(snapshot.data!.siafi.toString()),
                      ],
                    );
                  }
                } else if (snapshot.hasError) {
                  return const Text('erro');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

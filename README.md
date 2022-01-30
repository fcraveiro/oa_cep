## Getting started

dependencies:
  flutter:
    sdk: flutter
  oa_cep: ^1.0.1

## Usage

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


## Additional information

Package utilizado no app odonto

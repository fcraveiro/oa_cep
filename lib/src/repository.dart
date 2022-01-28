library oa_cep;

import 'dart:developer';

import 'package:dio/dio.dart';
import 'model.dart';

class ViaCepRepository {
  Future<ViaCepProcura> getViaCep(String cep) async {
    var response = await Dio().get('https://viacep.com.br/ws/11060430/json/');
    ViaCepProcura campo = ViaCepProcura.fromJson(response.data);
    if (campo.logradouro == null) {
      campo.cep = '99999999';
    }
    log(campo.bairro.toString());
    return campo;
  }
}

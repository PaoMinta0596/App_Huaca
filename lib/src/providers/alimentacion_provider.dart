import 'dart:convert';

import 'package:app_atractivos/src/models/alimentacion_model.dart';
import 'package:http/http.dart' as http;

class AlimentacionProvider {
  final String _url = 'https://sitioshuaca-default-rtdb.firebaseio.com';

  Future<List<AlimentacionModel>> cargarAlimentacion() async {
    final url = Uri.parse('$_url/alimentacion.json');
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);

    final List<AlimentacionModel> alimentacion = new List();
    if (decodedData == null) return [];
    decodedData.forEach((id, ali) {
      final aliTemp = AlimentacionModel.fromJson(ali);
      aliTemp.id = id;
      alimentacion.add(aliTemp);
      //print(sit);
    });

    return alimentacion;
  }
}

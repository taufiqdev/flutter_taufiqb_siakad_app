import 'package:dartz/dartz.dart';
import 'package:flutter_taufiqb_siakad_app/common/constants/variables.dart';
import 'package:flutter_taufiqb_siakad_app/data/models/response/khs_response_model.dart';
import 'package:http/http.dart' as http;

import 'auth_local_datasource.dart';

class KhsRemoteDatasource {
  Future<Either<String, KhsResponseModel>> getKhs() async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'authorization': 'Bearer ${await AuthLocalDatasource().getToken()}',
    };
    final response = await http.get(Uri.parse('${Variables.baseUrl}/api/khs'),
        headers: headers);
    if (response.statusCode == 200) {
      return Right(KhsResponseModel.fromJson(response.body));
    } else {
      return const Left('server error');
    }
  }
}
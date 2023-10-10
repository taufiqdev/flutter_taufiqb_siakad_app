import 'package:bloc/bloc.dart';
import 'package:flutter_taufiqb_siakad_app/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_taufiqb_siakad_app/data/models/request/auth_request_model.dart';
import 'package:flutter_taufiqb_siakad_app/data/models/response/auth_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(_Initial()) {
    on<_Login>((event, emit) async {
      emit(_Loading());
      final response = await AuthRemoteDatasource().login(event.requestModel);
      response.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r)));
    });
  }
}

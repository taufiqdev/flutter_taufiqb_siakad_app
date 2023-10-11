import 'package:bloc/bloc.dart';
import 'package:flutter_taufiqb_siakad_app/data/datasources/auth_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_event.dart';
part 'logout_state.dart';
part 'logout_bloc.freezed.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(_Initial()) {
    on<_Logout>((event, emit) async {
      emit(_Loading());
      final response = await AuthRemoteDatasource().logout();
      response.fold((l) => emit(_Error()), (r) => _Loaded());
    });
  }
}

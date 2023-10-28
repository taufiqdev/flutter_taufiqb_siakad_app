import 'package:bloc/bloc.dart';
import 'package:flutter_taufiqb_siakad_app/data/datasources/khs_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/response/khs_response_model.dart';

part 'khs_event.dart';
part 'khs_state.dart';
part 'khs_bloc.freezed.dart';

class KhsBloc extends Bloc<KhsEvent, KhsState> {
  KhsBloc() : super(_Initial()) {
    on<_GetKhs>((event, emit) async {
      emit(_Loading());
      final response = await KhsRemoteDatasource().getKhs();
      response.fold((l) => emit(_Error(l)), (r) => _Loaded(r.data));
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:google_maps_api_app/domain/entity/charge_point_address.dart';
import 'package:google_maps_api_app/domain/usecase/get_place_by_id.dart';
import 'package:google_maps_api_app/presentation/bloc/state.dart';
import 'package:google_maps_api_app/presentation/bloc/status.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.dart';
part 'state.dart';
part 'bloc.freezed.dart';

class ChargePointAddressBloc
    extends Bloc<ChargePointAddressEvent, ChargePointAddressState> {
  final GetPlaceByIdUseCase _getPlaceByIdUseCase;
  ChargePointAddressBloc(this._getPlaceByIdUseCase)
      : super(ChargePointAddressState(
          status: BlocStatus.Loading,
          chargePointAddress: ChargePointAddress(null, null),
        )) {
    on<ChargePointAddressEvent>(
      (ChargePointAddressEvent event,
          Emitter<ChargePointAddressState> emit) async {
        await event.when(
          getPlaceById: (String xid, String apikey) =>
              _getPlaceById(emit, xid, apikey),
        );
      },
    );
  }

  Future<void> _getPlaceById(
      Emitter<ChargePointAddressState> emit, String xid, String apikey) async {
    emit(_loadingState());
    emit(await _getPlaceByIdUseCase(xid, apikey)
        .then(
            (ChargePointAddress chargePointAddress) => ChargePointAddressState(
                  status: BlocStatus.Loaded,
                  chargePointAddress: chargePointAddress,
                ))
        .catchError(_onError));
  }

  ChargePointAddressState _loadingState() => ChargePointAddressState(
        status: BlocStatus.Loading,
        chargePointAddress: state.chargePointAddress,
      );

  Future<ChargePointAddressState> _onError(Object error) async =>
      ChargePointAddressState(
        status: BlocStatus.Error,
        chargePointAddress: state.chargePointAddress,
        error: error,
      );
}

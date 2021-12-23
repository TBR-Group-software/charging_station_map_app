import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_api_app/domain/entity/charge_point.dart';
import 'package:google_maps_api_app/domain/entity/charge_point_address.dart';
import 'package:google_maps_api_app/domain/usecase/get_place_by_id.dart';
import 'package:google_maps_api_app/domain/usecase/get_places_by_radius.dart';
import 'package:google_maps_api_app/presentation/bloc/state.dart';
import 'package:google_maps_api_app/presentation/bloc/status.dart';

part 'bloc.freezed.dart';
part 'event.dart';
part 'state.dart';

class ChargePointBloc extends Bloc<ChargePointEvent, ChargePointState> {
  final GetPlacesByRadiusUseCase _getPlacesByRadiusUseCase;
  final GetPlaceByIdUseCase _getPlaceByIdUseCase;
  ChargePointBloc(this._getPlacesByRadiusUseCase, this._getPlaceByIdUseCase)
      : super(ChargePointState(
          status: BlocStatus.Loading,
          chargePoints: const <ChargePoint>[],
          chargePointAddress: ChargePointAddress(null, null),
        )) {
    on<ChargePointEvent>(
      (ChargePointEvent event, Emitter<ChargePointState> emit) async {
        await event.when(
          getPlacesByRadius: (String kinds, String format, String apikey,
                  String lat, String lon, String radius) =>
              _getPlacesByRadius(emit, kinds, format, apikey, lat, lon, radius),
          getPlaceById: (String xid, String apikey) =>
              _getPlaceById(emit, xid, apikey),
        );
      },
    );
  }

  Future<void> _getPlacesByRadius(
    Emitter<ChargePointState> emit,
    String kinds,
    String format,
    String apikey,
    String lat,
    String lon,
    String radius,
  ) async {
    emit(_loadingState());
    emit(
        await _getPlacesByRadiusUseCase(kinds, format, apikey, lat, lon, radius)
            .then((List<ChargePoint> chargePoint) => ChargePointState(
                  status: BlocStatus.Loaded,
                  chargePoints: chargePoint,
                  chargePointAddress: state.chargePointAddress,
                ))
            .catchError(_onError));
  }

  Future<void> _getPlaceById(
      Emitter<ChargePointState> emit, String xid, String apikey) async {
    //emit(_loadingState());
    emit(await _getPlaceByIdUseCase(xid, apikey)
        .then((ChargePointAddress chargePointAddress) => ChargePointState(
              status: BlocStatus.Loaded,
              chargePoints: state.chargePoints,
              chargePointAddress: chargePointAddress,
            ))
        .catchError(_onError));
  }

  ChargePointState _loadingState() => ChargePointState(
        status: BlocStatus.Loading,
        chargePoints: state.chargePoints,
        chargePointAddress: state.chargePointAddress,
      );

  Future<ChargePointState> _onError(Object error) async => ChargePointState(
        status: BlocStatus.Error,
        chargePoints: state.chargePoints,
        chargePointAddress: state.chargePointAddress,
        error: error,
      );
}

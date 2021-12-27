import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_api_app/domain/entity/charge_point.dart';
import 'package:google_maps_api_app/domain/usecase/get_places_by_radius.dart';
import 'package:google_maps_api_app/presentation/bloc/state.dart';
import 'package:google_maps_api_app/presentation/bloc/status.dart';

part 'bloc.freezed.dart';
part 'event.dart';
part 'state.dart';

class ChargePointBloc extends Bloc<ChargePointEvent, ChargePointState> {
  final GetPlacesByRadiusUseCase _getPlacesByRadiusUseCase;
  ChargePointBloc(this._getPlacesByRadiusUseCase)
      : super(ChargePointState(
          status: BlocStatus.Loading,
          chargePoints: const <ChargePoint>[],
        )) {
    on<ChargePointEvent>(
      (ChargePointEvent event, Emitter<ChargePointState> emit) async {
        await event.when(
          getPlacesByRadius: (String kinds, String format, String apikey,
                  String lat, String lon, String radius) =>
              _getPlacesByRadius(emit, kinds, format, apikey, lat, lon, radius),
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
                ))
            .catchError(_onError));
  }

  ChargePointState _loadingState() => ChargePointState(
        status: BlocStatus.Loading,
        chargePoints: state.chargePoints,
      );

  Future<ChargePointState> _onError(Object error) async => ChargePointState(
        status: BlocStatus.Error,
        chargePoints: state.chargePoints,
        error: error,
      );
}

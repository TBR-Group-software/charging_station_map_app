part of 'bloc.dart';

@immutable
@freezed
abstract class ChargePointEvent with _$ChargePointEvent {
  const ChargePointEvent._();

  const factory ChargePointEvent.getPlacesByRadius(
    String kinds,
    String format,
    String apikey,
    String lat,
    String lon,
    String radius,
  ) = GetPlacesByRadiusEvent;
}

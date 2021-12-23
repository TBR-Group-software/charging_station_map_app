part of 'bloc.dart';

@immutable
@freezed
abstract class ChargePointAddressEvent with _$ChargePointAddressEvent {
  const ChargePointAddressEvent._();

  const factory ChargePointAddressEvent.getPlaceById(
    String xid,
    String apikey,
  ) = GetPlaceByIdEvent;
}

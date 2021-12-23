part of 'bloc.dart';

@immutable
class ChargePointAddressState extends AppBlocState {
  final ChargePointAddress chargePointAddress;

  ChargePointAddressState({
    required BlocStatus status,
    required this.chargePointAddress,
    Object? error,
  }) : super(status: status, error: error);
}

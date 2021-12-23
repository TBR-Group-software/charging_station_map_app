part of 'bloc.dart';

@immutable
class ChargePointState extends AppBlocState {
  final List<ChargePoint> chargePoints;
  final ChargePointAddress chargePointAddress;

  ChargePointState({
    required BlocStatus status,
    required this.chargePoints,
    required this.chargePointAddress,
    Object? error,
  }) : super(status: status, error: error);
}

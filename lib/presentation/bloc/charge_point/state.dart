part of 'bloc.dart';

@immutable
class ChargePointState extends AppBlocState {
  final List<ChargePoint> chargePoints;

  ChargePointState({
    required BlocStatus status,
    required this.chargePoints,
    Object? error,
  }) : super(status: status, error: error);
}

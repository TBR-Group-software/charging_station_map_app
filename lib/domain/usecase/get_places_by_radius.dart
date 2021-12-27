import 'package:google_maps_api_app/domain/entity/charge_point.dart';
import 'package:google_maps_api_app/domain/service/charge_point.dart';

abstract class GetPlacesByRadiusUseCase {
  Future<List<ChargePoint>> call(
    String kinds,
    String format,
    String apikey,
    String lat,
    String lon,
    String radius,
  );
}

class RestGetPlacesByRadiusUseCase implements GetPlacesByRadiusUseCase {
  final ChargePointService _service;
  RestGetPlacesByRadiusUseCase(this._service);

  @override
  Future<List<ChargePoint>> call(String kinds, String format, String apikey,
          String lat, String lon, String radius) =>
      _service.getPlacesByRadius(kinds, format, apikey, lat, lon, radius);
}

import 'package:google_maps_api_app/domain/entity/charge_point_address.dart';
import 'package:google_maps_api_app/domain/service/charge_point.dart';

abstract class GetPlaceByIdUseCase {
  Future<ChargePointAddress> call(
    String xid,
    String apikey,
  );
}

class RestGetPlaceByIdUseCase implements GetPlaceByIdUseCase {
  final ChargePointService _service;
  RestGetPlaceByIdUseCase(this._service);

  @override
  Future<ChargePointAddress> call(String xid, String apikey) =>
      _service.getPlaceById(xid, apikey);
}

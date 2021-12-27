import 'package:google_maps_api_app/domain/entity/charge_point.dart';
import 'package:google_maps_api_app/domain/entity/charge_point_address.dart';

abstract class ChargePointService {
  Future<List<ChargePoint>> getPlacesByRadius(String kinds, String format,
      String apikey, String lat, String lon, String radius);

  Future<ChargePointAddress> getPlaceById(String xid, String apikey);
}

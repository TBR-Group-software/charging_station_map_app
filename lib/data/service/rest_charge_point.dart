import 'package:google_maps_api_app/assembly/factory.dart';
import 'package:google_maps_api_app/data/gateway/rest.dart';
import 'package:google_maps_api_app/data/model/charge_point.dart';
import 'package:google_maps_api_app/data/model/charge_point_address.dart';
import 'package:google_maps_api_app/domain/entity/charge_point.dart';
import 'package:google_maps_api_app/domain/entity/charge_point_address.dart';
import 'package:google_maps_api_app/domain/service/charge_point.dart';

class RestChargePointService implements ChargePointService {
  final RestGateway _gateway;
  final Factory<ChargePoint, ChargePointDto> _factory;
  final Factory<ChargePointAddress, ChargePointAddressDto> _addressFactory;
  RestChargePointService(
    this._gateway,
    this._factory,
    this._addressFactory,
  );

  @override
  Future<List<ChargePoint>> getPlacesByRadius(String kinds, String format,
      String apikey, String lat, String lon, String radius) async {
    final List<ChargePointDto> dtoList = await _gateway.getPlacesByRadius(
        kinds, format, apikey, lat, lon, radius);
    return dtoList.map((ChargePointDto dto) => _factory.create(dto)).toList();
  }

  @override
  Future<ChargePointAddress> getPlaceById(String xid, String apikey) async =>
      _addressFactory.create(await _gateway.getPlaceById(xid, apikey));
}

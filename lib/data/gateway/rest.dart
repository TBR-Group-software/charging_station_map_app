import 'dart:convert';
import 'package:google_maps_api_app/assembly/factory.dart';
import 'package:google_maps_api_app/backbone/rest_api_urls.dart';
import 'package:google_maps_api_app/data/model/charge_point.dart';
import 'package:google_maps_api_app/data/model/charge_point_address.dart';
import 'package:http/http.dart' as http;

class RestGateway {
  final Factory<ChargePointDto, Map<String, dynamic>> _chargePointDtoFactory;
  final Factory<ChargePointAddressDto, Map<String, dynamic>>
      _chargePointAddressDtoFactory;

  RestGateway(this._chargePointDtoFactory, this._chargePointAddressDtoFactory);

  Future<List<ChargePointDto>> getPlacesByRadius(
    String kinds,
    String format,
    String apikey,
    String lat,
    String lon,
    String radius,
  ) async {
    final http.Response response = await _getRequest(baseUrl, placesRadiusUrl,
        queryParams: <String, String>{
          'kinds': kinds,
          'format': format,
          'apikey': apikey,
          'lat': lat,
          'lon': lon,
          'radius': radius,
        });
    final Map<String, dynamic> jsonResponse =
        json.decode(response.body) as Map<String, dynamic>;
    final List<dynamic> dynamics = jsonResponse['features'] as List<dynamic>;
    final List<Map<String, dynamic>> jsonList =
        dynamics.map((dynamic d) => d as Map<String, dynamic>).toList();

    return jsonList
        .map((Map<String, dynamic> json) => _chargePointDtoFactory.create(json))
        .toList();
  }

  Future<ChargePointAddressDto> getPlaceById(
    String xid,
    String apikey,
  ) async {
    final http.Response response = await _getRequest(
        baseUrl, placeById + '/$xid',
        queryParams: <String, String>{
          'apikey': apikey,
        });
    final Map<String, dynamic> jsonResponse =
        json.decode(response.body) as Map<String, dynamic>;
    print(response.body);
    final Map<String, dynamic> addressJson =
        jsonResponse['address'] as Map<String, dynamic>;

    return _chargePointAddressDtoFactory.create(addressJson);
  }

  Future<http.Response> _getRequest(
    String baseUrl,
    String path, {
    Map<String, String>? headers,
    Map<String, String>? queryParams,
  }) async {
    return http.get(
        Uri.parse(
          Uri.https(baseUrl, path, queryParams ?? <String, String>{})
              .toString(),
        ),
        headers: headers);
  }

  // ignore: unused_element
  Future<http.Response> _postRequest(
    String baseUrl,
    String path, {
    Map<String, String>? headers,
    Map<String, String>? queryParams,
  }) {
    return http.post(
        Uri.parse(
          Uri.https(baseUrl, path).toString(),
        ),
        headers: headers,
        body: queryParams);
  }
}

import 'package:google_maps_api_app/assembly/factory.dart';
import 'package:google_maps_api_app/data/model/charge_point.dart';

class ChargePointDtoFromJsonFactory
    implements Factory<ChargePointDto, Map<String, dynamic>> {
  @override
  ChargePointDto create(Map<String, dynamic> param) => ChargePointDto(
        (param['geometry']['coordinates'][0] as num).toDouble(),
        (param['geometry']['coordinates'][1] as num).toDouble(),
        param['properties']['name'] as String?,
        (param['properties']['dist'] as num).toDouble(),
        param['properties']['xid'] as String,
      );
}

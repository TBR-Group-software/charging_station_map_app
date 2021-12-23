import 'package:google_maps_api_app/assembly/factory.dart';
import 'package:google_maps_api_app/data/model/charge_point.dart';
import 'package:google_maps_api_app/domain/entity/charge_point.dart';

class ChargePointFromDtoFactory
    implements Factory<ChargePoint, ChargePointDto> {
  @override
  ChargePoint create(ChargePointDto param) => ChargePoint(
        param.lon,
        param.lat,
        param.name,
        param.dist,
        param.id,
      );
}

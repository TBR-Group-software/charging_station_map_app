import 'package:google_maps_api_app/assembly/factory.dart';
import 'package:google_maps_api_app/data/model/charge_point_address.dart';
import 'package:google_maps_api_app/domain/entity/charge_point_address.dart';

class ChargePointAddressFromDtoFactory
    implements Factory<ChargePointAddress, ChargePointAddressDto> {
  @override
  ChargePointAddress create(ChargePointAddressDto param) => ChargePointAddress(
        param.road,
        param.houseNumber,
      );
}

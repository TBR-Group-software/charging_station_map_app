import 'package:google_maps_api_app/assembly/factory.dart';
import 'package:google_maps_api_app/data/model/charge_point_address.dart';

class ChargePointAddressDtoFromJsonFactory
    implements Factory<ChargePointAddressDto, Map<String, dynamic>> {
  @override
  ChargePointAddressDto create(Map<String, dynamic> param) =>
      ChargePointAddressDto(
        param['road'] as String?,
        param['house_number'] as String?,
      );
}

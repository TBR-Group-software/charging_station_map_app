import 'package:get_it/get_it.dart';
import 'package:google_maps_api_app/assembly/entity/charge_point_address_from_dto.dart';
import 'package:google_maps_api_app/assembly/entity/charge_point_from_dto.dart';
import 'package:google_maps_api_app/assembly/factory.dart';
import 'package:google_maps_api_app/assembly/model/charge_point_address_from_json.dart';
import 'package:google_maps_api_app/assembly/model/charge_point_from_json.dart';
import 'package:google_maps_api_app/data/gateway/rest.dart';
import 'package:google_maps_api_app/data/model/charge_point.dart';
import 'package:google_maps_api_app/data/model/charge_point_address.dart';
import 'package:google_maps_api_app/data/service/rest_charge_point.dart';
import 'package:google_maps_api_app/domain/entity/charge_point.dart';
import 'package:google_maps_api_app/domain/entity/charge_point_address.dart';
import 'package:google_maps_api_app/domain/service/charge_point.dart';
import 'package:google_maps_api_app/domain/usecase/get_place_by_id.dart';
import 'package:google_maps_api_app/domain/usecase/get_places_by_radius.dart';
import 'package:google_maps_api_app/presentation/bloc/charge_point/bloc.dart';

final GetIt sl = GetIt.instance;

void init() {
  //From Dto Factory
  sl.registerLazySingleton<Factory<ChargePoint, ChargePointDto>>(
      () => ChargePointFromDtoFactory());
  sl.registerLazySingleton<Factory<ChargePointAddress, ChargePointAddressDto>>(
      () => ChargePointAddressFromDtoFactory());

  //From Json Factory
  sl.registerLazySingleton<Factory<ChargePointDto, Map<String, dynamic>>>(
      () => ChargePointDtoFromJsonFactory());
  sl.registerLazySingleton<
          Factory<ChargePointAddressDto, Map<String, dynamic>>>(
      () => ChargePointAddressDtoFromJsonFactory());
  //Gateway
  sl.registerLazySingleton<RestGateway>(() => RestGateway(
        sl.get(),
        sl.get(),
      ));
  //Service
  sl.registerLazySingleton<ChargePointService>(() => RestChargePointService(
        sl.get(),
        sl.get(),
        sl.get(),
      ));
  //UseCase
  sl.registerLazySingleton<GetPlacesByRadiusUseCase>(
      () => RestGetPlacesByRadiusUseCase(sl.get()));
  sl.registerLazySingleton<GetPlaceByIdUseCase>(
      () => RestGetPlaceByIdUseCase(sl.get()));
  //Bloc
  sl.registerLazySingleton<ChargePointBloc>(
      () => ChargePointBloc(sl.get(), sl.get()));
}

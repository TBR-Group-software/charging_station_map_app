import 'package:google_maps_api_app/presentation/bloc/status.dart';

class AppBlocState {
  final Object? error;
  final BlocStatus status;

  AppBlocState({required this.status, this.error});
}

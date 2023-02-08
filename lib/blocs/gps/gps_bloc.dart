import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
  GpsBloc()
      : super(
            const GpsState(isGpsEnable: false, isGpsPermissionGranted: false)) {
    on<GpsAndPermissionEvent>((event, emit) => emit(state.copyWith(
        isGpsEnable: event.isGpsEnable,
        isGpsPermissionGranted: event.isGpsPermissionGranted)));
    _init();
  }

  Future<void> _init() async {
    final isEnabled = await _checkGpsStatus();
    print('is enabled $isEnabled');
  }

  Future<bool> _checkGpsStatus() async {
    final isEnable = await Geolocator.isLocationServiceEnabled();
    Geolocator.getServiceStatusStream().listen((event) {
      print('service status $event');
    });
    return isEnable;
  }

  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
  }
}

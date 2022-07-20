import 'package:automated_work_control/data/model/birthday_data.dart';
import 'package:automated_work_control/data/model/deadline_data.dart';
import 'package:automated_work_control/data/model/document_exchange_data.dart';
import 'package:automated_work_control/data/model/response_data.dart';
import 'package:automated_work_control/data/model/weather_data.dart';
import 'package:automated_work_control/data/services/http/dashboard_service.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'actions_state.dart';

class ActionsCubit extends Cubit<ActionsState> {
  ActionsCubit() : super(ActionsState());

  Future<T?> connection<T>(T Function() callback) async {
    var connectivity = Connectivity();
    var result = await connectivity.checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      emit(state.copyWith(hasConnection: true));
      return await callback();
    } else {
      emit(state.copyWith(hasConnection: false));
    }
  }

  Future<bool> checkConnection() async {
    var connectivity = Connectivity();
    var result = await connectivity.checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  Future loadDashboardData() async {
    await await connection(() async {
      emit(state.copyWith(isLoading: true));
      WeatherData? weatherData = await DashboardService.to.getWeather();
      DocumentExchangeData? documentExchangeData =
          await DashboardService.to.getDocumentExchangeData();
      ResponseData<BirthdayData>? birthdayData =
          await DashboardService.to.getBirthdays();

      ResponseData<DeadlineData>? skipped =
          await DashboardService.to.getSkippedDeadline();
      ResponseData<DeadlineData>? upcoming =
          await DashboardService.to.getUpcomingDeadline();
      if (weatherData != null ||
          birthdayData != null ||
          skipped != null ||
          upcoming != null ||
          documentExchangeData != null) {
        emit(
          state.copyWith(
            weatherData: weatherData,
            birthdayData: birthdayData,
            skipped: skipped,
            upcoming: upcoming,
            documentExchangeData: documentExchangeData,
          ),
        );
      } else {
        emit(state.copyWith(hasError: true));
      }
      emit(state.copyWith(isLoading: false));
    });
  }
}

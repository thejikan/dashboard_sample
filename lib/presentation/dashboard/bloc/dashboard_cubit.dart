import 'package:dashboard/model/weatherConfig.dart';
import 'package:dashboard/service/detailsService.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_state.dart';

class DashboardViewCubit extends Cubit<DashboardViewState> {
  final DetailsService _detailsService;

  DashboardViewCubit(this._detailsService) : super(const DashboardViewState()) {
    initialState();
  }

  void initialState() async {
    await _detailsService.weatherDetails();

    List<WeatherDetailsConfig> last3DaysReport = _detailsService.getLast3DaysReport();
    List<WeatherDetailsConfig> nextWeekReport = _detailsService.getNextWeekReport();
    WeatherDetailsConfig? todayReport = _detailsService.getTodayReport();
    last3DaysReport.insert(0, todayReport!);

    emit(state.copyWith(
      last3Days: last3DaysReport,
      isLoading: false,
      nextWeekReport: nextWeekReport,
      noData: last3DaysReport.isEmpty?true:false,
    ));
  }

  void refreshView(){
    emit(state.copyWith(
      isLoading: true,
      noData: false,
    ));

    initialState();
  }

}

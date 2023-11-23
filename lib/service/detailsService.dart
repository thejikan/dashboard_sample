// import 'package:rxdart/subjects.dart';
import 'package:dashboard/api/api_repository.dart';
import 'package:dashboard/model/detailsModel.dart';
import 'package:dashboard/model/weatherConfig.dart';


class DetailsService {
  IDetailsRepository repository;

  late DetailsModel _detailsModel;

  DetailsService({required this.repository, DetailsModel? detailsModel}) {
    _detailsModel = detailsModel ?? DetailsModel.empty();
  }

  Future<List<WeatherDetailsConfig>> weatherDetails() async {
    try {
      List<WeatherDetailsConfig> res = [];

      int i = 0;
      List<WeatherDetailsConfig> last3DaysReport = [];
      List<WeatherDetailsConfig> nextWeekReport = [];
      WeatherDetailsConfig todayReport;

      if(res.isNotEmpty){
        while(i<3){
          last3DaysReport.insert(0, res[i]);
          i++;
        }
        todayReport = res[i];
        i++;
        while(i<res.length){
          nextWeekReport.add(res[i]);
          i++;
        }

        _detailsModel.last3Days = last3DaysReport;
        _detailsModel.todayReport = todayReport;
        _detailsModel.nextWeekReport = nextWeekReport;
      }

      return res;
    } catch (e) {
      return [];
    }
  }


  List<WeatherDetailsConfig> getLast3DaysReport() {
    return _detailsModel.last3Days;
  }

  List<WeatherDetailsConfig> getNextWeekReport(){
    return _detailsModel.nextWeekReport;
  }

  WeatherDetailsConfig? getTodayReport(){
    return _detailsModel.todayReport;
  }

}

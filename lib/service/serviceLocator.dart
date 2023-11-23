import 'package:dashboard/api/api_repository.dart';
import 'package:dashboard/api/api_request.dart';
import 'package:dashboard/model/detailsModel.dart';
import 'package:dashboard/service/detailsService.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

extension DetailsServiceLocator on GetIt {
  void registerDetailsService(DetailsService service) {
    if (isRegistered<DetailsService>()) {
      unregister<DetailsService>();
    }
    registerSingleton<DetailsService>(service);
  }

  /// Get the registered DetailsService instance. If no registered will create an new instance with empty details Data
  DetailsService getDetailsService() {
    if (!isRegistered<DetailsService>()) {
      var data = DetailsModel.empty();
      var service = DetailsService(
        repository: DetailsRepository(
          provider: DetailsProvider(),
        ),
        detailsModel: data,
      );
      registerSingleton(service);
    }

    return this<DetailsService>();
  }
}
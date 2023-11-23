import 'dart:convert';

import 'package:dashboard/api/api_request.dart';
import 'package:dashboard/model/registrationConfig.dart';

class DetailsRepository implements IDetailsRepository {
  IDetailsProvider provider;

  DetailsRepository({
    required this.provider,
  });

  @override
  Future<bool> loginWithOtp(String mobile, String otpCode) async {
    try {
      final apiResponse = await provider.loginWithOtp(mobile, otpCode);

      if (apiResponse.statusCode != 200) {
        throw Exception(apiResponse.statusCode);
      }
      Map<String, dynamic> data = json.decode(apiResponse.body);
      int status = data['code'];
      bool otpValid = data['code']['response_message']['otpValid'];

      if (status == 200 && otpValid) {
        return true;
      }

      return false;
    } on Exception catch (e, stacktrace) {
      return false;
      // throw Exception();
    }
  }

  @override
  Future<bool> registerUser(RegistrationConfig userData) async {
    try {
      final apiResponse = await provider.registerUser(userData);

      if (apiResponse.statusCode != 200) {
        throw Exception(apiResponse.statusCode);
      }
      Map<String, dynamic> data = json.decode(apiResponse.body);
      int status = data['code'];
      bool isUserRegister = data['code']['response_message']['user'] == null
          ? false
          : true;

      if (status == 200 && isUserRegister) {
        return true;
      }

      return false;
    } on Exception catch (e, stacktrace) {
      return false;
      // throw Exception();
    }
  }

  @override
  Future<ProfileConfig> getUser(String serviceId) async {
    try {
      final apiResponse = await provider.getUser(serviceId);

      if (apiResponse.statusCode != 200) {
        throw Exception(apiResponse.statusCode);
      }
      Map<String, dynamic> data = json.decode(apiResponse.body);
      int status = data['code'];
      Map<String, dynamic> userData = data['code']['response_message']['user'];

      if (status == 200 && userData.isNotEmpty) {
        return ProfileConfig(
            firstName: userData['firstName'],
            lastName: userData['lastName'],
            userServiceId: userData['userServiceId'],
            totalAvailableJobs: userData['totalAvailableJobs'],
            totalJobsOnProfile: userData['totalJobsOnProfiles'],
            image: userData['profilePicture'],
        );
      }

      return ProfileConfig.empty();
    } on Exception catch (e, stacktrace) {
      return ProfileConfig.empty();
      // throw Exception();
    }
  }


}

abstract class IDetailsRepository {
  Future<bool> loginWithOtp(String mobile, String otpCode);
  Future<bool> registerUser(RegistrationConfig userData);
  Future<ProfileConfig> getUser(String serviceId);

}

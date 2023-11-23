import 'dart:collection';
import 'dart:convert';

import 'package:dashboard/model/registrationConfig.dart';
import 'package:http/http.dart' as http;

class DetailsProvider extends IDetailsProvider {
  String baseUrl = 'http://localhost/castindia_codeigniter_res/API/';

  @override
  Future<http.Response> getOtp(String mobile) async {
    String endPointPath = '${baseUrl}ionic/V2/Common/UserAccess/getOtp';
    Map<String, String> body = HashMap();
    body['mobile'] = mobile;
    body['serviceId'] = "1";

    return await http.post(
      Uri.parse(endPointPath),
      body: json.encode(body),
    );
  }

  @override
  Future<http.Response> loginWithOtp(String mobile, String otpCode) async {
    String endPointPath = '${baseUrl}Common/UserAccess/login';
    Map<String, String> body = HashMap();
    body['mobile'] = mobile;
    body['otp'] = otpCode;
    body['serviceId'] = "1";

    return await http.post(
      Uri.parse(endPointPath),
      body: json.encode(body),
    );
  }

  @override
  Future<http.Response> registerUser(RegistrationConfig data) async {
    String endPointPath = '${baseUrl}Common/UserAccess/register_s1_r1_save';
    Map<String, String> body = HashMap();
    body['firstName'] = data.firstName;
    body['lastName'] = data.lastName;
    body['primaryMobile'] = data.mobileNumber;
    body['primaryEmail'] = data.email;
    body['profileId'] = data.profileId.toString();
    body['seniorityId'] = data.seniorityId.toString();
    body['displayName'] = data.displayName;
    body['referenceCode'] = data.referenceCode;

    return await http.post(
      Uri.parse(endPointPath),
      body: json.encode(body),
    );
  }

  @override
  Future<http.Response> getUser(String serviceId) async {
    String endPointPath = '${baseUrl}ionic/V2/Common/UserAccess/getUser?userServiceId=$serviceId';

    return await http.get(
      Uri.parse(endPointPath),
    );
  }

}

abstract class IDetailsProvider {
  Future<http.Response> getOtp(String mobile);
  Future<http.Response> loginWithOtp(String mobile, String otpCode);
  Future<http.Response> registerUser(RegistrationConfig data);
  Future<http.Response> getUser(String serviceId);
}

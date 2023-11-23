class RegistrationConfig {
  String firstName;
  String lastName;
  String mobileNumber;
  String email;
  int profileId;
  int seniorityId;
  String displayName;
  String referenceCode;

  RegistrationConfig({
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.email,
    required this.profileId,
    required this.seniorityId,
    required this.displayName,
    required this.referenceCode,
  });
}

class ProfileConfig {
  String firstName;
  String lastName;
  int userServiceId;
  int totalAvailableJobs;
  int totalJobsOnProfile;
  String image;

  ProfileConfig({
    required this.firstName,
    required this.lastName,
    required this.userServiceId,
    required this.totalAvailableJobs,
    required this.totalJobsOnProfile,
    required this.image,
  });

  factory ProfileConfig.empty() {
    return ProfileConfig(
      firstName: '',
      lastName: '',
      userServiceId: 0,
      totalAvailableJobs: 0,
      totalJobsOnProfile: 0,
      image: '',
    );
  }
}

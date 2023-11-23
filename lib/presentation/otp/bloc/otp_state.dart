part of 'otp_cubit.dart';

class OtpViewState extends Equatable {
  final bool isLoading;
  final bool noData;
  final List<WeatherDetailsConfig> last3Days;
  final List<WeatherDetailsConfig> nextWeekReport;

  const OtpViewState({
    this.isLoading = true,
    this.noData = false,
    this.last3Days = const [],
    this.nextWeekReport = const [],
  });

  OtpViewState copyWith({
    bool? isLoading,
    bool? noData,
    List<WeatherDetailsConfig>? last3Days,
    List<WeatherDetailsConfig>? nextWeekReport,
  }) {
    return OtpViewState(
      isLoading: isLoading ?? this.isLoading,
      noData: noData ?? this.noData,
      last3Days: last3Days ?? this.last3Days,
      nextWeekReport: nextWeekReport ?? this.nextWeekReport,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        noData,
        last3Days,
        nextWeekReport,
      ];
}

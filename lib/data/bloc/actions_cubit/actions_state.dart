part of 'actions_cubit.dart';

class ActionsState extends Equatable {
  final WeatherData? weatherData;
  final DocumentExchangeData? documentExchangeData;
  final ResponseData<BirthdayData>? birthdayData;
  final ResponseData<DeadlineData>? skipped;
  final ResponseData<DeadlineData>? upcoming;
  final bool isLoading;
  final bool hasError;
  final bool hasConnection;

  ActionsState({
    this.isLoading = false,
    this.hasError = false,
    this.hasConnection = false,
    this.birthdayData,
    this.documentExchangeData,
    this.skipped,
    this.upcoming,
    this.weatherData,
  });

  @override
  List<Object?> get props => [
        isLoading,
        hasError,
        hasConnection,
        birthdayData,
        documentExchangeData,
        skipped,
        upcoming,
        weatherData,
      ];

  ActionsState copyWith({
    bool? isLoading,
    bool? hasError,
    WeatherData? weatherData,
    DocumentExchangeData? documentExchangeData,
    ResponseData<BirthdayData>? birthdayData,
    ResponseData<DeadlineData>? skipped,
    ResponseData<DeadlineData>? upcoming,
    bool? hasConnection,
  }) {
    return ActionsState(
      isLoading: isLoading ?? this.isLoading,
      weatherData: weatherData ?? this.weatherData,
      documentExchangeData: documentExchangeData ?? this.documentExchangeData,
      birthdayData: birthdayData ?? this.birthdayData,
      hasError: hasError ?? this.hasError,
      hasConnection: hasConnection ?? this.hasConnection,
      skipped: skipped ?? this.skipped,
      upcoming: upcoming ?? this.upcoming,
    );
  }
}

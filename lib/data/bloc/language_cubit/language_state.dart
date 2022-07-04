part of 'language_cubit.dart';

class LanguageState extends Equatable {
  final Locale locale;
  final bool isLoading;
  final int index;

  const LanguageState({
    required this.locale,
    this.isLoading = false,
    this.index = 0,
  });

  @override
  List<Object?> get props => [locale, isLoading,index,];

  LanguageState copyWith({
    Locale? locale,
    bool? isLoading,
    int? index,
  }) {
    return LanguageState(
      locale: locale ?? this.locale,
      isLoading: isLoading ?? this.isLoading,
      index: index ?? this.index,
    );
  }
}

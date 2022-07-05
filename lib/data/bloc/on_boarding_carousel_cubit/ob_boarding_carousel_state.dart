part of 'on_boarding_carousel_cubit.dart';

class OnBoardingCarouselState extends Equatable {
  final List<OnBoardingModel> items;
  final int index;

  const OnBoardingCarouselState({
    required this.items,
    required this.index,
  });

  @override
  List<Object?> get props => [items, index];

  OnBoardingCarouselState copyWith({
    List<OnBoardingModel>? items,
    int? index,
  }) {
    return OnBoardingCarouselState(
      items: items ?? this.items,
      index: index ?? this.index,
    );
  }
}

part of 'number_card_cubit.dart';

class NumberCardState extends Equatable {
  const NumberCardState({
    this.id,
    this.title,
    this.value,
    this.percent,
    this.showPercentage,
  });

  // initial state with default values
  factory NumberCardState.initial() => const NumberCardState();

  final String? id;
  final String? title;
  final String? value;
  final String? percent;
  final bool? showPercentage;

  NumberCardState copyWith({
    String? id,
    String? title,
    String? value,
    String? percent,
    bool? showPercentage,
  }) => NumberCardState(
    id: id ?? this.id,
    title: title ?? this.title,
    value: value ?? this.value,
    percent: percent ?? this.percent,
    showPercentage: showPercentage ?? this.showPercentage,
  );

  @override
  List<Object?> get props => [
    id,
    title,
    value,
    percent,
    showPercentage,
  ];
}

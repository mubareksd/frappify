import 'package:equatable/equatable.dart';

class CurrentPage extends Equatable {
  const CurrentPage({this.type, this.name});

  final String? type;
  final String? name;

  CurrentPage copyWith({String? type, String? name}) {
    return CurrentPage(
      type: type ?? this.type,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [type, name];
}

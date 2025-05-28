import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frappe_client/frappe_client.dart';
import 'package:secure_storage/secure_storage.dart';

part 'desk_event.dart';
part 'desk_state.dart';

class DeskBloc extends Bloc<DeskEvent, DeskState> {
  DeskBloc({required this.frappe, required this.secureStorage})
    : super(DeskState.initial());

  final FrappeClient frappe;
  final SecureStorage secureStorage;
}

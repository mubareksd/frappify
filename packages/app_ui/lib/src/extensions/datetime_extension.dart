import 'package:intl/intl.dart';

/// Extension on [DateTime] to format the date to [dd/MM/yyyy].
extension DateTimeEx on DateTime {
  /// Formats the date to [dd/MM/yyyy].
  String toDDMMYY() {
    return DateFormat('dd/MM/yyyy').format(this);
  }
}

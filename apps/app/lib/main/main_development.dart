import 'package:frappify/app/app.dart';
import 'package:frappify/main/bootstrap/bootstrap.dart';

void main() {
  bootstrap((frappe, persistentStorage, secureStorage) async {
    return App(
      frappe: frappe,
      secureStorage: secureStorage,
      persistentStorage: persistentStorage,
    );
  });
}

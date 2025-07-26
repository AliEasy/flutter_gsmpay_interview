import 'package:flutter/cupertino.dart';
import 'package:flutter_gsmpay_interview/core/di/base/di_setup.dart';

void setupApp() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
}

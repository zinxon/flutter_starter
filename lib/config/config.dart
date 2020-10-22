import 'package:flutter_cubit_bloc_tutorial/utility/injection/injection.dart';
import 'package:flutter_cubit_bloc_tutorial/utility/log/Log.dart';

void initConfig() {
  Log.init();
  configureDependencies();
}

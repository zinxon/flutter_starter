import 'package:fluro/fluro.dart';

abstract class Application {
  static FluroRouter router;
  void onCreate();
  void onTerminate();
}

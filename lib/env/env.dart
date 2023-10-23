// lib/env/env.dart
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'APP_ID')
  static const String appId = _Env.appId;
  @EnviedField(varName: 'APP_KEY')
  static const String appKey = _Env.appKey;
}

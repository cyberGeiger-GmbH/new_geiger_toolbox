import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: ".env.test", useConstantCase: true)
abstract class Env {
  @EnviedField(varName: 'TYPE')
  static const String type = _Env.type;
}

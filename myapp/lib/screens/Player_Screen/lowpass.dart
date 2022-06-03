import 'package:vector_math/vector_math_64.dart';
import 'package:motion_sensors/motion_sensors.dart';

final value =  Vector3(0.20,0.050,0.050);

Vector3 applyLowPassFilter( OrientationEvent input, Vector3 output,
    [ Vector3?  ALPHA]) {
  ALPHA ??= value;
  List<double> INPUT = [input.yaw,input.pitch,input.roll];
  for (int i = 0; i < 3; i++) {
    output[i] = output[i] + ALPHA[i] * (INPUT[i] - output[i]);
  }

  return output;
}

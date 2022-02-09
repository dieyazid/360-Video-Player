import 'package:vector_math/vector_math_64.dart';

final value =  Vector3.all(0.0154);

Vector3 applyLowPassFilter( var input, Vector3 output,
    [ Vector3?  ALPHA]) {
  ALPHA ??= value;
  List<double> INPUT = [input.x,input.y,input.z];
  for (int i = 0; i < 3; i++) {
    output[i] = output[i] + ALPHA[i] * (INPUT[i] - output[i]);
  }

  return output;
}

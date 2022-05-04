import 'package:equatable/equatable.dart';

abstract class Failure  {
  // If the subclasses have some properties, they'll get passed to this constructor
  // so that Equatable can perform value comparison.
  Failure([List properties = const <dynamic>[]]);
}

class ServerFailure extends Failure{}
class CatchFailure extends Failure{


}
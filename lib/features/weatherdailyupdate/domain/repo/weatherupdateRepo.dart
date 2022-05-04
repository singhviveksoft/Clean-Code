import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/dailyweatherupdate.dart';

abstract class NumberRepo{
  Future<Either<Failure, NumberEntities>> getNumber();
}
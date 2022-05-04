import 'package:clean_code_architecture/features/weatherdailyupdate/domain/entities/dailyweatherupdate.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repo/weatherupdateRepo.dart';

class NumberUsesCase{
  final NumberRepo repo;
NumberUsesCase({required this.repo});

  Future<Either<Failure, NumberEntities>> execute()async{
 return await repo.getNumber();

}

}
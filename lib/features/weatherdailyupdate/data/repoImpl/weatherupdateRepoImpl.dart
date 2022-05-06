import 'package:clean_code_architecture/core/error/exception.dart';
import 'package:clean_code_architecture/features/weatherdailyupdate/domain/repo/weatherupdateRepo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/networkinfo/networkConnection.dart';
import '../../domain/entities/dailyweatherupdate.dart';
import '../datasource/local/weatherUpdateLocalDataSource.dart';
import '../datasource/remote/weatherUpdateRemoteDataSource.dart';

class NumberRepoImpl implements NumberRepo {
  final NumberLocalDataSource localDataSource;
  final NumberRemoteDataSource remoteDataSource;
  final NetworkConnection connection;

  NumberRepoImpl(
      {required this.connection,
      required this.remoteDataSource,
      required this.localDataSource});

  @override
  Future<Either<Failure, NumberEntities>> getNumber() async {
    if (await connection.isConnection) {
      try {
        var result = await remoteDataSource.getNumberRemoteDataSource();
        await localDataSource.cacheNumberLocalDataSource(model: result);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        var result = await localDataSource.getLastNumberLocalDataSource();
        return Right(result);
      } on CatchException {
        return Left(CatchFailure());
      }
    }
  }
}

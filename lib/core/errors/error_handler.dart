import 'package:dartz/dartz.dart';
import 'exceptions.dart';
import 'failures.dart';

class ErrorHandler {
  static Failure handleException(Exception exception) {
    if (exception is ServerException) {
      return ServerFailure(exception.message);
    } else if (exception is CacheException) {
      return CacheFailure(exception.message);
    } else if (exception is NetworkException) {
      return NetworkFailure(exception.message);
    } else {
      return ServerFailure('Unexpected error occurred');
    }
  }

  static Either<Failure, T> handle<T>(T Function() function) {
    try {
      return Right(function());
    } catch (e) {
      return Left(handleException(e as Exception));
    }
  }
}
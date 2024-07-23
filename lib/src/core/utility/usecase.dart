import 'package:fpdart/fpdart.dart';
import 'package:news_app/src/core/error/failures.dart';

abstract interface class Usecase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParams {}

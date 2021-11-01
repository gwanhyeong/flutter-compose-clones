import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

abstract class UseCase<DataType, Params> {
  Future<Either<Failure, DataType>> execute(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

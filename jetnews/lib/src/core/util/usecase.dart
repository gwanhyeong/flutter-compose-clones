import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<DataType, Params> {
  Future<Either<Exception, DataType>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

import 'package:equatable/equatable.dart';
import 'package:fgitapp/core/utils/type_def.dart';

abstract class UseCase<T, Params> {
  ResultFuture<T> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

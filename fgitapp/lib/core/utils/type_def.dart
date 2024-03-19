import 'package:dartz/dartz.dart';

import '../../common/models/error_model.dart';

typedef ResultFuture<T> = Future<Either<T, ErrorModel>>;

import 'package:fpdart/fpdart.dart';
import 'package:open_rooms/resources/auth/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureEither<void>;
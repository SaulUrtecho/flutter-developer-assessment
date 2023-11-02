import 'package:either_dart/either.dart';
import 'package:thrones_app/core/failures.dart';

// This use case don't receive any parameter
abstract class GetDataUseCase<Out> {
  Future<Either<Failures, Out>> run();
}

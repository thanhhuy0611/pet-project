import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jaho_challenge/model/user_response.dart';

class UserRepository {
  final dio = Dio();

  Future<Either<Exception, UserResponse>> getUserData(int page) async {
    try {
      final response = await dio.get('https://reqres.in/api/users?page=$page');
      if (response.statusCode == 200 ) {
        final data = UserResponse.fromJson(response.data);
        return right(data);
      }
      return left(Exception(response.statusCode));
    } on Exception catch (e) {
      return left(e);
    }
  }
}
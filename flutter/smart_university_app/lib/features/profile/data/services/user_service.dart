import 'package:smart_university_app/core/network/dio_helper.dart';
import 'package:smart_university_app/features/profile/data/models/user_model.dart';

class UserService {
  Future<UserModel> getUserById(int id) async {
    final response = await DioHelper.dio.get('/api/Users/$id');

    return UserModel.fromJson(response.data);
  }
}




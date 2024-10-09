
abstract class DatabaseService {
  Future<void> addUserData({required String path, String? uId ,required Map<String, dynamic> data});
  Future<Map<String,dynamic>> getData({required String path,required String uId});

  Future<bool> checkIfDataExist({required String path,required String uId});
}
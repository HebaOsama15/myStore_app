
import 'data_repo.dart';

class DataBaseRepo extends DataRepo{
  @override
  // Future<Map<String, dynamic>>
  
   getData({required String source, List<String>? columns}) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> postData(Map<String, dynamic> dataToSend,String source) {

    throw UnimplementedError();
  }
  
  @override
  Future<Map<String, dynamic>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
  
  @override
  Future<Map<String, dynamic>> deleteData(Map<String, dynamic> dataToSend, String source) {
    // TODO: implement deleteData
    throw UnimplementedError();
  }
  
  @override
  Future<Map<String, dynamic>> putData(Map<String, dynamic> dataToSend, String source) {
    // TODO: implement putData
    throw UnimplementedError();
  }
  





}
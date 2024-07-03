
abstract class DataRepo {
  // Future<Map<String, dynamic>>
  Future<List<dynamic>>
   getListData({required String source,List<String>? columns});

  Future<Map<String,dynamic>>getMapData({required String source,List<String>? columns});
  Future<Map<String,dynamic>>postData(Map<String,dynamic> dataToSend,String source);
  Future<Map<String,dynamic>>putData(Map<String,dynamic> dataToSend,String source);
  Future<Map<String,dynamic>>deleteData(Map<String,dynamic> dataToSend,String source);
}

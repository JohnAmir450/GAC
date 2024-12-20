abstract class DatabaseService {
  Future<void> addUserData({
    required String path,
    String? uId,
    required Map<String, dynamic> data,
  });
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  });

  Future<bool> checkIfDataExist({
    required String path,
    required String uId,
  });

  Stream<List<Map<String, dynamic>>> getDataStream({
    required String path,
    String? documentId,
    String? field,
    Map<String, dynamic>? query,
  });
  Future<void> updateData({
    required String path,
    required String documentId,
    required Map<String, dynamic> data,
  });

  Future<void> removeItemFromCart({
    required String userId,
    required String productCode,
  });
  Future<List<String>> getDocumentIdsByField({
    required String path,
    required String field,
    required dynamic value,
  });

  Future<List<Map<String, dynamic>>> searchProducts(String searchText);

   Stream<dynamic> getProductPriceStream({
    required String productCode, // Unique product code to fetch price
  });

  // Stream<double> getProductPrice(String productCode);
}

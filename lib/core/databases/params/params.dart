

class ToggleFavParams {
  final String productID;
  final String storeID;
  ToggleFavParams({
    required this.productID,
    required this.storeID,
  });
}

class GetProductDetailsParams {
  String productID, storeID;
  GetProductDetailsParams({
    required this.productID,
    required this.storeID,
  });
}

class ShowStoreParams {
  String storeID;
  ShowStoreParams({
    required this.storeID,
  });
}

class GetStoredAndProductIdParams {
  String productID, storeID;
  GetStoredAndProductIdParams({
    required this.productID,
    required this.storeID,
  });
}



class StoreParams {
  int page = 1;
  String query;
  StoreParams({
    required this.page,
    required this.query,
  });
}

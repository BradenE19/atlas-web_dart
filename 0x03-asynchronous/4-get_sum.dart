import 'dart:convert';
import '4-util.dart';

Future<int> calculateTotal() async {
  try {
    // Fetch user data
    String data = await fetchUserData();
    Map<String, dynamic> dataMap = jsonDecode(data);

    // Fetch user orders
    String userOrderJson = await fetchUserOrders(dataMap['id']);
    List<dynamic> productsUser = jsonDecode(userOrderJson);

    double sumPro = 0.0;
    for (String product in productsUser) {
      // Fetch product price
      String productPriceJson = await fetchProductPrice(product.trim());
      dynamic productPrice = jsonDecode(productPriceJson);

      // Ensure product price is treated as double
      sumPro += (productPrice is int) ? productPrice.toDouble() : productPrice;
    }

    return sumPro.toInt();
  } catch (e) {
    print("error caught: $e");
    return -1;
  }
}

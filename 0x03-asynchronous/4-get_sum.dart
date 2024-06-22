import 'dart:convert';

import '4-util.dart';

Future<double> calculateTotal() async {
  try {
    String data = await fetchUserData();

    Map dataMap = jsonDecode(data);

    String userOrder = await fetchUserOrders(dataMap['id']);
    userOrder = userOrder.substring(1, userOrder.length - 1);
    List<String> productsUser = userOrder.split(',');

    double sumPro = 0;
    for (String product in productsUser) {
      product = product.substring(1, product.length - 1);
      sumPro += double.parse(await fetchProductPrice(product));
    }

    return sumPro;
  } catch (e) {
    return -1;
  }
}
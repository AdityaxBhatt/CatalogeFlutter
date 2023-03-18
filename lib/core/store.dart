import 'package:cataloge/models/cart.dart';
import 'package:cataloge/models/cataloge.dart';
import 'package:velocity_x/velocity_x.dart';

class Mystore extends VxStore {
  late CatalogeModel catalog;
  late CartModel cart;
  Mystore() {
    catalog = CatalogeModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}

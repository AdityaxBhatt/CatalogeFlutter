import 'package:cataloge/models/cataloge.dart';

class CartModel {
  // catalog field
  late CatalogeModel _catalog;

  // Collection of IDs - store Ids of each item
  final List<dynamic> _itemIds = [];

  // Get Catalog
  CatalogeModel get catalog => _catalog;

  set catalog(CatalogeModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getbyid(id)).toList();

  // Get total price
  dynamic get totalPrice =>
      items.fold(0, (total, current) => total + (current.price).toInt());

  // Add Item

  void add(Item item) {
    _itemIds.add(item.id);
  }

  // Remove Item

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

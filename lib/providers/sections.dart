import 'package:flutter/foundation.dart';
import 'package:mathappcd/models/section.dart';

class SectionsProvider with ChangeNotifier {
  ModelSection _item = ModelSection(id: "", number: "", name: "");
  List<ModelSection> _items = [];

  ModelSection get item => _item;
  List<ModelSection> get list => _items;

  void setItem(ModelSection item) {
    _item = item;
    notifyListeners();
  }

  void addItem(ModelSection item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void setList(List<ModelSection> items) {
    _items = items;
    notifyListeners();
  }

  void emptyList() {
    _items.clear();
    notifyListeners();
  }
}

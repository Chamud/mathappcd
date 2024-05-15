import 'package:flutter/foundation.dart';
import 'package:mathappcd/models/subsection.dart';

class SectionsProvider with ChangeNotifier {
  ModelSubSection _item = ModelSubSection(id: "", title: "");
  List<ModelSubSection> _items = [];

  ModelSubSection get item => _item;
  List<ModelSubSection> get list => _items;

  void setItem(ModelSubSection item) {
    _item = item;
    notifyListeners();
  }

  void addItem(ModelSubSection item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void setList(List<ModelSubSection> items) {
    _items = items;
    notifyListeners();
  }

  void emptyList() {
    _items.clear();
    notifyListeners();
  }
}

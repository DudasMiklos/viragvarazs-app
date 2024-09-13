import 'package:flutter/material.dart';
import 'package:forest_logger/forest_logger.dart';

class LoadingInterface with ChangeNotifier {
  bool _isLoading = false;
  bool _isGenerateProductDescriptionLoading = false;
  bool _isGenerateProductNamesLoading = false;
  bool _isSaveProductLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  set isLoading(value) {
    _isLoading = value;
    Forest.success('Notify listeners notified.');
    notifyListeners();
  }

  bool get isGenerateProductDescriptionLoading {
    return _isGenerateProductDescriptionLoading;
  }

  set isGenerateProductDescriptionLoading(value) {
    _isGenerateProductDescriptionLoading = value;
    Forest.success('Notify listeners notified.');
    notifyListeners();
  }

  bool get isGenerateProductNamesLoading {
    return _isGenerateProductNamesLoading;
  }

  set isGenerateProductNamesLoading(value) {
    _isGenerateProductNamesLoading = value;
    Forest.success('Notify listeners notified.');
    notifyListeners();
  }

  bool get isSaveProductLoading {
    return _isSaveProductLoading;
  }

  set isSaveProductLoading(value) {
    _isSaveProductLoading = value;
    Forest.success('Notify listeners notified.');
    notifyListeners();
  }
}

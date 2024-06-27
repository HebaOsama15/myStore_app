import 'package:flutter/material.dart';

class LoginState with ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners(); 
  }

  void setErrorMessage(String? errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners(); 
  }
}

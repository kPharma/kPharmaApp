import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  String _userName = "Rawa Swr";
  String _email = "rawa.priv@gmail.com";
  // Add other profile fields here, if necessary

  String get userName => _userName;
  String get email => _email;
  // Add getters for other fields here, if necessary

  void changeName(String newName) {
    _userName = newName;
    notifyListeners();
  }

  void changeEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  // Add other methods for updating profile data here, if necessary
}

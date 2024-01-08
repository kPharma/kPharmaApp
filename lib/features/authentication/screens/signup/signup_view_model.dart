import 'package:flutter/material.dart';

class SignupViewModel extends ChangeNotifier {
  String _email = '';
  String _password = '';
  String _name = '';
  String _phoneNumber = '';

  String get email => _email;
  String get password => _password;
  String get name => _name;
  String get phoneNumber => _phoneNumber;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

  Future<bool> submitSignupForm() async {
    // Logic to handle signup
    // For a real app, you would make an API call here with the signup data
    await Future.delayed(
        const Duration(seconds: 2)); // Simulating a network call

    // This is a dummy response. In a real scenario, handle the API response.
    return true; // Return true if the signup was successful
  }

  // Add any other methods and logic as necessary
}

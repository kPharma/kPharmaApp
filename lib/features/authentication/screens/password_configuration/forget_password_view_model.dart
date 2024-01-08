import 'package:flutter/material.dart';

class ForgetPasswordViewModel extends ChangeNotifier {
  String _email = '';

  String get email => _email;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  Future<bool> submitPasswordResetRequest() async {
    // Placeholder logic for a password reset request
    // In a real app, you would make an API call here with the email address
    await Future.delayed(
        const Duration(seconds: 2)); // Simulating network call delay

    // This is a dummy response. In a real scenario, handle the API response.
    return true; // Return true if the request was successful
  }

  // Add any other methods and logic as necessary
}

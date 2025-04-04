import 'package:http/http.dart' as http;
import 'dart:convert';

void _signUp() async {
  String userName = _usernameController.text.trim();
  String email = _emailController.text.trim();
  String password = _passwordController.text;
  String confirmPassword = _confirmPasswordController.text;

  if (userName.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Please fill all fields")),
    );
    return;
  }

  if (!email.endsWith('@gmail.com')) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Only Gmail addresses are allowed")),
    );
    return;
  }

  if (password.length < 6) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Password must be at least 6 characters")),
    );
    return;
  }

  if (password != confirmPassword) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Passwords do not match")),
    );
    return;
  }

  // 🚀 Make API Call
  final url = Uri.parse("http://192.168.50.136:5000/api/register"); // Replace <your-server-ip> with actual IP
  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "userName": userName,
      "email": email,
      "password": password,
    }),
  );

  final responseData = jsonDecode(response.body);

  if (response.statusCode == 201) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(responseData["message"])),
    );
    Navigator.pushReplacementNamed(context, '/home');
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(responseData["message"] ?? "Sign up failed")),
    );
  }
}

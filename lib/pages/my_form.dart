// import 'package:flutter/material.dart';
// // import 'package:one/my_profile.dart';
//
// class MyForm extends StatefulWidget {
//   const MyForm({super.key});
//
//   @override
//   State<MyForm> createState() => _MyFormState();
// }
//
// class _MyFormState extends State<MyForm> {
//   final _formKey = GlobalKey<FormState>();
//   final nameController = TextEditingController();
//   final passwordController = TextEditingController();
//   bool rememberMe = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(24.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 32),
//                 const Center(
//                   child: Text(
//                     "Welcome Back",
//                     style: TextStyle(
//                       fontSize: 36,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.purple,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 const Center(
//                   child: Text(
//                     "Enter your credentials to login",
//                     style: TextStyle(fontSize: 16, color: Colors.black54),
//                   ),
//                 ),
//                 const SizedBox(height: 88),
//
//                 // Username Field
//                 TextFormField(
//                   controller: nameController,
//                   decoration: InputDecoration(
//                     labelText: "User Name",
//                     prefixIcon: const Icon(Icons.person),
//                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
//                     filled: true,
//                     fillColor: Colors.redAccent[50],
//                   ),
//                   validator: (value) => value!.isEmpty ? "Enter username" : null,
//                 ),
//
//                 const SizedBox(height: 16),
//
//                 // Password Field
//                 TextFormField(
//                   controller: passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: "Password",
//                     prefixIcon: const Icon(Icons.lock),
//                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
//                     filled: true,
//                     fillColor: Colors.redAccent[50],
//                   ),
//                   validator: (value) => value!.isEmpty ? "Enter password" : null,
//                 ),
//
//                 const SizedBox(height: 8),
//
//                 // Remember Me Checkbox
//                 Row(
//                   children: [
//                     Checkbox(
//                       value: rememberMe,
//                       onChanged: (value) {
//                         setState(() {
//                           rememberMe = value!;
//                         });
//                       },
//                     ),
//                     const Text("Remember Me!"),
//                   ],
//                 ),
//
//                 const SizedBox(height: 24),
//
//                 // Login Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => MyProfile(name: nameController.text),
//                           ),
//                         );
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.purple,
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//                       textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     child: const Text("Login"),
//                   ),
//                 ),
//
//                 const SizedBox(height: 24),
//
//                 // Forgot Password Button
//                 Center(
//                   child: TextButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/profile');
//                     },
//                     child: const Text("Forgot Password?"),
//                   ),
//                 ),
//
//                 const SizedBox(height: 24),
//
//                 // Sign Up Button
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text("Don't have an account?"),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, '/reg');
//                       },
//                       child: const Text("Sign Up"),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 32),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

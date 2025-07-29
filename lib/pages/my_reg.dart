// import 'package:flutter/material.dart';
// // import 'package:one/my_profile.dart';
//
// class MyReg extends StatefulWidget {
//   const MyReg({super.key});
//
//   @override
//   State<MyReg> createState() => _MyFormState();
// }
//
// class _MyFormState extends State<MyReg> {
//   final _formKey = GlobalKey<FormState>();
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();
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
//                     "Sign Up",
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
//                     "Create your Account",
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
//                   controller: emailController,
//                   obscureText: true,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//
//                     labelText: "Email",
//                     prefixIcon: const Icon(Icons.email),
//                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
//                     filled: true,
//                     fillColor: Colors.redAccent[50],
//                   ),
//                   validator: (value) => value!.isEmpty ? "Enter Email" : null,
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
//                 const SizedBox(height: 16),
//
//                 // Confirm Password Field
//                 TextFormField(
//                   controller: confirmPasswordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: "Confirm Password",
//                     prefixIcon: const Icon(Icons.lock),
//                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
//                     filled: true,
//                     fillColor: Colors.redAccent[50],
//                   ),
//                   validator: (value) => value!.isEmpty ? "Enter password" : null,
//                 ),
//
//                 const SizedBox(height: 16),
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
//                     child: const Text("Sign Up"),
//                   ),
//                 ),
//
//                 const SizedBox(height: 16,),
//                 // Remember Me Checkbox
//                 Center(
//                   child: Text("Or", style: TextStyle(fontSize: 20, color: Colors.black54, fontWeight: FontWeight.bold),),
//                 ),
//
//                 const SizedBox(height: 16),
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
//                       // backgroundColor: Colors.purple,
//                       foregroundColor: Colors.purple,
//                       padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//                       textStyle: const TextStyle(fontSize: 20),
//                     ),
//                     child: const Text("Sign in with Google"),
//                   ),
//                 ),
//
//
//                 const SizedBox(height: 24),
//
//                 // Sign Up Button
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text("Already have an account?"),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, '/log_in');
//                       },
//                       child: const Text("Log in"),
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

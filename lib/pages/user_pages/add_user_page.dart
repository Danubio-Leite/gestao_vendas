// import 'package:flutter/material.dart';

// import '../../models/user.dart';

// class AddUserPage extends StatefulWidget {
//   const AddUserPage({super.key});

//   @override
//   State<AddUserPage> createState() => _AddUserPageState();
// }

// class _AddUserPageState extends State<AddUserPage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   User user = User();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Novo Usuário'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               TextFormField(
//                 onChanged: (value) {
//                   user.name = value;
//                 },
//                 decoration: const InputDecoration(
//                   hintText: 'Nome',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Campo obrigatorio!';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 obscureText: true,
//                 onChanged: (value) {
//                   user.password = value;
//                 },
//                 decoration: const InputDecoration(
//                   hintText: 'Senha',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Campo obrigatorio!';
//                   }
//                   return null;
//                 },
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         Navigator.pop(context, user);
//                       }
//                     },
//                     child: const Text('Gravar Usuário')),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

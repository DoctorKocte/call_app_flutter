// import 'package:call_app/features/users/action_buttons.dart';
// import 'package:call_app/features/main/user_bloc/user_bloc.dart';
// import 'package:call_app/features/users/users_list.dart';
// import 'package:call_app/services/users/user_repository.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class MyHomePage extends StatelessWidget {
//   MyHomePage({super.key});

//   final usersRepository = UserRepository();

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<UserBloc>(
//       create: (context) => UserBloc(usersRepository: usersRepository),
//       child: Scaffold(
//         backgroundColor: const Color.fromARGB(255, 216, 228, 229),
//         appBar: AppBar(
//           title: const Text('Users'),
//           centerTitle: true,
//           backgroundColor: Colors.transparent
//         ),
//         body: const Column(
//           children: [ 
//             ActionButtons(),
//             // Expanded(
//             //   child: UsersList()
//             // )
//         ]),
//       ),
//     );
//   }
// }

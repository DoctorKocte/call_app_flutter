import 'dart:convert';

import 'package:call_app/features/users/user_bloc/user_bloc.dart';
import 'package:call_app/features/users/user_bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return switch (state) {
          UserEmptyState() => const Center(child: Text('List is empty.')),
          UserLoadingState() => const Center(child: CircularProgressIndicator()),
          UserErrorState() => const Center(child: Text('Something went wrong!')),
          UserDataState() => Builder(builder: (context) {
            final users = state.usersData.users;
            return users.isEmpty 
            ? const Center(child: Text('List is empty.'))
            : Padding(
              padding: const EdgeInsets.all(6),
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) =>  Card(
                    child: ListTile(
                      leading: (users[index].imageString != null) 
                        ? Image.memory(base64Decode(users[index].imageString!))
                        : const Icon(Icons.perm_media_sharp),
                      title: Text('${users[index].firstName} ${users[index].lastName}'),
                      subtitle: Text('phone number: ${users[index].phoneNumber ?? 'empty'}'),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                      ),
                    )),
                  ));
            })
        };
      },
    );
  }
}

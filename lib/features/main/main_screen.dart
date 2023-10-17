import 'package:call_app/assets/fonts.gen.dart';
import 'package:call_app/features/main/cards_scroll_view.dart';
import 'package:call_app/features/main/contacts_list.dart';
import 'package:call_app/features/main/favorite_card.dart';
import 'package:call_app/features/users/action_buttons.dart';
import 'package:call_app/features/users/user_bloc/user_bloc.dart';
import 'package:call_app/features/users/user_bloc/user_state.dart';
import 'package:call_app/features/users/users_list.dart';
import 'package:call_app/services/users/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_ui/open_ui.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final usersRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;

    return BlocProvider<UserBloc>(
        create: (context) => UserBloc(usersRepository: usersRepository),
        child: Scaffold(
          backgroundColor: colorScheme.background.main,
          appBar: AppBar(
              //toolbarHeight: 0,
              forceMaterialTransparency: true,
              title: Text('Welcome'),
              titleTextStyle:  TextStyle(
                            fontFamily: FontFamily.graphik,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: colorScheme.textColor.black),
              //foregroundColor: colorScheme.textColor.black,
              centerTitle: true,
              //surfaceTintColor: colorScheme.textColor.black,
              backgroundColor: Colors.transparent,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              leading: Padding(padding: EdgeInsets.all(16), child: Image.asset('assets/images/menu.png')),
              //  IconButton(
              //     onPressed: () {},
              //     icon: Icon(Icons.account_circle_rounded)),
              
              actions: <Widget>[Padding(padding: EdgeInsets.all(16), child:Image.asset('assets/images/teamwork.png'))]
              ),
          body:  BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return switch (state) {
          UserEmptyState() => const Center(child: Text('List is empty.')),
          UserLoadingState() => const Center(child: CircularProgressIndicator()),
          UserErrorState() => const Center(child: Text('Something went wrong!')),
          UserDataState() => Builder(builder: (context) { return 
            SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                //SizedBox(height: 32),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Favorites',
                        style: TextStyle(
                            fontFamily: FontFamily.graphik,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.textColor.black))),
                SizedBox(
                    height: 366, // MediaQuery.of(context).size.height / 2.3,
                    child: CardsScrollView(contacts: state.userData.contacts,)),
                SizedBox(height: 32),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Recent',
                              style: TextStyle(
                                  fontFamily: FontFamily.graphik,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.textColor.black)),
                          //Spacer(),
                          Text('All',
                              style: TextStyle(
                                  fontFamily: FontFamily.graphik,
                                  fontSize: 18,
                                  //fontWeight: FontWeight.w500,
                                  color: colorScheme.textColor.lightBlue)),
                        ])),
                ContactsList()
                //   Flexible(child:
                //  Column(children: [  ContactsList()]))
              ]));
          
          
          //Center(child: Text('load !'))
          })
        };
      })
          
         
        ));
  }
}

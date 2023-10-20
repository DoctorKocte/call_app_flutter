import 'package:call_app/assets/fonts.gen.dart';
import 'package:call_app/features/friend_profile/presentation/friend_profile_screen.dart';
import 'package:call_app/features/main/domain/repository/user_repository.dart';
import 'package:call_app/features/main/domain/service/user_service.dart';
import 'package:call_app/features/main/models/favorite_card_model.dart';
import 'package:call_app/features/main/models/recent_contact.dart';
import 'package:call_app/features/main/presentation/bloc/user_bloc.dart';
import 'package:call_app/features/main/presentation/bloc/user_state.dart';
import 'package:call_app/features/main/presentation/cards_scroll_view.dart';
import 'package:call_app/features/main/presentation/contacts_list.dart';
import 'package:call_app/features/profile/presentation/profile_screen.dart';
import 'package:call_app/features/users/models/user_model.dart';
import 'package:call_app/network/endpoint_config.dart';
import 'package:call_app/network/request_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_ui/open_ui.dart';

class MainScreen extends StatefulWidget {
  const MainScreen(
      {required this.requestService, required this.endpointConfig, super.key});

  final RequestService requestService;
  final EndpointConfig endpointConfig;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late UserService userService;

  User? userData;

  @override
  void initState() {
    userService = UserService(
        userRepository: UserRepository(
            requestService: widget.requestService,
            endpointConfig: widget.endpointConfig));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;

    final gradients = [
      colorScheme.gradients.purple,
      colorScheme.gradients.blue,
      colorScheme.gradients.red,
      colorScheme.gradients.pink,
      colorScheme.gradients.green
    ];

    final backgroundColors = [
      colorScheme.background.purpleBackground,
      colorScheme.background.blueBackground,
      colorScheme.background.redBackground,
      colorScheme.background.lightBlueBackground,
      colorScheme.background.greenBackground
    ];

    final buttonColors = [
      colorScheme.background.purpleButton,
      colorScheme.background.blueButton,
      colorScheme.background.redButton,
      colorScheme.background.lightBlueButton,
      colorScheme.background.greenButton
    ];

    return BlocProvider<UserBloc>(
        create: (context) => UserBloc(userService: userService),
        child: Scaffold(
            backgroundColor: colorScheme.background.main,
            appBar: AppBar(
                forceMaterialTransparency: true,
                title: Text('Welcome'),
                titleTextStyle: TextStyle(
                    fontFamily: FontFamily.graphik,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.textColor.black),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                systemOverlayStyle: SystemUiOverlayStyle.dark,
                leading: Padding(
                    padding: EdgeInsets.all(16),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProfileScreen(
                                  userData: userData!,
                                  userService: userService)));
                        },
                        child: Image.asset('assets/images/menu.png'))),
                actions: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(16),
                      child: Image.asset('assets/images/teamwork.png'))
                ]),
            body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
              return switch (state) {
                UserEmptyState() => const Center(child: Text('List is empty.')),
                UserLoadingState() =>
                  const Center(child: CircularProgressIndicator()),
                UserErrorState() =>
                  const Center(child: Text('Something went wrong!')),
                UserDataState() => Builder(builder: (context) {
                    userData = state.userData;
                    return SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text('Favorites',
                                  style: TextStyle(
                                      fontFamily: FontFamily.graphik,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: colorScheme.textColor.black))),
                          SizedBox(
                              height: 366,
                              child: state.userData.contacts.isEmpty
                                  ? Center(
                                      child: Text(
                                          'You don\'t have any favorite contact.\nAdd it on the user details screen',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              height: 0.9,
                                              fontFamily: FontFamily.graphik,
                                              fontSize: 20,
                                              color:
                                                  colorScheme.textColor.black)))
                                  :   CardsScrollView(  // проверка на isFavorite
                                      favoriteCardModels: state.userData.contacts.asMap().map((index, contact) =>  MapEntry(index, FavoriteCardModel(
                                        backgroundGradient: gradients[index],
                                        buttonBackground: buttonColors[index],
                                        backgroundColor: backgroundColors[index],
                                        contact: contact
                                      ))).values.toList(),
                                      onCardTap: (favoriteCardModel) {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => FriendProfileScreen(favoriteCardModel: favoriteCardModel)));
                                      },
                                    )),
                          SizedBox(height: 32),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Recent',
                                        style: TextStyle(
                                            fontFamily: FontFamily.graphik,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                colorScheme.textColor.black)),
                                    Text('All',
                                        style: TextStyle(
                                            fontFamily: FontFamily.graphik,
                                            fontSize: 18,
                                            color: colorScheme
                                                .textColor.lightBlue)),
                                  ])),
                          Padding(
                              padding: const EdgeInsets.all(20),
                              // поменять на isNotEmpty для теста с recent contacts
                              child: state.userData.recentContacts.isNotEmpty
                                  ? Center(
                                      child: Text(
                                          'You don\'t have any recent contact now.\nCall anybody',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              height: 0.9,
                                              fontFamily: FontFamily.graphik,
                                              fontSize: 20,
                                              color:
                                                  colorScheme.textColor.black)))
                                  : ContactsList(
                                      recentContacts:
                                       [RecentContact(date: DateTime.now(), contact: state.userData.contacts.first),
                                          RecentContact(date: DateTime.now(), contact: state.userData.contacts.last)]
                                          //state.userData.recentContacts))
                                         ))
                                          // для теста можно передать
                                          // [
                                          
                                          // ]
                        ]));
                  })
              };
            })));
  }
}

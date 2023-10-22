import 'package:call_app/assets/assets.gen.dart';
import 'package:call_app/features/friend_profile/presentation/friend_profile_screen.dart';
import 'package:call_app/features/main/domain/repository/user_repository.dart';
import 'package:call_app/features/main/domain/service/user_service.dart';
import 'package:call_app/features/main/models/favorite_card_model.dart';
import 'package:call_app/features/main/models/user_model.dart';
import 'package:call_app/features/main/presentation/bloc/user_bloc.dart';
import 'package:call_app/features/main/presentation/bloc/user_state.dart';
import 'package:call_app/features/main/presentation/cards_scroll_view.dart';
import 'package:call_app/features/main/presentation/contacts_list.dart';
import 'package:call_app/features/profile/presentation/profile_screen.dart';
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
    final textStyles =
        appTheme.textStyles.withColor(colorScheme.textColor.black);
    final spacer = appTheme.spacer;

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
                title: const Text('Welcome'),
                titleTextStyle: textStyles.graphik18semibold,
                centerTitle: true,
                backgroundColor: Colors.transparent,
                systemOverlayStyle: SystemUiOverlayStyle.dark,
                leading: Padding(
                    padding: EdgeInsets.all(spacer.sp16),
                    child: GestureDetector(
                        onTap: () {
                          if (userData != null) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProfileScreen(
                                  userData: userData!,
                                  userService: userService)));
                          }
                        },
                        child: Assets.images.menu.image())),
                actions: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(spacer.sp16),
                      child: Assets.images.teamwork.image())
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
                              padding:
                                  EdgeInsets.symmetric(horizontal: spacer.sp16),
                              child: Text('Favorites',
                                  style: textStyles.graphik24semibold)),
                          SizedBox(
                              height: 366,
                              child: state.userData.contacts.isEmpty
                                  ? Center(
                                      child: Text(
                                          "You don't have any favorite contact.\nAdd it on the user details screen",
                                          textAlign: TextAlign.center,
                                          style: textStyles.graphik20normal
                                              .copyWith(height: 0.9)))
                                  : CardsScrollView(
                                      // без проверки на isFavorite, тк мало контактов и бэк не совсем готов
                                      favoriteCardModels: state
                                          .userData.contacts
                                          .asMap()
                                          .map((index, contact) => MapEntry(
                                              index,
                                              FavoriteCardModel(
                                                  backgroundGradient:
                                                      gradients[index],
                                                  buttonBackground:
                                                      buttonColors[index],
                                                  backgroundColor:
                                                      backgroundColors[index],
                                                  contact: contact)))
                                          .values
                                          .toList(),
                                      onCardTap: (favoriteCardModel) {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    FriendProfileScreen(
                                                        favoriteCardModel:
                                                            favoriteCardModel)));
                                      },
                                    )),
                          const SizedBox(height: 32),
                          Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: spacer.sp16),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Recent',
                                        style: textStyles.graphik24semibold),
                                    Text('All',
                                        style: textStyles.graphik18semibold
                                            .copyWith(
                                                color: colorScheme
                                                    .textColor.lightBlue)),
                                  ])),
                          Padding(
                              padding: EdgeInsets.all(spacer.sp20),
                              // поменять на isNotEmpty для теста с recent contacts на акке valek
                              child: state.userData.recentContacts.isEmpty
                                  ? Center(
                                      child: Text(
                                          "You don't have any recent contact now.\nCall anybody",
                                          textAlign: TextAlign.center,
                                          style: textStyles.graphik20normal
                                              .copyWith(height: 0.9)))
                                  : ContactsList(
                                      recentContacts:
                                          state.userData.recentContacts
                                      //  [
                                      //     RecentContact(
                                      //         date: DateTime.now(),
                                      //         contact:
                                      //             state.userData.contacts.first),
                                      //     RecentContact(
                                      //         date: DateTime.now(),
                                      //         contact: state.userData.contacts.last)
                                      //   ]
                                      ))
                        ]));
                  })
              };
            })));
  }
}

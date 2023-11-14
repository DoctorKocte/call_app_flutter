import 'package:call_app/assets/assets.gen.dart';
import 'package:call_app/features/all_contacts/presentation/add_friend_view.dart';
import 'package:call_app/features/friend_profile/presentation/friend_profile_screen.dart';
import 'package:call_app/features/main/models/contact.dart';
import 'package:call_app/features/main/models/favorite_card_model.dart';
import 'package:call_app/features/main/presentation/contact_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_ui/open_ui.dart';

class AllContactsScreen extends StatelessWidget {
  const AllContactsScreen({required this.contacts, super.key});

  final List<Contact> contacts;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;
    final spacer = appTheme.spacer;
    final textStyles =
        appTheme.textStyles.withColor(colorScheme.textColor.black);

    return Scaffold(
        backgroundColor: colorScheme.background.main,
        appBar: AppBar(
            title: const Text('All Contacts'),
            titleTextStyle: textStyles.graphik18semibold,
            foregroundColor: colorScheme.textColor.black,
            centerTitle: true,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.all(spacer.sp16),
                  child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child:
                                      const Wrap(children: [AddFriendView()]),
                                ));
                      },
                      child: Assets.images.addFriendButton.image()))
            ]),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: spacer.sp16),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.symmetric(vertical: spacer.sp10),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => FriendProfileScreen(
                                    favoriteCardModel: FavoriteCardModel(
                                        backgroundColor:
                                            colorScheme.background.black,
                                        buttonBackground:
                                            colorScheme.background.lightBlack,
                                        backgroundGradient: [],
                                        contact: contacts[index]))));
                          },
                          child: ContactView(
                            contact: contacts[index],
                            isLastnameNeeded: true,
                          )));
                })));
  }
}

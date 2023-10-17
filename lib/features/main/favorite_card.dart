import 'package:call_app/assets/assets.gen.dart';
import 'package:call_app/assets/fonts.gen.dart';
import 'package:call_app/features/main/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({required this.backgroundGradient, required this.contact, super.key});

  final List<Color> backgroundGradient;
  final Contact contact;

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;

    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: widget.backgroundGradient),
          borderRadius: BorderRadius.circular(16),
          )
      ),
      Padding(
          padding: EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    color: colorScheme.background.white,
                    borderRadius: BorderRadius.circular(45),
                    image: DecorationImage(
                        image: Assets.images.addFriend.provider()))),
            SizedBox(height: 48),
            Text(widget.contact.username ?? '', style: TextStyle(
                                  fontFamily: FontFamily.graphik,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      colorScheme.textColor.white)),
            //SizedBox(height: 8),
            Text('Huyemochka', style: TextStyle(
                                  fontFamily: FontFamily.graphik,
                                  fontSize: 24,
                                  color:
                                      colorScheme.textColor.white),),
            SizedBox(height: 20),
            Text('dura zaebala zvonit', style: TextStyle(
                                  fontFamily: FontFamily.graphik,
                                  fontSize: 14,
                                  color:
                                      colorScheme.textColor.white)),
                                      Spacer(),
            Center(child:
            Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                    color: colorScheme.background.white20,
                    borderRadius: BorderRadius.circular(21)),
                child: Padding(padding: EdgeInsets.all(8), child: Assets.images.call.image())
            ))
          ]))
    ]);
  }
}

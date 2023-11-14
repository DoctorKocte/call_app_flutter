import 'package:call_app/assets/assets.gen.dart';
import 'package:call_app/components/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class AddFriendView extends StatelessWidget {
  const AddFriendView({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;
    final spacer = appTheme.spacer;
    final textStyles =
        appTheme.textStyles.withColor(colorScheme.textColor.black);

    return Padding(padding: EdgeInsets.symmetric(vertical: spacer.sp40, horizontal: spacer.sp20), child: Column(
      children: [        
        SizedBox(height: 120, width: 120, child: Assets.images.addFriend.image()),
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: spacer.sp40, vertical: spacer.sp20),
            child: Text(
              'To add a new contact just write its username in a field below',
              textAlign: TextAlign.center,
              style: textStyles.graphik16semibold.copyWith(height: 0.9),
            )),
        InputTextField(textFieldTitle: 'Username', text: '', onChanged: (_) {}, onClearButtonPressed: (_) {})
      ],
    ));
  }
}

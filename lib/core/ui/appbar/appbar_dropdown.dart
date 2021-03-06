import 'package:flutter/material.dart';
import 'package:lunasea/core.dart';

// ignore: non_constant_identifier_names
Widget LSAppBarDropdown({
    @required BuildContext context,
    @required String title,
    @required List<String> profiles,
    List<Widget> actions
}) => profiles != null && profiles.length < 2
    ? LunaAppBar(context: context, title: title, actions: actions, hideLeading: true)
    : AppBar(
        title: PopupMenuButton<String>(
            shape: LunaDatabaseValue.THEME_AMOLED.data && LunaDatabaseValue.THEME_AMOLED_BORDER.data
                ? LSRoundedShapeWithBorder()
                : LSRoundedShape(),
            child: Wrap(
                direction: Axis.horizontal,
                children: [
                    Text(
                        title,
                        style: TextStyle(
                            fontSize: Constants.UI_FONT_SIZE_HEADER,
                        ),
                    ),
                    LSIcon(
                        icon: Icons.arrow_drop_down,
                    ),
                ],
            ),
            onSelected: (result) => LunaProfile().safelyChangeProfiles(context, result),
            itemBuilder: (context) {
                return <PopupMenuEntry<String>>[for(String profile in profiles) PopupMenuItem<String>(
                    value: profile,
                    child: Text(
                        profile,
                        style: TextStyle(
                            fontSize: Constants.UI_FONT_SIZE_SUBTITLE,
                        ),
                    ),
                )];
            },
        ),
        centerTitle: false,
        elevation: 0,
        actions: actions,
    );

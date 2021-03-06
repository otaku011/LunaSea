import 'package:flutter/material.dart';
import 'package:lunasea/core.dart';

class LSButton extends StatelessWidget {
    final String text;
    final Function onTap;
    final Color backgroundColor;
    final Color textColor;
    final bool reducedMargin;
    final bool isLoading;

    LSButton({
        @required this.text,
        @required this.onTap,
        this.backgroundColor = const Color(LunaColours.ACCENT_COLOR),
        this.textColor = Colors.white,
        this.reducedMargin = false,
        this.isLoading = false,
    });

    @override
    Widget build(BuildContext context) => Row(
        children: <Widget>[
            Expanded(
                child: Card(
                    child: InkWell(
                        child: ListTile(
                            title: isLoading
                                ? LSLoader(
                                    color: Colors.white,
                                    size: 20.0,
                                )
                                : Text(
                                    text,
                                    style: TextStyle(
                                        color: textColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Constants.UI_FONT_SIZE_STICKYHEADER,
                                    ),
                                    textAlign: TextAlign.center,
                                ),
                        ),
                        borderRadius: BorderRadius.circular(Constants.UI_BORDER_RADIUS),
                        onTap: isLoading ? null : onTap,
                    ),
                    color: backgroundColor,
                    margin: reducedMargin
                        ? EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0)
                        : Constants.UI_CARD_MARGIN,
                    elevation: Constants.UI_ELEVATION,
                    shape: LSRoundedShape(),
                ),
            ),
        ],
    );
}
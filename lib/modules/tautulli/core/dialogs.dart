import 'package:flutter/material.dart';
import 'package:lunasea/core.dart';
import 'package:lunasea/modules/tautulli.dart';

class TautulliDialogs {
    TautulliDialogs._();
    
    static Future<List<dynamic>> globalSettings(BuildContext context) async {
        bool _flag = false;
        TautulliGlobalSettingsType _value;
        
        void _setValues(bool flag, TautulliGlobalSettingsType value) {
            _flag = flag;
            _value = value;
            Navigator.of(context, rootNavigator: true).pop();
        }

        await LSDialog.dialog(
            context: context,
            title: 'Tautulli Settings',
            content: List.generate(
                TautulliGlobalSettingsType.values.length,
                (index) => LSDialog.tile(
                    text: TautulliGlobalSettingsType.values[index].name,
                    icon: TautulliGlobalSettingsType.values[index].icon,
                    iconColor: LunaColours.list(index),
                    onTap: () => _setValues(true, TautulliGlobalSettingsType.values[index]),
                ),
            ),
            contentPadding: LSDialog.listDialogContentPadding(),
        );
        return [_flag, _value];
    }

    static Future<List<dynamic>> setDefaultPage(BuildContext context, {
        @required List<String> titles,
        @required List<IconData> icons,
    }) async {
        bool _flag = false;
        int _index = 0;

        void _setValues(bool flag, int index) {
            _flag = flag;
            _index = index;
            Navigator.of(context, rootNavigator: true).pop();
        }

        await LSDialog.dialog(
            context: context,
            title: 'Default Page',
            content: List.generate(
                titles.length,
                (index) => LSDialog.tile(
                    text: titles[index],
                    icon: icons[index],
                    iconColor: LunaColours.list(index),
                    onTap: () => _setValues(true, index),
                ),
            ),
            contentPadding: LSDialog.listDialogContentPadding(),
        );
        
        return [_flag, _index];
    }

    static Future<List<dynamic>> terminateSession(BuildContext context) async {
        bool _flag = false;
        GlobalKey<FormState> _formKey = GlobalKey<FormState>();
        TextEditingController _textController = TextEditingController(text: TautulliDatabaseValue.TERMINATION_MESSAGE.data);

        void _setValues(bool flag) {
            if(_formKey.currentState.validate()) {
                _flag = flag;
                Navigator.of(context, rootNavigator: true).pop();
            }
        }

        await LSDialog.dialog(
            context: context,
            title: 'Terminate Session',
            buttons: [
                LSDialog.button(
                    text: 'Terminate',
                    textColor: LunaColours.red,
                    onPressed: () => _setValues(true),
                ),
            ],
            content: [
                LSDialog.textContent(text: 'Do you want to terminate this session?\n'),
                LSDialog.textContent(text: 'You can optionally attach a termination message below.'),
                Form(
                    key: _formKey,
                    child: LSDialog.textFormInput(
                        controller: _textController,
                        title: 'Termination Message',
                        onSubmitted: (_) => _setValues(true),
                        validator: (_) => null,
                    ),
                ),
            ],
            contentPadding: LSDialog.inputTextDialogContentPadding(),
        );

        return [_flag, _textController.text];
    }

    static Future<List<dynamic>> setRefreshRate(BuildContext context) async {
        bool _flag = false;
        GlobalKey<FormState> _formKey = GlobalKey<FormState>();
        TextEditingController _textController = TextEditingController(text: TautulliDatabaseValue.REFRESH_RATE.data.toString());

        void _setValues(bool flag) {
            if(_formKey.currentState.validate()) {
                _flag = flag;
                Navigator.of(context, rootNavigator: true).pop();
            }
        }

        await LSDialog.dialog(
            context: context,
            title: 'Refresh Rate',
            buttons: [
                LSDialog.button(
                    text: 'Set',
                    onPressed: () => _setValues(true),
                ),
            ],
            content: [
                LSDialog.textContent(text: 'Set the rate at which the activity information will refresh at in seconds.'),
                Form(
                    key: _formKey,
                    child: LSDialog.textFormInput(
                        controller: _textController,
                        title: 'Refresh Rate',
                        onSubmitted: (_) => _setValues(true),
                        validator: (value) {
                            int _value = int.tryParse(value);
                            if(_value != null && _value >= 1) return null;
                            return 'Minimum of 1 Second';
                        },
                        keyboardType: TextInputType.number,
                    ),
                ),              
            ],
            contentPadding: LSDialog.inputTextDialogContentPadding(),
        );

        return [_flag, int.tryParse(_textController.text) ?? 10];
    }

    static Future<List<dynamic>> setStatisticsItemCount(BuildContext context) async {
        bool _flag = false;
        GlobalKey<FormState> _formKey = GlobalKey<FormState>();
        TextEditingController _textController = TextEditingController(text: TautulliDatabaseValue.STATISTICS_STATS_COUNT.data.toString());

        void _setValues(bool flag) {
            if(_formKey.currentState.validate()) {
                _flag = flag;
                Navigator.of(context, rootNavigator: true).pop();
            }
        }

        await LSDialog.dialog(
            context: context,
            title: 'Statistics Item Count',
            buttons: [
                LSDialog.button(
                    text: 'Set',
                    onPressed: () => _setValues(true),
                ),
            ],
            content: [
                LSDialog.textContent(text: 'Set the amount of items fetched for each category in the statistics.'),
                Form(
                    key: _formKey,
                    child: LSDialog.textFormInput(
                        controller: _textController,
                        title: 'Item Count',
                        onSubmitted: (_) => _setValues(true),
                        validator: (value) {
                            int _value = int.tryParse(value);
                            if(_value != null && _value >= 1) return null;
                            return 'Minimum of 1 Item';
                        },
                        keyboardType: TextInputType.number,
                    ),
                ),              
            ],
            contentPadding: LSDialog.inputTextDialogContentPadding(),
        );

        return [_flag, int.tryParse(_textController.text) ?? 3];
    }

    static Future<List<dynamic>> setTerminationMessage(BuildContext context) async {
        bool _flag = false;
        GlobalKey<FormState> _formKey = GlobalKey<FormState>();
        TextEditingController _textController = TextEditingController(text: TautulliDatabaseValue.TERMINATION_MESSAGE.data);

        void _setValues(bool flag) {
            if(_formKey.currentState.validate()) {
                _flag = flag;
                Navigator.of(context, rootNavigator: true).pop();
            }
        }

        await LSDialog.dialog(
            context: context,
            title: 'Termination Message',
            buttons: [
                LSDialog.button(
                    text: 'Set',
                    onPressed: () => _setValues(true),
                ),
            ],
            content: [
                LSDialog.textContent(text: 'Set a default, prefilled message for terminating sessions.'),
                Form(
                    key: _formKey,
                    child: LSDialog.textFormInput(
                        controller: _textController,
                        title: 'Termination Message',
                        onSubmitted: (_) => _setValues(true),
                        validator: (value) => null,
                    ),
                ),              
            ],
            contentPadding: LSDialog.inputTextDialogContentPadding(),
        );

        return [_flag, _textController.text];
    }
}
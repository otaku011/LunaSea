import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lunasea/core.dart';
import 'package:lunasea/modules/settings.dart';

class SettingsSystemBackupRestoreBackupTile extends StatelessWidget {
    @override
    Widget build(BuildContext context) => LSCardTile(
        title: LSTitle(text: 'Backup to Device'),
        subtitle: LSSubtitle(text: 'Backup Configuration Data'),
        trailing: LSIconButton(icon: Icons.upload_rounded),
        onTap: () async => _backup(context),
    );

    Future<void> _backup(BuildContext context) async {
        try {
            List<dynamic> _values = await SettingsDialogs.backupConfiguration(context);
            if(_values[0]) {
                String data = LunaConfiguration().export();
                String encrypted = LunaEncryption().encrypt(_values[1], data);
                String name = DateFormat('y-MM-dd kk-mm-ss').format(DateTime.now());
                if(encrypted != LunaEncryption.ENCRYPTION_FAILURE) await LunaFileSystem().exportStringToShareSheet('$name.lunasea', encrypted);
            }
        } catch (error, stack) {
            LunaLogger().error('Backup Failed', error, stack);
            showLunaErrorSnackBar(
                context: context,
                title: 'Failed to Backup',
                error: error,
            );
        }
    }
}

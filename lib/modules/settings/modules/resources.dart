import 'dart:io';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:lunasea/core.dart';

class SettingsResourcesRouter extends LunaPageRouter {
    SettingsResourcesRouter() : super('/settings/resources');

    @override
    void defineRoute(FluroRouter router) => super.noParameterRouteDefinition(router, _SettingsResourcesRoute());
}

class _SettingsResourcesRoute extends StatefulWidget {
    @override
    State<_SettingsResourcesRoute> createState() => _State();
}

class _State extends State<_SettingsResourcesRoute> {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    @override
    Widget build(BuildContext context) => Scaffold(
        key: _scaffoldKey,
        appBar: _appBar,
        body: _body,
    );

    Widget get _appBar => LunaAppBar(
        context: context,
        title: 'Resources',
    );

    Widget get _body => LSListView(
        children: [
            LSCardTile(
                title: LSTitle(text: 'Discord'),
                subtitle: LSSubtitle(text: 'Chat & Discussions'),
                trailing: LSIconButton(icon: CustomIcons.discord),
                onTap: () async => await Constants.URL_DISCORD.lunaOpenGenericLink(),
            ),
            LSCardTile(
                title: LSTitle(text: 'Documentation'),
                subtitle: LSSubtitle(text: 'View the Documentation'),
                trailing: LSIconButton(icon: CustomIcons.documentation),
                onTap: () async => await Constants.URL_DOCUMENTATION.lunaOpenGenericLink(),
            ),
            LSCardTile(
                title: LSTitle(text: 'Feedback Board'),
                subtitle: LSSubtitle(text: 'Request New Features'),
                trailing: LSIconButton(icon: Icons.speaker_notes),
                onTap: () async => await Constants.URL_FEEDBACK.lunaOpenGenericLink(),
            ),
            LSCardTile(
                title: LSTitle(text: 'GitHub'),
                subtitle: LSSubtitle(text: 'View the Source Code'),
                trailing: LSIconButton(icon: CustomIcons.github),
                onTap: () async => await Constants.URL_GITHUB.lunaOpenGenericLink(),
            ),
            LSCardTile(
                title: LSTitle(text: 'Reddit'),
                subtitle: LSSubtitle(text: 'Ask Questions & Get Support'),
                trailing: LSIconButton(icon: CustomIcons.reddit),
                onTap: () async => await Constants.URL_REDDIT.lunaOpenGenericLink(),
            ),
            if(Platform.isIOS) LSCardTile(
                title: LSTitle(text: 'TestFlight'),
                subtitle: LSSubtitle(text: 'Join the TestFlight Beta'),
                trailing: LSIconButton(icon: Icons.developer_board),
                onTap: () async => await Constants.URL_TESTFLIGHT.lunaOpenGenericLink()
            ),
            LSCardTile(
                title: LSTitle(text: 'Website'),
                subtitle: LSSubtitle(text: 'Visit ${Constants.APPLICATION_NAME}\'s Website'),
                trailing: LSIconButton(icon: CustomIcons.home),
                onTap: () async => await Constants.URL_WEBSITE.lunaOpenGenericLink(),
            ),
        ],
    );
}

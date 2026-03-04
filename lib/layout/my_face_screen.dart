import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_artist_face/flutter_artist_face.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';
import 'package:get/get.dart';

import '../activities/login/login_screen.dart';
import '../logged_in_user/profile_header.dart';
import '../menu_model/menu_model_data.dart';
import '../model/model.dart';
import '../shelves_basic/app_notification/app_notification_popup_card.dart';
import '../utils/asset_icons.dart';

final Color topMenuItemBtnColor = Colors.grey.shade300;

abstract class MyFaceScreen extends FaceScreen {
  const MyFaceScreen({super.key});

  // ***************************************************************************
  // **************   MENU DRAWER   **************
  // ***************************************************************************

  @override
  void onEndDrawerChanged(bool isOpened) {
    // IMPORTANT:
    FlutterArtist.storage.endDrawer.updateStatus(opened: isOpened);
  }

  @override
  Widget buildDrawerExpandedProfile(BuildContext context) {
    return const ProfileHeader();
  }

  @override
  Widget buildDrawerCollapsedProfile(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildDrawerExpandedLogo(BuildContext context) {
    return ListTile(
      dense: true,
      visualDensity: const VisualDensity(vertical: -3, horizontal: -3),
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Center(child: Image.asset('static-rs/flutter_artist.png')),
      ),
      title: const Text(
        "Flutter Artist Demo",
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
      subtitle: const Text(
        "Simplify Your Flutter Projects",
        style: TextStyle(color: Colors.white70, fontSize: 10),
      ),
    );
  }

  @override
  Widget buildDrawerCollapsedLogo(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: Center(child: Image.asset('static-rs/flutter_artist.png')),
    );
  }

  // ***************************************************************************
  // **************   TOP DRAWER   **************
  // ***************************************************************************

  String getTopMenuTitle();

  String getTopMenuSubtitle() {
    return "Simplify Your Flutter Projects";
  }

  @override
  List<Widget> buildTopMenuCenterRightMenuItems(BuildContext context) {
    ILoggedInUser? loggedInUser = FlutterArtist.loggedInUser;
    bool isSystemUser = loggedInUser?.isSystemUser ?? false;
    //
    return [
      NotificationButtonBuilder(
        build: (INotificationSummary? notificationSummary) {
          notificationSummary as AppNotificationSummaryData?;
          //
          return TopMenuItemButton(
            icon: Image.asset(
              AssetIcons.notification,
              scale: 3,
              color: topMenuItemBtnColor,
            ),
            notificationValue: notificationSummary?.unread ?? 0,
            onTap: () {
              _onTapShowNotifications(context);
            },
          );
        },
      ),
      if (isSystemUser)
        // Docs: [14857].
        DebugMenu.custom(
          menuItemIconSize: 18,
          menuItemIconColor: null,
          menuButtonBuilder: ({required LogSummary logSummary}) {
            return TopMenuItemButton(
              icon: Image.asset(
                AssetIcons.debug,
                scale: 3,
                color: topMenuItemBtnColor,
              ),
              notificationValue: logSummary.totalLogCount == 0
                  ? null
                  : logSummary.totalLogCount,
              notificationBgColor: logSummary.hasRecentLogEntries
                  ? Colors.red
                  : Colors.black87,
              onTap: () {},
            );
          },
        ),
    ];
  }

  @override
  Widget buildTopMenuProfile(BuildContext context) {
    return LoggedInUserBuilder(
      ownerClassInstance: this,
      description: null,
      build: (ILoggedInUser? loggedInUserData) {
        LoggedInUserData? data = loggedInUserData as LoggedInUserData?;
        AppUserData? appUser = data?.appUser;
        return CircleAvatar(
          radius: 20,
          backgroundImage: appUser?.imageUrl == null
              ? null
              : NetworkImage(appUser!.imageUrl!),
          child: InkWell(
            onTapDown: (TapDownDetails details) {
              // Getting the tap position
              final RelativeRect position = RelativeRect.fromLTRB(
                details.globalPosition.dx,
                details.globalPosition.dy + 22,
                details.globalPosition.dx,
                details.globalPosition.dy,
              );

              // Showing the menu
              showMenu(
                context: context,
                position: position,
                items: [
                  PopupMenuItem(
                    child: SizedBox(
                      width: 180,
                      child: ListTile(
                        leading: const Icon(Icons.language),
                        title: const Text("Vietnamese"),
                        trailing: Get.locale?.languageCode == 'vi'
                            ? const Icon(Icons.check, color: Colors.blue)
                            : null,
                        onTap: () {
                          _changeLocale(context, const Locale('vi', 'VN'));
                        },
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    child: SizedBox(
                      width: 180,
                      child: ListTile(
                        leading: const Icon(Icons.language),
                        title: const Text("English"),
                        trailing: Get.locale?.languageCode == 'en'
                            ? const Icon(Icons.check, color: Colors.blue)
                            : null,
                        onTap: () {
                          _changeLocale(context, const Locale('en', 'US'));
                        },
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      leading: const Icon(Icons.login),
                      title: const Text('Logout'),
                      onTap: _logout,
                    ),
                  ),
                ],
              );
            },
            child: Container(),
          ),
        );
      },
    );
  }

  void _changeLocale(BuildContext context, Locale locale) {
    FlutterArtist.localeManager.updateAndStoreLocale(locale: locale);
    // Get.updateLocale(locale);
    Navigator.pop(context);
  }

  @override
  Widget buildTopMenuShowHideDrawerButton(
    BuildContext context,
    MenuDrawerController menuDrawerController,
  ) {
    return TopMenuItemButton(
      icon: Image.asset(AssetIcons.menu, scale: 3, color: topMenuItemBtnColor),
      onTap: () {
        menuDrawerController.toggle();
        Scaffold.of(context).openDrawer();
      },
    );
  }

  @override
  Widget buildTopMenuTitle(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      minTileHeight: 0,
      dense: true,
      visualDensity: const VisualDensity(vertical: -3, horizontal: -3),
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        getTopMenuTitle(),
        style: const TextStyle(fontSize: 15, overflow: TextOverflow.ellipsis),
      ),
      subtitle: Text(
        getTopMenuSubtitle(),
        style: const TextStyle(
          fontSize: 10,
          color: Colors.grey,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  @override
  EdgeInsets? getTopMenuContentPadding() {
    return const EdgeInsets.symmetric(vertical: 5, horizontal: 10);
  }

  @override
  DrawerMenuItemModel? getConfigurationDrawerMenuItemModel() {
    return configurationDrawerMenuItemModel;
  }

  @override
  List<DrawerMenuGroupModel> getDrawerMenuGroupModels() {
    return drawerMenuGroupModels;
  }

  // ***************************************************************************
  // **************   OTHERS   *************************************************
  // ***************************************************************************

  void _onTapShowNotifications(BuildContext context) {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: {},
    );
    //
    showPopupCard(
      context: context,
      builder: (context) {
        return const AppNotificationPopupCard();
      },
      offset: const Offset(-10, 60),
      alignment: Alignment.topRight,
      useSafeArea: true,
      dimBackground: false,
    );
  }

  Future<void> _logout() async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: {},
    );
    await FlutterArtist.logout(
      offAllAndGotoRoute: () {
        Get.offAllNamed(LoginScreen.routeName);
      },
    );
  }
}

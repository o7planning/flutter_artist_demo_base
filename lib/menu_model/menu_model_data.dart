import 'package:flutter/material.dart';
import 'package:flutter_artist_face/flutter_artist_face.dart';

import '../dashboard/action_examples_screen.dart';
import '../dashboard/advanced_examples_screen.dart';
import '../dashboard/basic_examples_screen.dart.dart';
import '../dashboard/bonus_examples_screen.dart';
import '../dashboard/event_examples_screen.dart';
import '../dashboard/filter_examples_screen.dart';
import '../dashboard/form_examples_screen.dart';
import '../dashboard/pagination_examples_screen.dart';
import '../dashboard/sorting_examples_screen.dart';
import '../dashboard/state_examples_screen.dart';
import '../shelves_basic/configuration/configuration_screen.dart';

List<DrawerMenuGroupModel> drawerMenuGroupModels = [
  DrawerMenuGroupModel(
    title: "Examples",
    subtitle: "FlutterArtist examples",
    menus: [
      DrawerMenuItemModel(
        code: BasicExamplesScreen.routeName,
        iconData: Icons.home,
        menuTitle: 'Basic',
        route: BasicExamplesScreen.routeName,
        markAsSelectedForRoutes: [],
        notifyValue: null,
      ),
      DrawerMenuItemModel(
        code: FilterExamplesScreen.routeName,
        iconData: Icons.filter_alt_rounded,
        menuTitle: 'Filter',
        route: FilterExamplesScreen.routeName,
        markAsSelectedForRoutes: [],
        notifyValue: null,
      ),
      DrawerMenuItemModel(
        code: FormExamplesScreen.routeName,
        // ballot_outlined
        iconData: Icons.featured_play_list_outlined,
        menuTitle: 'Form',
        route: FormExamplesScreen.routeName,
        markAsSelectedForRoutes: [],
        notifyValue: null,
      ),
      DrawerMenuItemModel(
        code: PaginationExamplesScreen.routeName,
        iconData: Icons.padding,
        menuTitle: 'Pagination',
        route: PaginationExamplesScreen.routeName,
        markAsSelectedForRoutes: [],
        notifyValue: null,
      ),
      DrawerMenuItemModel(
        code: ActionExamplesScreen.routeName,
        iconData: Icons.gavel,
        menuTitle: 'Action',
        route: ActionExamplesScreen.routeName,
        markAsSelectedForRoutes: [],
        notifyValue: null,
      ),
      DrawerMenuItemModel(
        code: EventExamplesScreen.routeName,
        iconData: Icons.event,
        menuTitle: 'Event',
        route: EventExamplesScreen.routeName,
        markAsSelectedForRoutes: [],
        notifyValue: null,
      ),
      DrawerMenuItemModel(
        code: SortingExamplesScreen.routeName,
        iconData: Icons.sort,
        menuTitle: 'Sort',
        route: SortingExamplesScreen.routeName,
        markAsSelectedForRoutes: [],
        notifyValue: null,
      ),
      DrawerMenuItemModel(
        code: StateExamplesScreen.routeName,
        iconData: Icons.satellite_outlined,
        menuTitle: 'State',
        route: StateExamplesScreen.routeName,
        markAsSelectedForRoutes: [],
        notifyValue: null,
      ),
      // Scalar, Activity.
      DrawerMenuItemModel(
        code: AdvancedExamplesScreen.routeName,
        iconData: Icons.label_important_outline,
        menuTitle: 'Advanced',
        route: AdvancedExamplesScreen.routeName,
        markAsSelectedForRoutes: [],
        notifyValue: null,
      ),
    ],
  ),
  DrawerMenuGroupModel(
    title: "Features",
    subtitle: "Features description",
    menus: [
      DrawerMenuItemModel(
        code: BonusExamplesScreen.routeName,
        iconData: Icons.masks,
        menuTitle: 'Bonus',
        route: BonusExamplesScreen.routeName,
        markAsSelectedForRoutes: [],
        notifyValue: null,
      ),
    ],
  ),
];

final configurationDrawerMenuItemModel = DrawerMenuItemModel(
  code: ConfigurationScreen.routeName,
  iconData: Icons.settings,
  menuTitle: 'Configuration',
  route: ConfigurationScreen.routeName,
  markAsSelectedForRoutes: [],
  notifyValue: null,
);

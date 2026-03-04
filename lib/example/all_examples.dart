import '../shelves_basic/01a/currency01a_screen.dart';
import '../shelves_basic/01a/shelf/currency01a_shelf.dart';
import '../shelves_basic/02a/shelf/song02a_shelf.dart';
import '../shelves_basic/02a/song02a_screen.dart';
import '../shelves_basic/03a/employee03a_screen.dart';
import '../shelves_basic/03a/shelf/employee03a_shelf.dart';
import '../shelves_basic/08a/cat_product08a_screen.dart';
import '../shelves_basic/08a/shelf/cat_product08a_shelf.dart';
import '../shelves_basic/11a/shelf/supplier11a_shelf.dart';
import '../shelves_basic/11a/supplier11a_screen.dart';
import '../shelves_basic/12a/country12a_screen.dart';
import '../shelves_basic/12a/shelf/country12a_shelf.dart';
import '../shelves_basic/14a/shelf/teacher14a_shelf.dart';
import '../shelves_basic/14a/teacher14a_screen.dart';
import '../shelves_basic/15a/shelf/teacher15a_shelf.dart';
import '../shelves_basic/15a/teacher15a_screen.dart';
import '../shelves_basic/25a/shelf/system_log25a_shelf.dart';
import '../shelves_basic/25a/system_log25a_screen.dart';
import '../shelves_basic/26a/shelf/supplier26a_shelf.dart';
import '../shelves_basic/26a/supplier26a_screen.dart';
import '../shelves_basic/27a/shelf/supplier27a_shelf.dart';
import '../shelves_basic/27a/supplier27a_screen.dart';
import '../shelves_basic/33a/employee33a_screen.dart';
import '../shelves_basic/33a/shelf/employee33a_shelf.dart';
import '../shelves_basic/36a/employment_history36a_screen.dart';
import '../shelves_basic/36a/shelf/emp_employment_history36a_shelf.dart';
import '../shelves_basic/40a/employee40a_screen.dart';
import '../shelves_basic/40a/shelf/employee40a_shelf.dart';
import '../shelves_basic/42a/note42a_screen.dart';
import '../shelves_basic/42a/shelf/note42a_shelf.dart';
import '../shelves_basic/43a/customer43a_screen.dart';
import '../shelves_basic/43a/shelf/customer43a_shelf.dart';
import '../shelves_basic/48a/country48a_screen.dart';
import '../shelves_basic/48a/shelf/country48a_shelf.dart';
import '../shelves_basic/49a/currency49a_screen.dart';
import '../shelves_basic/49a/shelf/currency49a_shelf.dart';
import '../shelves_basic/59a/employee59a_screen.dart';
import '../shelves_basic/59a/shelf/employee59a_shelf.dart';
import '../shelves_basic/70a/shelf/system_report70a_shelf.dart';
import '../shelves_basic/70a/system_report70a_screen.dart';
import '../shelves_basic/71a/shelf/supplier71a_shelf.dart';
import '../shelves_basic/71a/supplier71a_screen.dart';
import '../shelves_basic/77a/product77a_screen.dart';
import '../shelves_basic/77a/shelf/product77a_shelf.dart';
import '../shelves_basic/96a/sales_order96a_screen.dart';
import '../shelves_basic/96a/shelf/sales_order96a_shelf.dart';
import 'widgets/example_model.dart';

final example_currency01a = Example(
  shelfObjectType: ShelfObjectType.block,
  shelfType: Currency01aShelf,
  routeName: Currency01aScreen.routeName,
  youtubeVideoCode: 'DobIdZiWk1U',
  shortDesc: 'Block',
  description: "Hello World example. Block, ItemsView, BlockSectionView.",
  documentId: 14687,
  documentReady: true,
);

final example_song02a = Example(
  shelfObjectType: ShelfObjectType.block,
  shelfType: Song02aShelf,
  routeName: Song02aScreen.routeName,
  shortDesc: "Block",
  description: "Using FilterModel, FilterCriteria",
  documentId: 14697,
  documentReady: true,
);

final example_catProduct08a = Example(
  shelfObjectType: ShelfObjectType.block,
  shelfType: CatProduct08aShelf,
  routeName: CatProduct08aScreen.routeName,
  shortDesc: "Block",
  description: "Category & Product - 2 Levels Master-Details",
  documentId: 14773,
  documentReady: true,
);

final example_employee03a = Example(
  shelfObjectType: ShelfObjectType.block,
  shelfType: Employee03aShelf,
  routeName: Employee03aScreen.routeName,
  shortDesc: "Block",
  description: "Advanced FilterModel, FilterCriteria and Advanced FilterPanel",
  documentId: 14699,
  documentReady: true,
);

final example_supplier11a = Example(
  shelfObjectType: ShelfObjectType.block,
  shelfType: Supplier11aShelf,
  routeName: Supplier11aScreen.routeName,
  shortDesc: "Block",
  description: "Using FormModel",
  documentId: 14707,
  documentReady: true,
);

final example_country12a = Example(
  shelfObjectType: ShelfObjectType.block,
  shelfType: Country12aShelf,
  routeName: Country12aScreen.routeName,
  shortDesc: "Block",
  description: "Sorting, SortModel, DropdownSortPanel",
  documentId: 14743,
);
final example_teacher14a = Example(
  shelfObjectType: ShelfObjectType.block,
  shelfType: Teacher14aShelf,
  routeName: Teacher14aScreen.routeName,
  shortDesc: "Block, Pagination",
  description: "BlockNumberPagination",
  documentId: 14725,
);

final example_teacher15a = Example(
  shelfObjectType: ShelfObjectType.block,
  shelfType: Teacher15aShelf,
  routeName: Teacher15aScreen.routeName,
  shortDesc: "Block, Pagination",
  description: "Custom Pagination",
  documentId: 14739,
);

final example_system_log25a = Example(
  shelfObjectType: ShelfObjectType.block,
  shelfType: SystemLog25aShelf,
  routeName: SystemLog25aScreen.routeName,
  shortDesc: "Block, QuickAction",
  description: "BlockQuickMultiItemCreationAction",
  documentId: 14729,
);

final example_supplier26a = Example(
  shelfObjectType: ShelfObjectType.block,
  shelfType: Supplier26aShelf,
  routeName: Supplier26aScreen.routeName,
  shortDesc: "Form, FormInput",
  description:
      "Patch the Form values programmatically.\n(FormModel.patchFormFields)",
  documentId: 14713,
  documentReady: true,
);

final example_supplier27a = Example(
  shelfObjectType: ShelfObjectType.block,
  shelfType: Supplier27aShelf,
  routeName: Supplier27aScreen.routeName,
  shortDesc: "Event",
  description: "Block-level Reaction to External Shelf Events.",
  documentId: 14769,
);

final example_employee33a = Example(
  shelfObjectType: ShelfObjectType.block,
  shelfType: Employee33aShelf,
  routeName: Employee33aScreen.routeName,
  shortDesc: "Block, FilterModel",
  description:
      "FilterPanel with Tree. Parent-child MultiOptCriterion (Same as Demo04a).",
  documentId: 14801, // Using document Demo04a.
);

final example_empEmploymentHistory36a = Example(
  shelfObjectType: ShelfObjectType.block,
  shelfType: EmpEmploymentHistory36aShelf,
  routeName: EmpEmploymentHistory36aScreen.routeName,
  shortDesc: "Block",
  description: "FormModel parent-child MultiOptFormProp.",
  documentId: 14805,
);

final example_employee40a = Example(
  shelfObjectType: ShelfObjectType.block,
  shelfType: Employee40aShelf,
  routeName: Employee40aScreen.routeName,
  shortDesc: "FilterModel, FilterInput",
  description: "Query with FilterInput. FilterPanel with MultiDropdown",
  documentId: 14705,
  free: true,
);

final example_note42a = Example(
  shelfObjectType: ShelfObjectType.block,
  shelfType: Note42aShelf,
  routeName: Note42aScreen.routeName,
  shortDesc: "Block, Action",
  description: "Using BlockQuickItemCreationAction, BlockQuickItemUpdateAction",
  documentId: 14717,
  documentReady: true,
);

final example_customer43a = Example(
  shelfObjectType: ShelfObjectType.block,
  shelfType: Customer43aShelf,
  routeName: Customer43aScreen.routeName,
  shortDesc: "Block, Action",
  description: "Using BlockQuickItemUpdateAction",
  documentId: 14715,
  documentReady: true,
);

final example_country48a = Example(
  shelfObjectType: ShelfObjectType.block,
  shelfType: Country48aShelf,
  routeName: Country48aScreen.routeName,
  youtubeVideoCode: null,
  shortDesc: 'Block',
  description: "ListView and Infinite Scroll Pagination.",
  documentId: 14737,
  documentReady: true,
  todo: false,
  todoDesc: null,
);

final example_currency49a = Example(
  shelfObjectType: ShelfObjectType.block,
  shelfType: Currency49aShelf,
  routeName: Currency49aScreen.routeName,
  shortDesc: 'BlockItemsView',
  description: "Using ReorderableListView as BlockItemsView",
  documentId: 14819,
);

final example_employee59a = Example(
  shelfObjectType: ShelfObjectType.block,
  shelfType: Employee59aShelf,
  routeName: Employee59aScreen.routeName,
  shortDesc: "Block",
  description: "Advanced FilterModel, Field-Based JSON.",
  documentId: 14871,
  documentReady: false,
);

final example_70a = Example(
  shelfObjectType: ShelfObjectType.scalar,
  shelfType: SystemReport70aShelf,
  routeName: SystemReport70aScreen.routeName,
  shortDesc: "Simple Scalar Example.",
  description: "Simple Scalar Example.",
  documentId: 14781,
  documentReady: true,
);

final example_supplier71a = Example(
  shelfObjectType: ShelfObjectType.block,
  shelfType: Supplier71aShelf,
  routeName: Supplier71aScreen.routeName,
  shortDesc: "Event",
  description: "Deferring External Shelf Events. (EndDrawer)",
  documentId: 14881, // [71a] & [71b]
);

final example_product77a = Example(
  shelfObjectType: ShelfObjectType.block,
  shelfType: Product77aShelf,
  routeName: Product77aScreen.routeName,
  shortDesc: "Block",
  description: "Advanced FilterModel, Field-Based JSON.",
  documentId: null,
  documentReady: false,
);

final example_salesOrder96a = Example(
  shelfObjectType: ShelfObjectType.block,
  shelfType: SalesOrder96aShelf,
  routeName: SalesOrder96aScreen.routeName,
  shortDesc: "Block",
  description: "Sales Order - 2 Levels Master-Details",
  documentId: 14879,
  todo: true,
  todoDesc: "Write Document",
);

// *****************************************************************************
// *****************************************************************************
// *****************************************************************************

var exampleList = [
  example_currency01a,
  example_song02a,
  example_employee03a,
  example_country12a,
  example_teacher14a,
  example_teacher15a,
  example_supplier11a,
  example_system_log25a,
  example_supplier26a,
  example_supplier27a,
  example_customer43a,
  example_note42a,
  example_country48a,
  example_currency49a,
  example_supplier71a,

  // ***************************************************************************
];

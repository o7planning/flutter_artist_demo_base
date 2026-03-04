import 'package:flutter_artist/flutter_artist.dart';

import '../../activities/login/activity/login_activity.dart';
import '../../model/model.dart';
import '../../shelves_basic/01a/shelf/currency01a_shelf.dart';
import '../../shelves_basic/02a/shelf/song02a_shelf.dart';
import '../../shelves_basic/03a/shelf/employee03a_shelf.dart';
import '../../shelves_basic/08a/shelf/cat_product08a_shelf.dart';
import '../../shelves_basic/11a/shelf/supplier11a_shelf.dart';
import '../../shelves_basic/12a/shelf/country12a_shelf.dart';
import '../../shelves_basic/14a/shelf/teacher14a_shelf.dart';
import '../../shelves_basic/15a/shelf/teacher15a_shelf.dart';
import '../../shelves_basic/25a/shelf/system_log25a_shelf.dart';
import '../../shelves_basic/26a/shelf/supplier26a_shelf.dart';
import '../../shelves_basic/27a/shelf/supplier27a_shelf.dart';
import '../../shelves_basic/33a/shelf/employee33a_shelf.dart';
import '../../shelves_basic/36a/shelf/emp_employment_history36a_shelf.dart';
import '../../shelves_basic/40a/shelf/employee40a_shelf.dart';
import '../../shelves_basic/42a/shelf/note42a_shelf.dart';
import '../../shelves_basic/43a/shelf/customer43a_shelf.dart';
import '../../shelves_basic/48a/shelf/country48a_shelf.dart';
import '../../shelves_basic/49a/shelf/currency49a_shelf.dart';
import '../../shelves_basic/59a/shelf/employee59a_shelf.dart';
import '../../shelves_basic/70a/shelf/system_report70a_shelf.dart';
import '../../shelves_basic/71a/shelf/supplier71a_shelf.dart';
import '../../shelves_basic/77a/shelf/product77a_shelf.dart';
import '../../shelves_basic/96a/shelf/sales_order96a_shelf.dart';
import '../../shelves_basic/single_department/shelf/single_department_shelf.dart';
import '../../shelves_basic/single_supplier/shelf/single_supplier_shelf.dart';

class MyDemoStorageStructure extends StorageStructure {
  @override
  List<ProjectionFamily> defineProjectionFamilies() {
    return [
      ProjectionFamily<int>(
        familyName: 'supplier-projections',
        members: {SupplierInfo, SupplierData},
      ),
      ProjectionFamily<int>(
        familyName: 'album-projections',
        members: {AlbumInfo, AlbumData},
      ),
      ProjectionFamily<int>(
        familyName: 'app-user-projections',
        members: {AppUserInfo, AppUserData},
      ),
      ProjectionFamily<int>(
        familyName: 'book-projections',
        members: {BookInfo, BookData},
      ),
      ProjectionFamily<int>(
        familyName: 'category-projections',
        members: {CategoryInfo, CategoryData},
      ),
      ProjectionFamily<int>(
        familyName: 'company-projections',
        members: {CompanyInfo, CompanyData, CompanyTreeItem, CompanyTree},
      ),
      ProjectionFamily<String>(
        familyName: 'country-projections',
        members: {CountryInfo, CountryData},
      ),
      ProjectionFamily<int>(
        familyName: 'department-projections',
        members: {DepartmentInfo, DepartmentData},
      ),
      ProjectionFamily<int>(
        familyName: 'employee-projections',
        members: {EmployeeInfo, EmployeeData},
      ),
      ProjectionFamily<int>(
        familyName: 'employment-history-projections',
        members: {EmploymentHistoryInfo, EmploymentHistoryData},
      ),
      ProjectionFamily<int>(
        familyName: 'lesson-projections',
        members: {LessonInfo, LessonData},
      ),
      ProjectionFamily<int>(
        familyName: 'note-projections',
        members: {NoteInfo, NoteData},
      ),
    ];
  }

  @override
  void registerActivities() {
    FlutterArtist.storage.registerActivity(() => AppLoginActivity());
  }

  @override
  void registerShelves() {
    FlutterArtist.storage.registerShelf(() => Currency01aShelf());
    FlutterArtist.storage.registerShelf(() => Song02aShelf());

    FlutterArtist.storage.registerShelf(() => CatProduct08aShelf());

    FlutterArtist.storage.registerShelf(() => Employee03aShelf());

    FlutterArtist.storage.registerShelf(() => Supplier11aShelf());
    FlutterArtist.storage.registerShelf(() => Country12aShelf());

    FlutterArtist.storage.registerShelf(() => Teacher14aShelf());
    FlutterArtist.storage.registerShelf(() => Teacher15aShelf());

    FlutterArtist.storage.registerShelf(() => SystemLog25aShelf());
    FlutterArtist.storage.registerShelf(() => Supplier26aShelf());
    FlutterArtist.storage.registerShelf(() => Supplier27aShelf());

    FlutterArtist.storage.registerShelf(() => Employee33aShelf());
    FlutterArtist.storage.registerShelf(() => EmpEmploymentHistory36aShelf());
    FlutterArtist.storage.registerShelf(() => Employee40aShelf());
    FlutterArtist.storage.registerShelf(() => Note42aShelf());
    FlutterArtist.storage.registerShelf(() => Customer43aShelf());
    FlutterArtist.storage.registerShelf(() => Country48aShelf());
    FlutterArtist.storage.registerShelf(() => Currency49aShelf());
    FlutterArtist.storage.registerShelf(() => Employee59aShelf());
    FlutterArtist.storage.registerShelf(() => SystemReport70aShelf());
    FlutterArtist.storage.registerShelf(() => Supplier71aShelf());
    FlutterArtist.storage.registerShelf(() => Product77aShelf());
    FlutterArtist.storage.registerShelf(() => SalesOrder96aShelf());

    FlutterArtist.storage.registerShelf(() => SingleDepartmentShelf());
    FlutterArtist.storage.registerShelf(() => SingleSupplierShelf());


    // *************************************************************************
    // *************************************************************************
  }
}

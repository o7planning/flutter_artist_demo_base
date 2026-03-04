// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationInfoImpl _$PaginationInfoImplFromJson(Map<String, dynamic> json) =>
    PaginationInfoImpl(
      currentPage: (json['currentPage'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      totalItems: (json['totalItems'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationInfoImplToJson(PaginationInfoImpl instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'totalItems': instance.totalItems,
      'totalPages': instance.totalPages,
    };

AlbumData _$AlbumDataFromJson(Map<String, dynamic> json) =>
    AlbumData(
        (json['id'] as num).toInt(),
        json['code'] as String,
        json['name'] as String,
        (json['seqNum'] as num).toInt(),
        json['published'] as bool,
        json['locked'] as bool,
        (json['publishedSongCount'] as num).toInt(),
        (json['totalSongCount'] as num).toInt(),
        AlbumInfo.fromJson(json['album'] as Map<String, dynamic>),
      )
      ..imagePath = json['imagePath'] as String?
      ..nameInEnglish = json['nameInEnglish'] as String?
      ..description = json['description'] as String?
      ..note = json['note'] as String?;

Map<String, dynamic> _$AlbumDataToJson(AlbumData instance) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'name': instance.name,
  'seqNum': instance.seqNum,
  'album': instance.album,
  'published': instance.published,
  'locked': instance.locked,
  'imagePath': instance.imagePath,
  'nameInEnglish': instance.nameInEnglish,
  'publishedSongCount': instance.publishedSongCount,
  'totalSongCount': instance.totalSongCount,
  'description': instance.description,
  'note': instance.note,
};

AlbumInfo _$AlbumInfoFromJson(Map<String, dynamic> json) => AlbumInfo(
  (json['id'] as num).toInt(),
  json['code'] as String,
  json['name'] as String,
  (json['seqNum'] as num).toInt(),
  json['published'] as bool,
  json['locked'] as bool,
)..imagePath = json['imagePath'] as String?;

Map<String, dynamic> _$AlbumInfoToJson(AlbumInfo instance) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'name': instance.name,
  'seqNum': instance.seqNum,
  'published': instance.published,
  'locked': instance.locked,
  'imagePath': instance.imagePath,
};

AlbumInfoPage _$AlbumInfoPageFromJson(Map<String, dynamic> json) =>
    AlbumInfoPage(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => AlbumInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      paginationInfo: json['pagination'] == null
          ? null
          : PaginationInfoImpl.fromJson(
              json['pagination'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$AlbumInfoPageToJson(AlbumInfoPage instance) =>
    <String, dynamic>{
      'pagination': instance.paginationInfo,
      'items': instance.items,
    };

AppNotificationSummaryData _$AppNotificationSummaryDataFromJson(
  Map<String, dynamic> json,
) => AppNotificationSummaryData()..unread = (json['unread'] as num).toInt();

Map<String, dynamic> _$AppNotificationSummaryDataToJson(
  AppNotificationSummaryData instance,
) => <String, dynamic>{'unread': instance.unread};

AppUserData _$AppUserDataFromJson(Map<String, dynamic> json) => AppUserData(
  (json['id'] as num).toInt(),
  json['userName'] as String,
  json['fullName'] as String,
  json['enabled'] as bool,
  json['activated'] as bool,
  json['isSystemUser'] as bool,
  json['imagePath'] as String?,
  json['email'] as String,
  json['employee'] == null
      ? null
      : EmployeeData.fromJson(json['employee'] as Map<String, dynamic>),
)..lastActiveDatetime = json['lastActiveDatetime'] as String?;

Map<String, dynamic> _$AppUserDataToJson(AppUserData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'fullName': instance.fullName,
      'enabled': instance.enabled,
      'activated': instance.activated,
      'email': instance.email,
      'employee': instance.employee,
      'lastActiveDatetime': instance.lastActiveDatetime,
      'isSystemUser': instance.isSystemUser,
      'imagePath': instance.imagePath,
    };

AppUserInfo _$AppUserInfoFromJson(Map<String, dynamic> json) => AppUserInfo(
  (json['id'] as num).toInt(),
  json['userName'] as String,
  json['fullName'] as String,
  json['enabled'] as bool,
  json['activated'] as bool,
  json['isSystemUser'] as bool,
  json['imagePath'] as String?,
);

Map<String, dynamic> _$AppUserInfoToJson(AppUserInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'fullName': instance.fullName,
      'enabled': instance.enabled,
      'activated': instance.activated,
      'isSystemUser': instance.isSystemUser,
      'imagePath': instance.imagePath,
    };

AppUserInfoPage _$AppUserInfoPageFromJson(Map<String, dynamic> json) =>
    AppUserInfoPage(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => AppUserInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      paginationInfo: json['pagination'] == null
          ? null
          : PaginationInfoImpl.fromJson(
              json['pagination'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$AppUserInfoPageToJson(AppUserInfoPage instance) =>
    <String, dynamic>{
      'pagination': instance.paginationInfo,
      'items': instance.items,
    };

BestSellerData _$BestSellerDataFromJson(Map<String, dynamic> json) =>
    BestSellerData(
      (json['employeeId'] as num).toInt(),
      json['employeeNumber'] as String,
      json['employeeName'] as String,
      json['imagePath'] as String?,
      (json['salesOrderCount'] as num).toInt(),
      (json['amountTotal'] as num).toDouble(),
      (json['taxAmountTotal'] as num).toDouble(),
      (json['estimatedInputAmountTotal'] as num).toDouble(),
      (json['estimatedProfitTotal'] as num).toDouble(),
    );

Map<String, dynamic> _$BestSellerDataToJson(BestSellerData instance) =>
    <String, dynamic>{
      'employeeId': instance.employeeId,
      'employeeNumber': instance.employeeNumber,
      'employeeName': instance.employeeName,
      'imagePath': instance.imagePath,
      'salesOrderCount': instance.salesOrderCount,
      'amountTotal': instance.amountTotal,
      'taxAmountTotal': instance.taxAmountTotal,
      'estimatedInputAmountTotal': instance.estimatedInputAmountTotal,
      'estimatedProfitTotal': instance.estimatedProfitTotal,
    };

BestSellerDataPage _$BestSellerDataPageFromJson(Map<String, dynamic> json) =>
    BestSellerDataPage(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => BestSellerData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      paginationInfo: json['pagination'] == null
          ? null
          : PaginationInfoImpl.fromJson(
              json['pagination'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$BestSellerDataPageToJson(BestSellerDataPage instance) =>
    <String, dynamic>{
      'pagination': instance.paginationInfo,
      'items': instance.items,
    };

BestSellingData _$BestSellingDataFromJson(Map<String, dynamic> json) =>
    BestSellingData(
      (json['categoryId'] as num).toInt(),
      json['categoryName'] as String,
      (json['productId'] as num).toInt(),
      json['productName'] as String,
      json['productImageName'] as String?,
      (json['unitsTotal'] as num).toDouble(),
      (json['amountTotal'] as num).toDouble(),
      (json['taxAmountTotal'] as num).toDouble(),
    );

Map<String, dynamic> _$BestSellingDataToJson(BestSellingData instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'productId': instance.productId,
      'productName': instance.productName,
      'productImageName': instance.productImageName,
      'unitsTotal': instance.unitsTotal,
      'amountTotal': instance.amountTotal,
      'taxAmountTotal': instance.taxAmountTotal,
    };

BestSellingDataPage _$BestSellingDataPageFromJson(Map<String, dynamic> json) =>
    BestSellingDataPage(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => BestSellingData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      paginationInfo: json['pagination'] == null
          ? null
          : PaginationInfoImpl.fromJson(
              json['pagination'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$BestSellingDataPageToJson(
  BestSellingDataPage instance,
) => <String, dynamic>{
  'pagination': instance.paginationInfo,
  'items': instance.items,
};

BookData _$BookDataFromJson(Map<String, dynamic> json) =>
    BookData(
        (json['id'] as num).toInt(),
        json['code'] as String,
        json['title'] as String,
        (json['seqNum'] as num).toInt(),
        json['published'] as bool,
        json['locked'] as bool,
      )
      ..imagePath = json['imagePath'] as String?
      ..description = json['description'] as String?
      ..note = json['note'] as String?;

Map<String, dynamic> _$BookDataToJson(BookData instance) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'title': instance.title,
  'seqNum': instance.seqNum,
  'published': instance.published,
  'locked': instance.locked,
  'imagePath': instance.imagePath,
  'description': instance.description,
  'note': instance.note,
};

BookDetailData _$BookDetailDataFromJson(Map<String, dynamic> json) =>
    BookDetailData(
        (json['id'] as num).toInt(),
        json['code'] as String,
        json['title'] as String,
        (json['seqNum'] as num).toInt(),
        json['published'] as bool,
        json['locked'] as bool,
      )
      ..imagePath = json['imagePath'] as String?
      ..description = json['description'] as String?
      ..note = json['note'] as String?
      ..lessons =
          (json['lessons'] as List<dynamic>?)
              ?.map((e) => LessonData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];

Map<String, dynamic> _$BookDetailDataToJson(BookDetailData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'title': instance.title,
      'seqNum': instance.seqNum,
      'published': instance.published,
      'locked': instance.locked,
      'imagePath': instance.imagePath,
      'description': instance.description,
      'note': instance.note,
      'lessons': instance.lessons,
    };

BookInfo _$BookInfoFromJson(Map<String, dynamic> json) => BookInfo(
  (json['id'] as num).toInt(),
  json['code'] as String,
  json['title'] as String,
  (json['seqNum'] as num).toInt(),
  json['published'] as bool,
  json['locked'] as bool,
)..imagePath = json['imagePath'] as String?;

Map<String, dynamic> _$BookInfoToJson(BookInfo instance) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'title': instance.title,
  'seqNum': instance.seqNum,
  'published': instance.published,
  'locked': instance.locked,
  'imagePath': instance.imagePath,
};

BookInfoPage _$BookInfoPageFromJson(Map<String, dynamic> json) => BookInfoPage(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => BookInfo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  paginationInfo: json['pagination'] == null
      ? null
      : PaginationInfoImpl.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BookInfoPageToJson(BookInfoPage instance) =>
    <String, dynamic>{
      'pagination': instance.paginationInfo,
      'items': instance.items,
    };

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) => CategoryData(
  (json['id'] as num).toInt(),
  json['name'] as String,
  json['imagePath'] as String?,
)..description = json['description'] as String?;

Map<String, dynamic> _$CategoryDataToJson(CategoryData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imagePath': instance.imagePath,
      'description': instance.description,
    };

CategoryInfo _$CategoryInfoFromJson(Map<String, dynamic> json) => CategoryInfo(
  (json['id'] as num).toInt(),
  json['name'] as String,
  json['imagePath'] as String?,
);

Map<String, dynamic> _$CategoryInfoToJson(CategoryInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imagePath': instance.imagePath,
    };

CategoryInfoPage _$CategoryInfoPageFromJson(Map<String, dynamic> json) =>
    CategoryInfoPage(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => CategoryInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      paginationInfo: json['pagination'] == null
          ? null
          : PaginationInfoImpl.fromJson(
              json['pagination'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$CategoryInfoPageToJson(CategoryInfoPage instance) =>
    <String, dynamic>{
      'pagination': instance.paginationInfo,
      'items': instance.items,
    };

CdeDiagram _$CdeDiagramFromJson(Map<String, dynamic> json) => CdeDiagram(
  (json['rootItems'] as List<dynamic>?)
          ?.map((e) => CdeDiagramItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$CdeDiagramToJson(CdeDiagram instance) =>
    <String, dynamic>{'rootItems': instance.cdeDiagramItems};

CdeDiagramItem _$CdeDiagramItemFromJson(Map<String, dynamic> json) =>
    CdeDiagramItem(json['itemId'] as String)
      ..company = json['company'] == null
          ? null
          : CompanyInfo.fromJson(json['company'] as Map<String, dynamic>)
      ..department = json['department'] == null
          ? null
          : DepartmentInfo.fromJson(json['department'] as Map<String, dynamic>)
      ..employee = json['employee'] == null
          ? null
          : EmployeeInfo.fromJson(json['employee'] as Map<String, dynamic>)
      ..children =
          (json['children'] as List<dynamic>?)
              ?.map((e) => CdeDiagramItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];

Map<String, dynamic> _$CdeDiagramItemToJson(CdeDiagramItem instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'company': instance.company,
      'department': instance.department,
      'employee': instance.employee,
      'children': instance.children,
    };

CommonSummaryData _$CommonSummaryDataFromJson(Map<String, dynamic> json) =>
    CommonSummaryData(
      (json['totalProduct'] as num).toInt(),
      (json['totalCustomer'] as num).toInt(),
    );

Map<String, dynamic> _$CommonSummaryDataToJson(CommonSummaryData instance) =>
    <String, dynamic>{
      'totalProduct': instance.totalProduct,
      'totalCustomer': instance.totalCustomer,
    };

CompanyData _$CompanyDataFromJson(Map<String, dynamic> json) =>
    CompanyData(
        (json['id'] as num).toInt(),
        json['code'] as String,
        json['name'] as String,
      )
      ..companyIdParent = (json['companyIdParent'] as num?)?.toInt()
      ..description = json['description'] as String?
      ..imagePath = json['imagePath'] as String?;

Map<String, dynamic> _$CompanyDataToJson(CompanyData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'companyIdParent': instance.companyIdParent,
      'description': instance.description,
      'imagePath': instance.imagePath,
    };

CompanyExtData _$CompanyExtDataFromJson(Map<String, dynamic> json) =>
    CompanyExtData(
        (json['id'] as num).toInt(),
        json['code'] as String,
        json['name'] as String,
      )
      ..companyIdParent = (json['companyIdParent'] as num?)?.toInt()
      ..description = json['description'] as String?
      ..imagePath = json['imagePath'] as String?
      ..departments =
          (json['departments'] as List<dynamic>?)
              ?.map((e) => DepartmentData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];

Map<String, dynamic> _$CompanyExtDataToJson(CompanyExtData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'companyIdParent': instance.companyIdParent,
      'description': instance.description,
      'imagePath': instance.imagePath,
      'departments': instance.departments,
    };

CompanyInfo _$CompanyInfoFromJson(Map<String, dynamic> json) =>
    CompanyInfo(
        (json['id'] as num).toInt(),
        json['code'] as String,
        json['name'] as String,
      )
      ..companyIdParent = (json['companyIdParent'] as num?)?.toInt()
      ..imagePath = json['imagePath'] as String?;

Map<String, dynamic> _$CompanyInfoToJson(CompanyInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'companyIdParent': instance.companyIdParent,
      'imagePath': instance.imagePath,
    };

CompanyInfoPage _$CompanyInfoPageFromJson(Map<String, dynamic> json) =>
    CompanyInfoPage(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => CompanyInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      paginationInfo: json['pagination'] == null
          ? null
          : PaginationInfoImpl.fromJson(
              json['pagination'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$CompanyInfoPageToJson(CompanyInfoPage instance) =>
    <String, dynamic>{
      'pagination': instance.paginationInfo,
      'items': instance.items,
    };

CompanyTree _$CompanyTreeFromJson(Map<String, dynamic> json) => CompanyTree()
  ..rootCompanyTreeItems =
      (json['rootCompanyTreeItems'] as List<dynamic>?)
          ?.map((e) => CompanyTreeItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [];

Map<String, dynamic> _$CompanyTreeToJson(CompanyTree instance) =>
    <String, dynamic>{'rootCompanyTreeItems': instance.rootCompanyTreeItems};

CompanyTreeItem _$CompanyTreeItemFromJson(Map<String, dynamic> json) =>
    CompanyTreeItem((json['id'] as num).toInt(), json['name'] as String)
      ..children =
          (json['children'] as List<dynamic>?)
              ?.map((e) => CompanyTreeItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..imagePath = json['imagePath'] as String?;

Map<String, dynamic> _$CompanyTreeItemToJson(CompanyTreeItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'children': instance.children,
      'imagePath': instance.imagePath,
    };

ContributorData _$ContributorDataFromJson(Map<String, dynamic> json) =>
    ContributorData(
      (json['id'] as num).toInt(),
      AppUserInfo.fromJson(json['appUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContributorDataToJson(ContributorData instance) =>
    <String, dynamic>{'id': instance.id, 'appUser': instance.appUser};

ContributorInfo _$ContributorInfoFromJson(Map<String, dynamic> json) =>
    ContributorInfo(
      (json['id'] as num).toInt(),
      AppUserInfo.fromJson(json['appUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContributorInfoToJson(ContributorInfo instance) =>
    <String, dynamic>{'id': instance.id, 'appUser': instance.appUser};

ContributorInfoPage _$ContributorInfoPageFromJson(Map<String, dynamic> json) =>
    ContributorInfoPage(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => ContributorInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      paginationInfo: json['pagination'] == null
          ? null
          : PaginationInfoImpl.fromJson(
              json['pagination'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ContributorInfoPageToJson(
  ContributorInfoPage instance,
) => <String, dynamic>{
  'pagination': instance.paginationInfo,
  'items': instance.items,
};

CountryData _$CountryDataFromJson(Map<String, dynamic> json) =>
    CountryData(
        json['id'] as String,
        json['name'] as String,
        json['nameInEnglish'] as String,
        json['countryCode'] as String,
        json['isoCode2'] as String,
        json['isoCode3'] as String,
        (json['population'] as num).toInt(),
        (json['area'] as num).toInt(),
      )
      ..gdp = (json['gdp'] as num?)?.toDouble()
      ..description = json['description'] as String?;

Map<String, dynamic> _$CountryDataToJson(CountryData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameInEnglish': instance.nameInEnglish,
      'countryCode': instance.countryCode,
      'isoCode2': instance.isoCode2,
      'isoCode3': instance.isoCode3,
      'population': instance.population,
      'area': instance.area,
      'gdp': instance.gdp,
      'description': instance.description,
    };

CountryInfo _$CountryInfoFromJson(Map<String, dynamic> json) => CountryInfo(
  json['id'] as String,
  json['name'] as String,
  json['nameInEnglish'] as String,
  json['countryCode'] as String,
  json['isoCode2'] as String,
  json['isoCode3'] as String,
  (json['population'] as num).toInt(),
  (json['area'] as num).toInt(),
  (json['gdp'] as num?)?.toDouble(),
);

Map<String, dynamic> _$CountryInfoToJson(CountryInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameInEnglish': instance.nameInEnglish,
      'countryCode': instance.countryCode,
      'isoCode2': instance.isoCode2,
      'isoCode3': instance.isoCode3,
      'population': instance.population,
      'area': instance.area,
      'gdp': instance.gdp,
    };

CountryInfoPage _$CountryInfoPageFromJson(Map<String, dynamic> json) =>
    CountryInfoPage(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => CountryInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      paginationInfo: json['pagination'] == null
          ? null
          : PaginationInfoImpl.fromJson(
              json['pagination'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$CountryInfoPageToJson(CountryInfoPage instance) =>
    <String, dynamic>{
      'pagination': instance.paginationInfo,
      'items': instance.items,
    };

CouponData _$CouponDataFromJson(Map<String, dynamic> json) => CouponData(
  (json['id'] as num).toInt(),
  json['code'] as String,
  json['name'] as String,
  json['active'] as bool,
  json['type'] as String,
  __stringToDateTime(json['expiryDate']),
  json['imagePath'] as String?,
)..description = json['description'] as String?;

Map<String, dynamic> _$CouponDataToJson(CouponData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'active': instance.active,
      'type': instance.type,
      'expiryDate': __dateTimeToString(instance.expiryDate),
      'imagePath': instance.imagePath,
      'description': instance.description,
    };

CouponInfo _$CouponInfoFromJson(Map<String, dynamic> json) => CouponInfo(
  (json['id'] as num).toInt(),
  json['code'] as String,
  json['name'] as String,
  json['active'] as bool,
  json['type'] as String,
  __stringToDateTime(json['expiryDate']),
  json['imagePath'] as String?,
);

Map<String, dynamic> _$CouponInfoToJson(CouponInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'active': instance.active,
      'type': instance.type,
      'expiryDate': __dateTimeToString(instance.expiryDate),
      'imagePath': instance.imagePath,
    };

CouponInfoPage _$CouponInfoPageFromJson(Map<String, dynamic> json) =>
    CouponInfoPage(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => CouponInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      paginationInfo: json['pagination'] == null
          ? null
          : PaginationInfoImpl.fromJson(
              json['pagination'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$CouponInfoPageToJson(CouponInfoPage instance) =>
    <String, dynamic>{
      'pagination': instance.paginationInfo,
      'items': instance.items,
    };

CurrencyData _$CurrencyDataFromJson(Map<String, dynamic> json) => CurrencyData(
  json['id'] as String,
  json['symbol'] as String,
  json['name'] as String,
)..description = json['description'] as String?;

Map<String, dynamic> _$CurrencyDataToJson(CurrencyData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'description': instance.description,
    };

CurrencyDataPage _$CurrencyDataPageFromJson(Map<String, dynamic> json) =>
    CurrencyDataPage(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => CurrencyData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      paginationInfo: json['pagination'] == null
          ? null
          : PaginationInfoImpl.fromJson(
              json['pagination'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$CurrencyDataPageToJson(CurrencyDataPage instance) =>
    <String, dynamic>{
      'pagination': instance.paginationInfo,
      'items': instance.items,
    };

CurrencyInfo _$CurrencyInfoFromJson(Map<String, dynamic> json) => CurrencyInfo(
  json['id'] as String,
  json['symbol'] as String,
  json['name'] as String,
);

Map<String, dynamic> _$CurrencyInfoToJson(CurrencyInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
    };

CurrencyInfoPage _$CurrencyInfoPageFromJson(Map<String, dynamic> json) =>
    CurrencyInfoPage(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => CurrencyInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      paginationInfo: json['pagination'] == null
          ? null
          : PaginationInfoImpl.fromJson(
              json['pagination'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$CurrencyInfoPageToJson(CurrencyInfoPage instance) =>
    <String, dynamic>{
      'pagination': instance.paginationInfo,
      'items': instance.items,
    };

CurrentPreviousValue _$CurrentPreviousValueFromJson(
  Map<String, dynamic> json,
) => CurrentPreviousValue(
  dataName: json['dataName'] as String,
  currentValue: (json['currentValue'] as num).toDouble(),
  previousValue: (json['previousValue'] as num).toDouble(),
  isMoney: json['isMoney'] as bool,
);

Map<String, dynamic> _$CurrentPreviousValueToJson(
  CurrentPreviousValue instance,
) => <String, dynamic>{
  'dataName': instance.dataName,
  'currentValue': instance.currentValue,
  'previousValue': instance.previousValue,
  'isMoney': instance.isMoney,
};

CustomerData _$CustomerDataFromJson(Map<String, dynamic> json) => CustomerData(
  (json['id'] as num).toInt(),
  json['code'] as String,
  json['name'] as String,
  json['vip'] as bool,
  json['imagePath'] as String?,
  json['address'] as String?,
  json['email'] as String?,
  json['phone'] as String?,
);

Map<String, dynamic> _$CustomerDataToJson(CustomerData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'vip': instance.vip,
      'imagePath': instance.imagePath,
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
    };

CustomerInfo _$CustomerInfoFromJson(Map<String, dynamic> json) => CustomerInfo(
  (json['id'] as num).toInt(),
  json['code'] as String,
  json['name'] as String,
  json['vip'] as bool,
  json['imagePath'] as String?,
);

Map<String, dynamic> _$CustomerInfoToJson(CustomerInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'vip': instance.vip,
      'imagePath': instance.imagePath,
    };

CustomerInfoPage _$CustomerInfoPageFromJson(Map<String, dynamic> json) =>
    CustomerInfoPage(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => CustomerInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      paginationInfo: json['pagination'] == null
          ? null
          : PaginationInfoImpl.fromJson(
              json['pagination'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$CustomerInfoPageToJson(CustomerInfoPage instance) =>
    <String, dynamic>{
      'pagination': instance.paginationInfo,
      'items': instance.items,
    };

DepartmentData _$DepartmentDataFromJson(Map<String, dynamic> json) =>
    DepartmentData(
        (json['id'] as num).toInt(),
        json['code'] as String,
        json['name'] as String,
        (json['companyId'] as num).toInt(),
      )
      ..description = json['description'] as String?
      ..imagePath = json['imagePath'] as String?
      ..manager = json['manager'] == null
          ? null
          : EmployeeInfo.fromJson(json['manager'] as Map<String, dynamic>);

Map<String, dynamic> _$DepartmentDataToJson(DepartmentData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'companyId': instance.companyId,
      'imagePath': instance.imagePath,
      'manager': instance.manager,
    };

DepartmentInfo _$DepartmentInfoFromJson(Map<String, dynamic> json) =>
    DepartmentInfo(
        (json['id'] as num).toInt(),
        json['code'] as String,
        json['name'] as String,
        (json['companyId'] as num).toInt(),
      )
      ..imagePath = json['imagePath'] as String?
      ..manager = json['manager'] == null
          ? null
          : EmployeeInfo.fromJson(json['manager'] as Map<String, dynamic>);

Map<String, dynamic> _$DepartmentInfoToJson(DepartmentInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'companyId': instance.companyId,
      'imagePath': instance.imagePath,
      'manager': instance.manager,
    };

DepartmentInfoPage _$DepartmentInfoPageFromJson(Map<String, dynamic> json) =>
    DepartmentInfoPage(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => DepartmentInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      paginationInfo: json['pagination'] == null
          ? null
          : PaginationInfoImpl.fromJson(
              json['pagination'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$DepartmentInfoPageToJson(DepartmentInfoPage instance) =>
    <String, dynamic>{
      'pagination': instance.paginationInfo,
      'items': instance.items,
    };

EmployeeData _$EmployeeDataFromJson(Map<String, dynamic> json) => EmployeeData(
  (json['id'] as num).toInt(),
  json['empNumber'] as String,
  json['name'] as String,
  EmployeePositionInfo.fromJson(
    json['employeePosition'] as Map<String, dynamic>,
  ),
  json['email'] as String,
  __stringToDateTime(json['birthday']),
  __stringToDateTime(json['hireDate']),
  json['address'] as String?,
)..imagePath = json['imagePath'] as String?;

Map<String, dynamic> _$EmployeeDataToJson(EmployeeData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'empNumber': instance.empNumber,
      'name': instance.name,
      'employeePosition': instance.employeePosition,
      'imagePath': instance.imagePath,
      'email': instance.email,
      'birthday': __dateTimeToString(instance.birthday),
      'hireDate': __dateTimeToString(instance.hireDate),
      'address': instance.address,
    };

EmployeeInfo _$EmployeeInfoFromJson(Map<String, dynamic> json) => EmployeeInfo(
  (json['id'] as num).toInt(),
  json['empNumber'] as String,
  json['name'] as String,
  EmployeePositionInfo.fromJson(
    json['employeePosition'] as Map<String, dynamic>,
  ),
)..imagePath = json['imagePath'] as String?;

Map<String, dynamic> _$EmployeeInfoToJson(EmployeeInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'empNumber': instance.empNumber,
      'name': instance.name,
      'employeePosition': instance.employeePosition,
      'imagePath': instance.imagePath,
    };

EmployeeInfoPage _$EmployeeInfoPageFromJson(Map<String, dynamic> json) =>
    EmployeeInfoPage(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => EmployeeInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      paginationInfo: json['pagination'] == null
          ? null
          : PaginationInfoImpl.fromJson(
              json['pagination'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$EmployeeInfoPageToJson(EmployeeInfoPage instance) =>
    <String, dynamic>{
      'pagination': instance.paginationInfo,
      'items': instance.items,
    };

EmployeePositionInfo _$EmployeePositionInfoFromJson(
  Map<String, dynamic> json,
) => EmployeePositionInfo(
  (json['id'] as num).toInt(),
  json['code'] as String,
  json['name'] as String,
);

Map<String, dynamic> _$EmployeePositionInfoToJson(
  EmployeePositionInfo instance,
) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'name': instance.name,
};

EmployeePositionInfoPage _$EmployeePositionInfoPageFromJson(
  Map<String, dynamic> json,
) => EmployeePositionInfoPage(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => EmployeePositionInfo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  paginationInfo: json['pagination'] == null
      ? null
      : PaginationInfoImpl.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$EmployeePositionInfoPageToJson(
  EmployeePositionInfoPage instance,
) => <String, dynamic>{
  'pagination': instance.paginationInfo,
  'items': instance.items,
};

EmploymentHistoryData _$EmploymentHistoryDataFromJson(
  Map<String, dynamic> json,
) => EmploymentHistoryData(
  (json['id'] as num).toInt(),
  EmployeeInfo.fromJson(json['employee'] as Map<String, dynamic>),
  DepartmentInfo.fromJson(json['department'] as Map<String, dynamic>),
  CompanyInfo.fromJson(json['company'] as Map<String, dynamic>),
  EmployeePositionInfo.fromJson(
    json['employeePosition'] as Map<String, dynamic>,
  ),
  __stringToDateTime(json['fromDate']),
)..toDate = __stringToNullableDateTime(json['toDate']);

Map<String, dynamic> _$EmploymentHistoryDataToJson(
  EmploymentHistoryData instance,
) => <String, dynamic>{
  'id': instance.id,
  'employee': instance.employee,
  'department': instance.department,
  'company': instance.company,
  'employeePosition': instance.employeePosition,
  'fromDate': __dateTimeToString(instance.fromDate),
  'toDate': __dateTimeToNullableString(instance.toDate),
};

EmploymentHistoryInfo _$EmploymentHistoryInfoFromJson(
  Map<String, dynamic> json,
) => EmploymentHistoryInfo(
  (json['id'] as num).toInt(),
  EmployeeInfo.fromJson(json['employee'] as Map<String, dynamic>),
  __stringToDateTime(json['fromDate']),
  EmployeePositionInfo.fromJson(
    json['employeePosition'] as Map<String, dynamic>,
  ),
)..toDate = __stringToNullableDateTime(json['toDate']);

Map<String, dynamic> _$EmploymentHistoryInfoToJson(
  EmploymentHistoryInfo instance,
) => <String, dynamic>{
  'id': instance.id,
  'employee': instance.employee,
  'fromDate': __dateTimeToString(instance.fromDate),
  'toDate': __dateTimeToNullableString(instance.toDate),
  'employeePosition': instance.employeePosition,
};

EmploymentHistoryInfoPage _$EmploymentHistoryInfoPageFromJson(
  Map<String, dynamic> json,
) => EmploymentHistoryInfoPage(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => EmploymentHistoryInfo.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  paginationInfo: json['pagination'] == null
      ? null
      : PaginationInfoImpl.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$EmploymentHistoryInfoPageToJson(
  EmploymentHistoryInfoPage instance,
) => <String, dynamic>{
  'pagination': instance.paginationInfo,
  'items': instance.items,
};

FootballPlayerData _$FootballPlayerDataFromJson(Map<String, dynamic> json) =>
    FootballPlayerData(
      (json['id'] as num).toInt(),
      json['fullName'] as String,
      DateTime.parse(json['birthday'] as String),
      CountryInfo.fromJson(json['country'] as Map<String, dynamic>),
      json['imagePath'] as String?,
    )..description = json['description'] as String?;

Map<String, dynamic> _$FootballPlayerDataToJson(FootballPlayerData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'birthday': instance.birthday.toIso8601String(),
      'country': instance.country,
      'imagePath': instance.imagePath,
      'description': instance.description,
    };

FootballPlayerInfo _$FootballPlayerInfoFromJson(Map<String, dynamic> json) =>
    FootballPlayerInfo(
      (json['id'] as num).toInt(),
      json['fullName'] as String,
      DateTime.parse(json['birthday'] as String),
      CountryInfo.fromJson(json['country'] as Map<String, dynamic>),
      json['imagePath'] as String?,
    );

Map<String, dynamic> _$FootballPlayerInfoToJson(FootballPlayerInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'birthday': instance.birthday.toIso8601String(),
      'country': instance.country,
      'imagePath': instance.imagePath,
    };

FootballPlayerInfoPage _$FootballPlayerInfoPageFromJson(
  Map<String, dynamic> json,
) => FootballPlayerInfoPage(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => FootballPlayerInfo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  paginationInfo: json['pagination'] == null
      ? null
      : PaginationInfoImpl.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FootballPlayerInfoPageToJson(
  FootballPlayerInfoPage instance,
) => <String, dynamic>{
  'pagination': instance.paginationInfo,
  'items': instance.items,
};

GenderInfo _$GenderInfoFromJson(Map<String, dynamic> json) =>
    GenderInfo(json['id'] as String, json['name'] as String);

Map<String, dynamic> _$GenderInfoToJson(GenderInfo instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

LanguageData _$LanguageDataFromJson(Map<String, dynamic> json) => LanguageData(
  json['id'] as String,
  json['name'] as String,
  json['nameInEnglish'] as String,
  (json['seqNum'] as num).toInt(),
);

Map<String, dynamic> _$LanguageDataToJson(LanguageData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameInEnglish': instance.nameInEnglish,
      'seqNum': instance.seqNum,
    };

LanguageInfo _$LanguageInfoFromJson(Map<String, dynamic> json) => LanguageInfo(
  json['id'] as String,
  json['name'] as String,
  json['nameInEnglish'] as String,
  (json['seqNum'] as num).toInt(),
);

Map<String, dynamic> _$LanguageInfoToJson(LanguageInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameInEnglish': instance.nameInEnglish,
      'seqNum': instance.seqNum,
    };

LessonData _$LessonDataFromJson(Map<String, dynamic> json) =>
    LessonData(
        (json['id'] as num).toInt(),
        json['title'] as String,
        json['titleInEnglish'] as String?,
        (json['seqNum'] as num).toInt(),
        json['locked'] as bool,
        json['published'] as bool,
        (json['bookId'] as num).toInt(),
      )
      ..publishDate = __stringToNullableDateTime(json['publishDate'])
      ..imagePath = json['imagePath'] as String?
      ..description = json['description'] as String?
      ..note = json['note'] as String?;

Map<String, dynamic> _$LessonDataToJson(LessonData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'titleInEnglish': instance.titleInEnglish,
      'seqNum': instance.seqNum,
      'locked': instance.locked,
      'published': instance.published,
      'publishDate': __dateTimeToNullableString(instance.publishDate),
      'imagePath': instance.imagePath,
      'bookId': instance.bookId,
      'description': instance.description,
      'note': instance.note,
    };

LessonInfo _$LessonInfoFromJson(Map<String, dynamic> json) =>
    LessonInfo(
        (json['id'] as num).toInt(),
        json['title'] as String,
        json['titleInEnglish'] as String?,
        (json['seqNum'] as num).toInt(),
        json['locked'] as bool,
        json['published'] as bool,
        (json['bookId'] as num).toInt(),
      )
      ..publishDate = __stringToNullableDateTime(json['publishDate'])
      ..imagePath = json['imagePath'] as String?;

Map<String, dynamic> _$LessonInfoToJson(LessonInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'titleInEnglish': instance.titleInEnglish,
      'seqNum': instance.seqNum,
      'locked': instance.locked,
      'published': instance.published,
      'publishDate': __dateTimeToNullableString(instance.publishDate),
      'imagePath': instance.imagePath,
      'bookId': instance.bookId,
    };

LoggedInUserData _$LoggedInUserDataFromJson(Map<String, dynamic> json) =>
    LoggedInUserData(
      AppUserData.fromJson(json['appUser'] as Map<String, dynamic>),
      json['accessToken'] as String,
      (json['expiresIn'] as num?)?.toInt(),
      json['refreshToken'] as String?,
      json['scope'] as String?,
      json['tokenType'] as String?,
    );

Map<String, dynamic> _$LoggedInUserDataToJson(LoggedInUserData instance) =>
    <String, dynamic>{
      'appUser': instance.appUser,
      'accessToken': instance.accessToken,
      'expiresIn': instance.expiresIn,
      'refreshToken': instance.refreshToken,
      'scope': instance.scope,
      'tokenType': instance.tokenType,
    };

NoteData _$NoteDataFromJson(Map<String, dynamic> json) => NoteData(
  (json['id'] as num).toInt(),
  json['title'] as String,
  json['createDateTime'] as String,
  json['content'] as String,
  json['colorCode'] as String,
);

Map<String, dynamic> _$NoteDataToJson(NoteData instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'createDateTime': instance.createDateTime,
  'content': instance.content,
  'colorCode': instance.colorCode,
};

NoteInfoPage _$NoteInfoPageFromJson(Map<String, dynamic> json) => NoteInfoPage(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => NoteInfo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  paginationInfo: json['pagination'] == null
      ? null
      : PaginationInfoImpl.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$NoteInfoPageToJson(NoteInfoPage instance) =>
    <String, dynamic>{
      'pagination': instance.paginationInfo,
      'items': instance.items,
    };

NoteInfo _$NoteInfoFromJson(Map<String, dynamic> json) => NoteInfo(
  (json['id'] as num).toInt(),
  json['title'] as String,
  json['createDateTime'] as String,
  json['content'] as String,
  json['colorCode'] as String,
);

Map<String, dynamic> _$NoteInfoToJson(NoteInfo instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'createDateTime': instance.createDateTime,
  'content': instance.content,
  'colorCode': instance.colorCode,
};

NotificationMessageData _$NotificationMessageDataFromJson(
  Map<String, dynamic> json,
) => NotificationMessageData(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  createDateTime: json['createDateTime'] as String,
  read: json['read'] as bool,
  type: json['type'] as String,
  message: json['message'] as String,
);

Map<String, dynamic> _$NotificationMessageDataToJson(
  NotificationMessageData instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'createDateTime': instance.createDateTime,
  'read': instance.read,
  'type': instance.type,
  'message': instance.message,
};

NotificationMessageDataPage _$NotificationMessageDataPageFromJson(
  Map<String, dynamic> json,
) => NotificationMessageDataPage(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => NotificationMessageData.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  paginationInfo: json['pagination'] == null
      ? null
      : PaginationInfoImpl.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$NotificationMessageDataPageToJson(
  NotificationMessageDataPage instance,
) => <String, dynamic>{
  'pagination': instance.paginationInfo,
  'items': instance.items,
};

PaymentGatewayData _$PaymentGatewayDataFromJson(Map<String, dynamic> json) =>
    PaymentGatewayData(
      id: json['id'] as String,
      name: json['name'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$PaymentGatewayDataToJson(PaymentGatewayData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'active': instance.active,
    };

PaymentGatewayInfo _$PaymentGatewayInfoFromJson(Map<String, dynamic> json) =>
    PaymentGatewayInfo(
      id: json['id'] as String,
      name: json['name'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$PaymentGatewayInfoToJson(PaymentGatewayInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'active': instance.active,
    };

PaymentGatewayInfoPage _$PaymentGatewayInfoPageFromJson(
  Map<String, dynamic> json,
) => PaymentGatewayInfoPage(
  paginationInfo: json['pagination'] == null
      ? null
      : PaginationInfoImpl.fromJson(json['pagination'] as Map<String, dynamic>),
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => PaymentGatewayInfo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$PaymentGatewayInfoPageToJson(
  PaymentGatewayInfoPage instance,
) => <String, dynamic>{
  'pagination': instance.paginationInfo,
  'items': instance.items,
};

ProductData _$ProductDataFromJson(Map<String, dynamic> json) => ProductData(
  (json['id'] as num).toInt(),
  json['name'] as String,
  CategoryInfo.fromJson(json['category'] as Map<String, dynamic>),
  (json['price'] as num).toDouble(),
  json['active'] as bool,
  json['imagePath'] as String?,
  (json['estimatedInputPrice'] as num).toDouble(),
  (json['taxRate'] as num).toDouble(),
)..description = json['description'] as String?;

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'active': instance.active,
      'category': instance.category,
      'estimatedInputPrice': instance.estimatedInputPrice,
      'taxRate': instance.taxRate,
      'description': instance.description,
      'imagePath': instance.imagePath,
    };

ProductInfo _$ProductInfoFromJson(Map<String, dynamic> json) => ProductInfo(
  (json['id'] as num).toInt(),
  json['name'] as String,
  (json['price'] as num).toDouble(),
  json['active'] as bool,
  (json['categoryId'] as num).toInt(),
  json['imagePath'] as String?,
);

Map<String, dynamic> _$ProductInfoToJson(ProductInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'active': instance.active,
      'categoryId': instance.categoryId,
      'imagePath': instance.imagePath,
    };

ProductInfoPage _$ProductInfoPageFromJson(Map<String, dynamic> json) =>
    ProductInfoPage(
      paginationInfo: json['pagination'] == null
          ? null
          : PaginationInfoImpl.fromJson(
              json['pagination'] as Map<String, dynamic>,
            ),
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => ProductInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ProductInfoPageToJson(ProductInfoPage instance) =>
    <String, dynamic>{
      'pagination': instance.paginationInfo,
      'items': instance.items,
    };

ProjectData _$ProjectDataFromJson(Map<String, dynamic> json) => ProjectData(
  (json['id'] as num).toInt(),
  json['code'] as String,
  json['name'] as String,
  json['description'] as String?,
  json['note'] as String?,
);

Map<String, dynamic> _$ProjectDataToJson(ProjectData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'note': instance.note,
    };

ProjectInfo _$ProjectInfoFromJson(Map<String, dynamic> json) => ProjectInfo(
  (json['id'] as num).toInt(),
  json['code'] as String,
  json['name'] as String,
);

Map<String, dynamic> _$ProjectInfoToJson(ProjectInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };

ProjectInfoPage _$ProjectInfoPageFromJson(Map<String, dynamic> json) =>
    ProjectInfoPage(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => ProjectInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      paginationInfo: json['pagination'] == null
          ? null
          : PaginationInfoImpl.fromJson(
              json['pagination'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ProjectInfoPageToJson(ProjectInfoPage instance) =>
    <String, dynamic>{
      'pagination': instance.paginationInfo,
      'items': instance.items,
    };

SalesOrderData _$SalesOrderDataFromJson(Map<String, dynamic> json) =>
    SalesOrderData(
        (json['id'] as num).toInt(),
        __stringToDateTime(json['orderDateTime']),
        (json['amount'] as num).toDouble(),
        (json['taxAmount'] as num).toDouble(),
        json['status'] as String,
      )
      ..seller = json['seller'] == null
          ? null
          : EmployeeData.fromJson(json['seller'] as Map<String, dynamic>)
      ..customer = json['customer'] == null
          ? null
          : CustomerInfo.fromJson(json['customer'] as Map<String, dynamic>);

Map<String, dynamic> _$SalesOrderDataToJson(SalesOrderData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderDateTime': __dateTimeToString(instance.orderDateTime),
      'amount': instance.amount,
      'taxAmount': instance.taxAmount,
      'status': instance.status,
      'seller': instance.seller,
      'customer': instance.customer,
    };

SalesOrderInfo _$SalesOrderInfoFromJson(Map<String, dynamic> json) =>
    SalesOrderInfo(
      (json['id'] as num).toInt(),
      __stringToDateTime(json['orderDateTime']),
      (json['amount'] as num).toDouble(),
      (json['taxAmount'] as num).toDouble(),
      json['status'] as String,
    );

Map<String, dynamic> _$SalesOrderInfoToJson(SalesOrderInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderDateTime': __dateTimeToString(instance.orderDateTime),
      'amount': instance.amount,
      'taxAmount': instance.taxAmount,
      'status': instance.status,
    };

SalesOrderInfoPage _$SalesOrderInfoPageFromJson(Map<String, dynamic> json) =>
    SalesOrderInfoPage(
      paginationInfo: json['pagination'] == null
          ? null
          : PaginationInfoImpl.fromJson(
              json['pagination'] as Map<String, dynamic>,
            ),
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => SalesOrderInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$SalesOrderInfoPageToJson(SalesOrderInfoPage instance) =>
    <String, dynamic>{
      'pagination': instance.paginationInfo,
      'items': instance.items,
    };

SalesOrderLineData _$SalesOrderLineDataFromJson(Map<String, dynamic> json) =>
    SalesOrderLineData(
      (json['id'] as num).toInt(),
      (json['salesOrderId'] as num).toInt(),
      ProductInfo.fromJson(json['product'] as Map<String, dynamic>),
      (json['units'] as num).toDouble(),
      (json['price'] as num).toDouble(),
      (json['amount'] as num).toDouble(),
      (json['taxAmount'] as num).toDouble(),
    );

Map<String, dynamic> _$SalesOrderLineDataToJson(SalesOrderLineData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'salesOrderId': instance.salesOrderId,
      'product': instance.product,
      'units': instance.units,
      'price': instance.price,
      'amount': instance.amount,
      'taxAmount': instance.taxAmount,
    };

SalesOrderLineInfo _$SalesOrderLineInfoFromJson(Map<String, dynamic> json) =>
    SalesOrderLineInfo(
      (json['id'] as num).toInt(),
      (json['salesOrderId'] as num).toInt(),
      ProductInfo.fromJson(json['product'] as Map<String, dynamic>),
      (json['units'] as num).toDouble(),
      (json['price'] as num).toDouble(),
      (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$SalesOrderLineInfoToJson(SalesOrderLineInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'salesOrderId': instance.salesOrderId,
      'product': instance.product,
      'units': instance.units,
      'price': instance.price,
      'amount': instance.amount,
    };

SalesOrderLineInfoPage _$SalesOrderLineInfoPageFromJson(
  Map<String, dynamic> json,
) => SalesOrderLineInfoPage(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => SalesOrderLineInfo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  paginationInfo: json['pagination'] == null
      ? null
      : PaginationInfoImpl.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SalesOrderLineInfoPageToJson(
  SalesOrderLineInfoPage instance,
) => <String, dynamic>{
  'pagination': instance.paginationInfo,
  'items': instance.items,
};

SalesOrderStatusSummaryData _$SalesOrderStatusSummaryDataFromJson(
  Map<String, dynamic> json,
) => SalesOrderStatusSummaryData(
  salesOrderCount: (json['salesOrderCount'] as num).toInt(),
  pendingCount: (json['pendingCount'] as num).toInt(),
  processingCount: (json['processingCount'] as num).toInt(),
  deliveriedCount: (json['deliveriedCount'] as num).toInt(),
);

Map<String, dynamic> _$SalesOrderStatusSummaryDataToJson(
  SalesOrderStatusSummaryData instance,
) => <String, dynamic>{
  'salesOrderCount': instance.salesOrderCount,
  'pendingCount': instance.pendingCount,
  'processingCount': instance.processingCount,
  'deliveriedCount': instance.deliveriedCount,
};

SalesOrderSummaryData _$SalesOrderSummaryDataFromJson(
  Map<String, dynamic> json,
) => SalesOrderSummaryData(
  data: (json['data'] as List<dynamic>)
      .map((e) => CurrentPreviousValue.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SalesOrderSummaryDataToJson(
  SalesOrderSummaryData instance,
) => <String, dynamic>{'data': instance.data};

SongData _$SongDataFromJson(Map<String, dynamic> json) =>
    SongData(
        (json['id'] as num).toInt(),
        json['name'] as String,
        json['locked'] as bool,
        json['published'] as bool,
        AlbumInfo.fromJson(json['album'] as Map<String, dynamic>),
      )
      ..imagePath = json['imagePath'] as String?
      ..description = json['description'] as String?
      ..note = json['note'] as String?
      ..youtubeCode = json['youtubeCode'] as String?
      ..youtubeVideoInfo = json['youtubeVideoInfo'] as String?;

Map<String, dynamic> _$SongDataToJson(SongData instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'locked': instance.locked,
  'published': instance.published,
  'imagePath': instance.imagePath,
  'description': instance.description,
  'note': instance.note,
  'youtubeCode': instance.youtubeCode,
  'youtubeVideoInfo': instance.youtubeVideoInfo,
  'album': instance.album,
};

SongInfo _$SongInfoFromJson(Map<String, dynamic> json) => SongInfo(
  (json['id'] as num).toInt(),
  json['name'] as String,
  (json['albumId'] as num).toInt(),
  json['locked'] as bool,
  json['published'] as bool,
)..imagePath = json['imagePath'] as String?;

Map<String, dynamic> _$SongInfoToJson(SongInfo instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'albumId': instance.albumId,
  'locked': instance.locked,
  'published': instance.published,
  'imagePath': instance.imagePath,
};

SongInfoPage _$SongInfoPageFromJson(Map<String, dynamic> json) => SongInfoPage(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => SongInfo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  paginationInfo: json['pagination'] == null
      ? null
      : PaginationInfoImpl.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SongInfoPageToJson(SongInfoPage instance) =>
    <String, dynamic>{
      'pagination': instance.paginationInfo,
      'items': instance.items,
    };

SupplierData _$SupplierDataFromJson(Map<String, dynamic> json) =>
    SupplierData(
        (json['id'] as num).toInt(),
        json['name'] as String,
        json['active'] as bool,
        json['email'] as String,
        SupplierTypeInfo.fromJson(json['supplierType'] as Map<String, dynamic>),
      )
      ..address = json['address'] as String?
      ..phone = json['phone'] as String?
      ..description = json['description'] as String?
      ..imagePath = json['imagePath'] as String?;

Map<String, dynamic> _$SupplierDataToJson(SupplierData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'active': instance.active,
      'email': instance.email,
      'address': instance.address,
      'phone': instance.phone,
      'description': instance.description,
      'supplierType': instance.supplierType,
      'imagePath': instance.imagePath,
    };

SupplierInfo _$SupplierInfoFromJson(Map<String, dynamic> json) => SupplierInfo(
  (json['id'] as num).toInt(),
  json['name'] as String,
  json['active'] as bool,
  SupplierTypeInfo.fromJson(json['supplierType'] as Map<String, dynamic>),
)..imagePath = json['imagePath'] as String?;

Map<String, dynamic> _$SupplierInfoToJson(SupplierInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'active': instance.active,
      'supplierType': instance.supplierType,
      'imagePath': instance.imagePath,
    };

SupplierInfoPage _$SupplierInfoPageFromJson(Map<String, dynamic> json) =>
    SupplierInfoPage(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => SupplierInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      paginationInfo: json['pagination'] == null
          ? null
          : PaginationInfoImpl.fromJson(
              json['pagination'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$SupplierInfoPageToJson(SupplierInfoPage instance) =>
    <String, dynamic>{
      'pagination': instance.paginationInfo,
      'items': instance.items,
    };

SupplierTypeInfo _$SupplierTypeInfoFromJson(Map<String, dynamic> json) =>
    SupplierTypeInfo(
      (json['id'] as num).toInt(),
      json['code'] as String,
      json['name'] as String,
    );

Map<String, dynamic> _$SupplierTypeInfoToJson(SupplierTypeInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };

SupplierTypeInfoPage _$SupplierTypeInfoPageFromJson(
  Map<String, dynamic> json,
) => SupplierTypeInfoPage(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => SupplierTypeInfo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  paginationInfo: json['pagination'] == null
      ? null
      : PaginationInfoImpl.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SupplierTypeInfoPageToJson(
  SupplierTypeInfoPage instance,
) => <String, dynamic>{
  'pagination': instance.paginationInfo,
  'items': instance.items,
};

SystemLogData _$SystemLogDataFromJson(Map<String, dynamic> json) =>
    SystemLogData(
      (json['id'] as num).toInt(),
      json['createDateTime'] as String,
      json['severity'] as String,
      json['content'] as String,
    );

Map<String, dynamic> _$SystemLogDataToJson(SystemLogData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createDateTime': instance.createDateTime,
      'severity': instance.severity,
      'content': instance.content,
    };

SystemLogInfo _$SystemLogInfoFromJson(Map<String, dynamic> json) =>
    SystemLogInfo(
      (json['id'] as num).toInt(),
      json['createDateTime'] as String,
      json['severity'] as String,
      json['content'] as String,
    );

Map<String, dynamic> _$SystemLogInfoToJson(SystemLogInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createDateTime': instance.createDateTime,
      'severity': instance.severity,
      'content': instance.content,
    };

SystemLogInfoPage _$SystemLogInfoPageFromJson(Map<String, dynamic> json) =>
    SystemLogInfoPage(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => SystemLogInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      paginationInfo: json['pagination'] == null
          ? null
          : PaginationInfoImpl.fromJson(
              json['pagination'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$SystemLogInfoPageToJson(SystemLogInfoPage instance) =>
    <String, dynamic>{
      'pagination': instance.paginationInfo,
      'items': instance.items,
    };

SystemReportData _$SystemReportDataFromJson(Map<String, dynamic> json) =>
    SystemReportData(
      (json['employeeCount'] as num).toInt(),
      (json['supplierCount'] as num).toInt(),
      (json['categoryCount'] as num).toInt(),
      (json['productCount'] as num).toInt(),
      (json['saleOrderCount'] as num).toInt(),
      (json['noteCount'] as num).toInt(),
    );

Map<String, dynamic> _$SystemReportDataToJson(SystemReportData instance) =>
    <String, dynamic>{
      'employeeCount': instance.employeeCount,
      'supplierCount': instance.supplierCount,
      'categoryCount': instance.categoryCount,
      'productCount': instance.productCount,
      'saleOrderCount': instance.saleOrderCount,
      'noteCount': instance.noteCount,
    };

TeacherData _$TeacherDataFromJson(Map<String, dynamic> json) =>
    TeacherData(
        (json['id'] as num).toInt(),
        json['fullName'] as String,
        json['birthday'] as String,
        GenderInfo.fromJson(json['gender'] as Map<String, dynamic>),
        TeacherPositionInfo.fromJson(json['position'] as Map<String, dynamic>),
        json['email'] as String,
        json['locked'] as bool,
        json['active'] as bool,
        (json['universityId'] as num).toInt(),
      )
      ..country = json['country'] == null
          ? null
          : CountryInfo.fromJson(json['country'] as Map<String, dynamic>)
      ..youtubeVideoCode = json['youtubeVideoCode'] as String?
      ..skype = json['skype'] as String?
      ..facebook = json['facebook'] as String?
      ..phoneNumber = json['phoneNumber'] as String?
      ..description = json['description'] as String?
      ..note = json['note'] as String?
      ..imagePath = json['imagePath'] as String?;

Map<String, dynamic> _$TeacherDataToJson(TeacherData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'birthday': instance.birthday,
      'gender': instance.gender,
      'position': instance.position,
      'locked': instance.locked,
      'active': instance.active,
      'universityId': instance.universityId,
      'country': instance.country,
      'youtubeVideoCode': instance.youtubeVideoCode,
      'email': instance.email,
      'skype': instance.skype,
      'facebook': instance.facebook,
      'phoneNumber': instance.phoneNumber,
      'description': instance.description,
      'note': instance.note,
      'imagePath': instance.imagePath,
    };

TeacherInfo _$TeacherInfoFromJson(Map<String, dynamic> json) => TeacherInfo(
  (json['id'] as num).toInt(),
  json['fullName'] as String,
  json['birthday'] as String,
  json['locked'] as bool,
  json['active'] as bool,
  GenderInfo.fromJson(json['gender'] as Map<String, dynamic>),
  TeacherPositionInfo.fromJson(json['position'] as Map<String, dynamic>),
)..imagePath = json['imagePath'] as String?;

Map<String, dynamic> _$TeacherInfoToJson(TeacherInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'birthday': instance.birthday,
      'gender': instance.gender,
      'position': instance.position,
      'locked': instance.locked,
      'active': instance.active,
      'imagePath': instance.imagePath,
    };

TeacherInfoPage _$TeacherInfoPageFromJson(Map<String, dynamic> json) =>
    TeacherInfoPage(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => TeacherInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      paginationInfo: json['pagination'] == null
          ? null
          : PaginationInfoImpl.fromJson(
              json['pagination'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$TeacherInfoPageToJson(TeacherInfoPage instance) =>
    <String, dynamic>{
      'pagination': instance.paginationInfo,
      'items': instance.items,
    };

TeacherPositionInfo _$TeacherPositionInfoFromJson(Map<String, dynamic> json) =>
    TeacherPositionInfo(json['id'] as String, json['name'] as String);

Map<String, dynamic> _$TeacherPositionInfoToJson(
  TeacherPositionInfo instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};

UniversityData _$UniversityDataFromJson(Map<String, dynamic> json) =>
    UniversityData(
        (json['id'] as num).toInt(),
        json['code'] as String,
        json['name'] as String,
        json['active'] as bool,
        json['locked'] as bool,
        (json['activeSongCount'] as num).toInt(),
        (json['totalSongCount'] as num).toInt(),
      )
      ..imagePath = json['imagePath'] as String?
      ..nameInEnglish = json['nameInEnglish'] as String?
      ..description = json['description'] as String?
      ..note = json['note'] as String?;

Map<String, dynamic> _$UniversityDataToJson(UniversityData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'active': instance.active,
      'locked': instance.locked,
      'imagePath': instance.imagePath,
      'nameInEnglish': instance.nameInEnglish,
      'activeSongCount': instance.activeSongCount,
      'totalSongCount': instance.totalSongCount,
      'description': instance.description,
      'note': instance.note,
    };

UniversityInfo _$UniversityInfoFromJson(Map<String, dynamic> json) =>
    UniversityInfo(
      (json['id'] as num).toInt(),
      json['code'] as String,
      json['name'] as String,
      json['active'] as bool,
      json['locked'] as bool,
    )..imagePath = json['imagePath'] as String?;

Map<String, dynamic> _$UniversityInfoToJson(UniversityInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'active': instance.active,
      'locked': instance.locked,
      'imagePath': instance.imagePath,
    };

UniversityInfoPage _$UniversityInfoPageFromJson(Map<String, dynamic> json) =>
    UniversityInfoPage(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => UniversityInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      paginationInfo: json['pagination'] == null
          ? null
          : PaginationInfoImpl.fromJson(
              json['pagination'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$UniversityInfoPageToJson(UniversityInfoPage instance) =>
    <String, dynamic>{
      'pagination': instance.paginationInfo,
      'items': instance.items,
    };

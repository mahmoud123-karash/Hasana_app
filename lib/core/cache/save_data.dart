import 'package:quran_app/core/cache/shared_preference.dart';

void savePageNumber(pageNumber) => cache_helper.saveData(
      key: 'pagenumber',
      value: pageNumber,
    );

void saveMark(pageNumber) => cache_helper.saveData(
      key: 'saveMark',
      value: pageNumber,
    );

void saveSurahOrJuz(value) => cache_helper.saveData(
      key: 'sj',
      value: value,
    );

void saveAzkarIndex(value) => cache_helper.saveData(
      key: 'index',
      value: value,
    );

void saverandomA(randomA) => cache_helper.saveData(
      key: 'randomA',
      value: randomA,
    );
void saverandomS(randomS) => cache_helper.saveData(
      key: 'randomS',
      value: randomS,
    );

void saveReciterImage(image) => cache_helper.saveData(
      key: 'rImage',
      value: image,
    );

void saveReciterName(name) => cache_helper.saveData(
      key: 'rName',
      value: name,
    );

void saveSurahName(name) => cache_helper.saveData(
      key: 'sName',
      value: name,
    );

void isplay(ispaly) => cache_helper.saveData(
      key: 'ispaly',
      value: ispaly,
    );

void cachePosition(value) => cache_helper.saveData(
      key: 'position',
      value: value,
    );

void saveIsfirstOrNot(isFirst) => cache_helper.saveData(
      key: 'isfirst',
      value: isFirst,
    );

void saveIndex(index) => cache_helper.saveData(
      key: 'tasindex',
      value: index,
    );

void saveLatitude(value) => cache_helper.saveData(
      key: 'latitude',
      value: value,
    );

void saveLongitude(value) => cache_helper.saveData(
      key: 'longitude',
      value: value,
    );

void savePermissionNum(value) => cache_helper.saveData(
      key: 'num',
      value: value,
    );

void saveAddress(value) => cache_helper.saveData(
      key: 'address',
      value: value,
    );

void saveDirection(value) => cache_helper.saveData(
      key: 'direction',
      value: value,
    );

void saveQibla(value) => cache_helper.saveData(
      key: 'qiplah',
      value: value,
    );
void saveOffset(value) => cache_helper.saveData(
      key: 'offset',
      value: value,
    );

void saveApptheme(value) => cache_helper.saveData(
      key: 'isdark',
      value: value,
    );

void saveIsGranted(value) => cache_helper.saveData(
      key: 'granted',
      value: value,
    );

void saveA1(value) => cache_helper.saveData(
      key: 'a1',
      value: value,
    );

void saveA2(value) => cache_helper.saveData(
      key: 'a2',
      value: value,
    );

//s
void saveS1(value) => cache_helper.saveData(
      key: 's1',
      value: value,
    );

void saveS2(value) => cache_helper.saveData(
      key: 's2',
      value: value,
    );
void saveS3(value) => cache_helper.saveData(
      key: 's3',
      value: value,
    );

void saveS4(value) => cache_helper.saveData(
      key: 's4',
      value: value,
    );
void saveS5(value) => cache_helper.saveData(
      key: 's5',
      value: value,
    );

void saveAdhan(value) => cache_helper.saveData(
      key: 'adhan',
      value: value,
    );

void saveSub(value) => cache_helper.saveData(
      key: 'issub',
      value: value,
    );

void saveSIndex(index) => cache_helper.saveData(
      key: 'sindex',
      value: index,
    );

void saveRId(id) => cache_helper.saveData(
      key: 'rindex',
      value: id,
    );

void saveCount(count) => cache_helper.saveData(
      key: 'count',
      value: count,
    );

void saveDownload(value) => cache_helper.saveData(
      key: 'download',
      value: value,
    );

import 'package:quran/quran.dart';
import 'package:quran_app/core/quran_data/page_data.dart';
import 'package:quran_app/core/services/services.dart';
import 'package:quran_app/core/shared/lists.dart';

String getNameSurah(index) {
  List data = getPageData(index);
  if (data.length == 1) {
    return getSurahNameArabic(data[0]['surah']);
  } else if (data.length == 2) {
    return " ${getSurahNameArabic(data[0]['surah'])} و${getSurahNameArabic(data[1]['surah'])}";
  } else {
    return " ${getSurahNameArabic(data[0]['surah'])} و${getSurahNameArabic(data[1]['surah'])} و${getSurahNameArabic(data[2]['surah'])}";
  }
}

String getNumberJuz(index) {
  List data = getPageData(index);
  return convertToArabicNum(getJuzNumber(data[0]['surah'], data[0]['start']));
}

String getJuzName(int juzNumber) {
  if (juzNumber >= 1 && juzNumber <= 30) {
    return juzNames[juzNumber - 1];
  } else {
    return juzNames[29];
  }
}

String gethizbText(int page) {
  final currentPage = quranPages[page - 1];
  final hizb = currentPage.hizb;
  switch (currentPage.hizbQuarter % 4) {
    case 0:
      return '¾ الحزب ${convertToArabicNum(hizb)}';
    case 2:
      return '¼ الحزب ${convertToArabicNum(hizb)}';
    case 3:
      return '½ الحزب ${convertToArabicNum(hizb)}';
    default:
      return 'الحزب ${convertToArabicNum(hizb)}';
  }
}

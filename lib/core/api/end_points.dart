class EndPoints {
  EndPoints._();

  static String reciterEndPoint = 'resources/recitations?language=ar';

  static String audioEndPoint(reciterid) =>
      'chapter_recitations/$reciterid?language=ar';
}

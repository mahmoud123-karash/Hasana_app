abstract class HandlePermission {
  final String message;

  HandlePermission(this.message);
}

class Wanring extends HandlePermission {
  Wanring(String message) : super(message);
  factory Wanring.fromHandlePermission(int num) {
    if (num == 1) {
      return Wanring('لا يوجد اتصال');
    } else if (num == 2) {
      return Wanring('قم بتفعيل الموقع');
    } else {
      return Wanring('قم بالسماح للتطبيق للوصول للموقع');
    }
  }
}

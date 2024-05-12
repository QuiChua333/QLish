class Validate {
  static String? validateEmpty(String? value, [String? message]) {
    if (value==null || value.isEmpty) return message == null ? 'Trường này không được rỗng' : 'Vui lòng nhập ${message}';
    return null;
  }

  static String? validateEmail(String? value) {
    final validEmpty = validateEmpty(value);
    if (validEmpty != null) return 'Vui lòng nhập email';
    RegExp emailRegex =  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final isValidEmail = emailRegex.hasMatch(value ?? '');
    if (!isValidEmail) return 'Vui lòng nhập đúng định dạng email';
    return null;
  }

  static String? validatePassword(String? value) {
    final validEmpty = validateEmpty(value);
    if (validEmpty != null) return 'Vui lòng nhập mật khẩu';
    if (value!.length  < 6) return 'Mật khẩu phải từ 6 kí tự trở lên';
    return null;
  }
}
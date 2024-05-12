class SignUpEmailAndPasswordFailure {
  final String message;
  SignUpEmailAndPasswordFailure([this.message = 'An Unknown Error occured']);

  factory SignUpEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':  return  SignUpEmailAndPasswordFailure('Vui lòng nhập mật khẩu mạnh hơn.');
      case 'invalid-email':  return SignUpEmailAndPasswordFailure('Email không đúng hoặc sai định dạng.');
      case 'email-already-in-use':  return SignUpEmailAndPasswordFailure('Đã tồn tại tài khoản sử dụng email này.');
      case 'operation-not-allowed':  return SignUpEmailAndPasswordFailure('Hành động không được phép. Vui lòng liên hệ hỗ trợ.');
      case 'user-disabled':  return SignUpEmailAndPasswordFailure('Tài khoản đã bị khóa. Vui lòng liên hệ hỗ trợ');
      default: return SignUpEmailAndPasswordFailure();
    }
  }
}
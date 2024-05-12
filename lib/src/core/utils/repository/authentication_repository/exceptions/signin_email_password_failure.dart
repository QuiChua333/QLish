class SignInEmailAndPasswordFailure {
  final String message;
  SignInEmailAndPasswordFailure([this.message = 'An Unknown Error occured']);

  factory SignInEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'invalid-email':  return SignInEmailAndPasswordFailure('Email không đúng hoặc sai định dạng.');
      case 'invalid-credential':  return SignInEmailAndPasswordFailure('Sai email hoặc mật khẩu');
      default: return SignInEmailAndPasswordFailure();
    }
  }
}
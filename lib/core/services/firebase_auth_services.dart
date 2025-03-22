import 'package:firebase_auth/firebase_auth.dart';
import 'package:speedo_life/core/Errors/Exceptions.dart';

class FirebaseAuthServices {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      if (!_isValidEmail(email)) {
        throw CustomException(msg: 'يرجى إدخال بريد إلكتروني صالح');
      }

      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(
            msg: 'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(msg: 'البريد الإلكتروني مستخدم بالفعل');
      } else if (e.code == 'invalid-email') {
        throw CustomException(msg: 'يرجى إدخال بريد إلكتروني صالح');
      } else if (e.code == 'operation-not-allowed') {
        throw CustomException(
            msg: 'إنشاء الحساب معطل حاليًا، يرجى المحاولة لاحقًا');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            msg: 'فشل الاتصال بالإنترنت، يرجى التحقق من الشبكة');
      } else if (e.code == 'too-many-requests') {
        throw CustomException(
            msg: 'تم حظر محاولات تسجيل الحساب مؤقتًا، يرجى المحاولة لاحقًا');
      } else if (e.code == 'user-disabled') {
        throw CustomException(
            msg: 'تم تعطيل هذا الحساب، يرجى التواصل مع الدعم');
      } else {
        throw CustomException(msg: 'حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى');
      }
    } catch (e) {
      throw CustomException(msg: 'حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى');
    }
  }

  bool _isValidEmail(String email) {
    final emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return emailRegex.hasMatch(email);
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      if (!_isValidEmail(email)) {
        throw CustomException(msg: 'يرجى إدخال بريد إلكتروني صالح');
      }

      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(
            msg: 'لم يتم العثور على مستخدم بهذا البريد الإلكتروني');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            msg: 'كلمة المرور غير صحيحة، يرجى المحاولة مرة أخرى');
      } else if (e.code == 'invalid-email') {
        throw CustomException(msg: 'يرجى إدخال بريد إلكتروني صالح');
      } else if (e.code == 'user-disabled') {
        throw CustomException(
            msg: 'تم تعطيل هذا الحساب، يرجى التواصل مع الدعم');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            msg: 'فشل الاتصال بالإنترنت، يرجى التحقق من الشبكة');
      } else if (e.code == 'too-many-requests') {
        throw CustomException(
            msg: 'تم حظر محاولات تسجيل الدخول مؤقتًا، يرجى المحاولة لاحقًا');
      } else {
        throw CustomException(msg: 'حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى');
      }
    } catch (e) {
      throw CustomException(msg: 'حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى');
    }
  }
}

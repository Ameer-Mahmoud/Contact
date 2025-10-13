abstract class AppValidator {
  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return 'This field cannot be empty';
    }

    final RegExp regex = RegExp(
      r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
    );

    if (!regex.hasMatch(email)) {
      return 'Invalid Email Address';
    }

    return null;
  }

  static String? nameValidator(String? name) {
    if (name == null || name.isEmpty) {
      return 'This field cannot be empty';
    }

    return null;
  }

  static String? phoneValidator(String? phone) {
    if (phone == null || phone.isEmpty) {
      return 'This field cannot be empty';
    }
    if (phone.length < 11) {
      return 'Invalide phone number';
    }
    return null;
  }
}
//this is password regex  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')

final emailRegex = RegExp(r'^[a-zA-Z0-9+._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
final passwordRegex = RegExp(r'^.{8,}$');
final usernameRegex = RegExp(r'^.{1,}$');
final numberRegex = RegExp(r'^.{11,15}$');
//name validation
String? validateEmptyField(String? value) {
  if (value == null || value.isEmpty) {
    return 'Required field';
  }

  return null;
}

//name validation
String? validateProductName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Product Name is required';
  }
  if (!usernameRegex.hasMatch(value)) {
    return 'Min one characters limit is required';
  }

  return null;
}

String? validatePrice(String? value) {
  if (value == null || value.isEmpty) {
    return 'Price is required';
  }
  if (!usernameRegex.hasMatch(value)) {
    return 'Min one characters limit is required';
  }

  return null;
}

//email validation
String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }

  if (!emailRegex.hasMatch(value)) {
    // isEmailValid.value = false;
    return 'Invalid email format';
  }
  // isEmailValid.value = true;
  return null;
}

//number validation
String? validateNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Number is required';
  }

  if (!numberRegex.hasMatch(value)) {
    // isEmailValid.value = false;
    return 'Number must be 8-15 characters';
  }
  // isEmailValid.value = true;
  return null;
}

// password validation
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }

  if (!passwordRegex.hasMatch(value)) {
    return 'Password must be at least 8 characters long';
  }

  return null;
}

//editprofilepassword
// password validation
String? validateProfilePassword(String? value) {
  if (!passwordRegex.hasMatch(value!)) {
    return 'Password must be at least 8 characters long';
  }
  // ignore: unnecessary_null_comparison
  if (value == null || value.isEmpty) {
    return null;
  }

  return null;
}

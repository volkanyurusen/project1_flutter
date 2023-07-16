import 'package:my_project/constants/constants.dart';

mixin GeneralValidationMixin {
  bool isFieldEmpty(String fieldValue) => fieldValue.isEmpty;
}

mixin NameSurnameValidationMixin {
  bool isFieldEmpty(String fieldValue) => fieldValue == '';

  bool isFieldNull(String? fieldValue) => fieldValue == null;

  bool isExpCorrect(String? fieldValue) =>
      RegExp(r'^[a-zA-Z ]+$').hasMatch(fieldValue!);

  bool isFieldTooShort(String? fieldValue) => fieldValue!.length <= 3;

  bool isFieldTooLong(String? fieldValue) =>
      fieldValue!.length >= AppNumberConstants().kMainWordLenghtLimit;

  bool validateNameSurname(String? fieldValue) {
    if (fieldValue == null) {
      return false;
    }

    return RegExp(r'^[a-zA-Z ]+$').hasMatch(fieldValue);
  }
}

mixin UsernameValidationMixin {
  bool isFieldEmpty(String fieldValue) => fieldValue == '';

  bool isFieldNull(String? fieldValue) => fieldValue == null;

  bool isExpCorrect(String? fieldValue) =>
      RegExp(r'^[a-zA-Z0-9]+$').hasMatch(fieldValue!);

  bool isFieldTooShort(String? fieldValue) => fieldValue!.length <= 3;

  bool isFieldTooLong(String? fieldValue) =>
      fieldValue!.length >= AppNumberConstants().kUsernameLenghtLimit;

  bool validateUsername(String? fieldValue) {
    if (fieldValue == null) {
      return false;
    }

    return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(fieldValue);
  }
}

mixin TemplateNameValidationMixin {
  bool isFieldEmpty(String fieldValue) => fieldValue == '';

  bool isFieldNull(String? fieldValue) => fieldValue == null;

  bool isExpCorrect(String? fieldValue) =>
      RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(fieldValue!);

  bool isFieldTooShort(String? fieldValue) => fieldValue!.length <= 3;

  bool isFieldTooLong(String? fieldValue) =>
      fieldValue!.length >= AppNumberConstants().kTemplateNameLenghtLimit;

  bool validateTemplateName(String? fieldValue) {
    if (fieldValue == null) {
      return false;
    }

    return RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(fieldValue);
  }
}

mixin BirthyearValidationMixin {
  bool hasFieldFourDigit(String? fieldValue) =>
      fieldValue!.length != AppNumberConstants().kBirthyearDigitLimit;

  bool isExpCorrect(String? fieldValue) =>
      RegExp(r'^[0-9 ]+$').hasMatch(fieldValue!);

  bool isFieldTooEarly(String? fieldValue) => int.parse(fieldValue!) <= 1900;

  bool isFieldTooLate(String? fieldValue) => int.parse(fieldValue!) >= 2100;

  bool validateNumber(String? fieldValue) {
    if (fieldValue == null) {
      return false;
    }

    return RegExp(r'^[0-9 ]+$').hasMatch(fieldValue);
  }
}

mixin EmailValidationMixin {
  bool isFieldEmpty(String fieldValue) => fieldValue == '';

  bool isFieldNull(String? fieldValue) => fieldValue == null;

  bool isExpCorrect(String? fieldValue) =>
      RegExp(r'^\w+(\.-?\w+)*@\w+(\.-?\w+)*(\.\w{2,3})+$')
          .hasMatch(fieldValue!);

  bool isFieldTooLong(String? fieldValue) =>
      fieldValue!.length >= AppNumberConstants().kEmailLenghtLimit;

  bool validateEmail(String? fieldValue) {
    if (fieldValue == null) {
      return false;
    }

    return RegExp(r'^\w+(\.-?\w+)*@\w+(\.-?\w+)*(\.\w{2,3})+$')
        .hasMatch(fieldValue);
  }
}

mixin AddressValidationMixin {
  bool isFieldEmpty(String fieldValue) => fieldValue == '';

  bool isFieldNull(String? fieldValue) => fieldValue == null;

  bool isExpCorrect(String? fieldValue) =>
      RegExp(r"[A-Za-z0-9\.:\-\s\,\/]+$").hasMatch(fieldValue!);

  bool isFieldTooShort(String? fieldValue) => fieldValue!.length <= 5;

  bool isFieldTooLong(String? fieldValue) =>
      fieldValue!.length >= AppNumberConstants().kAddressLenghtLimit;

  bool validateUsername(String? fieldValue) {
    if (fieldValue == null) {
      return false;
    }

    return RegExp(r"[A-Za-z0-9\.:\-\s\,\/]+$").hasMatch(fieldValue);
  }
}

mixin AboutYourselfValidationMixin {
  // bool isFieldEmpty(String fieldValue) => fieldValue == '';

  // bool isFieldNull(String? fieldValue) => fieldValue == null;

  bool isExpCorrect(String? fieldValue) =>
      RegExp(r"[A-Za-z0-9\.:\-\s\,\/]+$").hasMatch(fieldValue!);

  // bool isFieldTooShort(String? fieldValue) => fieldValue!.length <= 5;

  bool isFieldTooLong(String? fieldValue) =>
      fieldValue!.length >= AppNumberConstants().kAboutYourselfLenghtLimit;

  bool validateUsername(String? fieldValue) {
    if (fieldValue == null) {
      return false;
    }

    return RegExp(r"[A-Za-z0-9\.:\-\s\,\/]+$").hasMatch(fieldValue);
  }
}

mixin MinLessonValidationMixin {
  bool hasFieldOnlyOneDigit(String? fieldValue) =>
      fieldValue!.length != AppNumberConstants().kMinLessonDigitLimit;

  bool isExpCorrect(String? fieldValue) =>
      RegExp(r'^[0-9]+$').hasMatch(fieldValue!);

  bool isFieldTooSmall(String? fieldValue) => int.parse(fieldValue!) <= 0;

  bool isFieldTooBig(String? fieldValue) => int.parse(fieldValue!) >= 10;

  bool validateNumber(String? fieldValue) {
    if (fieldValue == null) {
      return false;
    }

    return RegExp(r'^[0-9]+$').hasMatch(fieldValue);
  }
}

mixin PerLessonPriceValidationMixin {
  bool hasFieldMaxDigit(String? fieldValue) =>
      fieldValue!.length >= AppNumberConstants().kPerLessonPriceMaxDigitLimit;

  bool isExpCorrect(String? fieldValue) =>
      RegExp(r'^[0-9]+$').hasMatch(fieldValue!);

  bool isFieldTooSmall(String? fieldValue) => int.parse(fieldValue!) < 0;

  bool isFieldTooBig(String? fieldValue) => int.parse(fieldValue!) >= 10000;

  bool validateNumber(String? fieldValue) {
    if (fieldValue == null) {
      return false;
    }

    return RegExp(r'^[0-9]+$').hasMatch(fieldValue);
  }
}

mixin LatitudeLongitudeValidationMixin {
  bool isFieldEmpty(String fieldValue) => fieldValue == '';

  bool isFieldNull(String? fieldValue) => fieldValue == null;

  bool isExpCorrect(String? fieldValue) =>
      RegExp(r"[A-Za-z0-9\.:\-\s\,\/]+$").hasMatch(fieldValue!);

  bool isFieldTooShort(String? fieldValue) => fieldValue!.length <= 5;

  bool isFieldTooLong(String? fieldValue) =>
      fieldValue!.length >= AppNumberConstants().kAddressLenghtLimit;

  bool validateUsername(String? fieldValue) {
    if (fieldValue == null) {
      return false;
    }

    return RegExp(r"[A-Za-z0-9\.:\-\s\,\/]+$").hasMatch(fieldValue);
  }
}


// ^[0-9]+$

// OLD MIXIN
// mixin EmailValid@

// mixin NameValidationMixin {
//   bool isFieldEmpty(String fieldValue) => fieldValue.isEmpty;

//   bool validateEmailAddress(String? label) {
//     if (label == null) {
//       return false;
//     }

//     return RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(label);
//   }
// }
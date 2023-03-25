class Validators {
  static validate(String labelText, String? value) {
    String? result;
    switch (labelText) {
      case 'Tên đăng nhập':
        result = validateUsername(value);
        break;
      case 'Mật khẩu':
        result = validatePassword(value);
        break;
      case 'Nhập lại mật khẩu':
        result = validatePassword(value);
        break;
      case 'Họ tên':
        result = validateName(value);
        break;
      case 'Email':
        result = validateEmail(value);
        break;
      case 'Số điện thoại':
        result = validatePhone(value);
        break;
      default:
        break;
    }

    return result;
  }

  static String? validateUsername(String? value) {
    // Regrex pattern for string that only can start and end with character or digit
    RegExp startCharacter = RegExp(r'^[a-zA-Z0-9]');
    RegExp endCharacter = RegExp(r'[a-zA-Z0-9]$');

    // Regrex pattern for valid characters in username
    RegExp characterRegex = RegExp(r'^[a-zA-Z0-9_.]+$');

    // Regrex pattern for valid length of username
    RegExp lengthRegex = RegExp(r'^.{8,255}$');

    // Regrex pattern for string that do not contain multiple consecutive dots
    RegExp doubleDotRegrex = RegExp(r'^[^.]*\.?[^.]*$');

    // Regrex pattern for string that do not contain multiple consecutive dots
    RegExp doubleUnderscoreRegrex = RegExp(r'^[^_]*_?[^_]*$');

    // RegExp underscoreDotRegrex =
    //     RegExp(r'^[a-zA-Z0-9]+([_.](?![_.])|[a-zA-Z0-9])*$');
    RegExp underscoreDotRegrex =
        RegExp(r'^[a-zA-Z0-9]+(?:[_](?![._]))?[a-zA-Z0-9.]*[a-zA-Z0-9]$');

    if (value?.length == 0) {
      return "Vui lòng nhập tên đăng nhập";
    } else if (!startCharacter.hasMatch(value!)) {
      return "Tên đăng nhập chỉ có thể bắt đầu và kết thúc bằng chữ hoặc số";
    } else if (!endCharacter.hasMatch(value!)) {
      return "Tên đăng nhập chỉ có thể bắt đầu và kết thúc bằng chữ hoặc số";
    } else if (!characterRegex.hasMatch(value)) {
      return "Tên đăng nhập chỉ có thể chứa kí tự chữ, số, dấu gạch dưới và dấu chấm";
    } else if (!doubleDotRegrex.hasMatch(value)) {
      return "Tên đăng nhập không thể chứa nhiều dấu chấm liên tiếp";
    } else if (!doubleUnderscoreRegrex.hasMatch(value)) {
      return "Tên đăng nhập không thể chứa nhiều dấu gạch dưới liên tiếp";
    }

    // else if (!underscoreDotRegrex.hasMatch(value)) {
    //   return "Tên đăng nhập không thể chứa dấu gạch dưới và dấu chấm cạnh nhau";
    // }

    else if (!lengthRegex.hasMatch(value)) {
      return "Tên đăng nhập phải chứa ít nhất 8 kí tự";
    }

    return null;
  }

  static String? validatePassword(String? value) {
    RegExp lengthRegex = RegExp(r'^.{8,255}$');
    RegExp pwdRegex =
        RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$&*])(?=.*[0-9]).+$');

    if (value?.length == 0) {
      return "Vui lòng nhập mật khẩu";
    } else if (!pwdRegex.hasMatch(value!)) {
      return "Mật khẩu phải chứa ít nhất 1 ký tự in hoa, 1 ký tự thường, 1 ký tự đặc biệt và 1 số";
    } else if (!lengthRegex.hasMatch(value)) {
      return "Mật khẩu phải có ít nhất 8 kí tự";
    }
    return null;
  }

  static String? validateName(String? value) {
    RegExp characterRegex = RegExp(r'^[a-zA-Z0-9]+$');
    if (value?.length == 0) {
      return "Vui lòng nhập họ tên";
    } else if (!characterRegex.hasMatch(value!)) {
      return "Họ tên không hợp lệ";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (value?.length == 0) {
      return "Vui lòng nhập email";
    } else if (!emailRegex.hasMatch(value!)) {
      return "Email không hợp lệ";
    }
    return null;
  }

  static String? validatePhone(String? value) {
    RegExp phoneRegex = RegExp(r'^0([3|5|7|8|9])(\d{8})$');

    if (value?.length == 0) {
      return "Vui lòng nhập số điện thoại";
    } else if (!phoneRegex.hasMatch(value!)) {
      return "Số điện thoại không hợp lệ tại Việt Nam";
    }
    return null;
  }
}
//login: username, pwd
//register: username, pwd, name, dob, phone, email
// username: ^(?=.{8,255}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$
// password: ^(?=[.\S]*[A-Z][.\S]*)(?=[.\S]*[0-9][.\S]*)(?=[.\S]*[a-z][.\S]*)[.\S]{8,255}$
// {
//   "username": "username_example",
//   "password": "P@s5__.word",
//   "name": "night owl",
//   "dob": "2023-03-22T14:53:27.103Z",
//   "phone": "0987654321",
//   "email": "example@ex.com"
// }

//Username
// - Only contains alphanumeric characters, underscore and dot.

// - Underscore and dot can't be at the end or start of a username (e.g _username / username_ / .username / username.).

// - Underscore and dot can't be next to each other (e.g user_.name).

// - Underscore or dot can't be used multiple times in a row (e.g user__name / user..name).

// - Number of characters must be between 8 to 255.

//Password
// - Number of characters must be between 8 to 255.

// - Contain at least 1 character in Upper Case

// - Contain at least 1 Special Character (!, @, #, $, &, *)

// -  Contain at least 1 numeral (0-9)

// -  Contain at least 1 letters in lower case

// RegExp underscoreDotRegrex =
//     RegExp(r'^[a-zA-Z0-9]+([_.](?![_.])|[a-zA-Z0-9])*$');
// RegExp doubleCharRegrex =
//     RegExp(r'^[a-zA-Z0-9]+([_.](?![_.])+[a-zA-Z0-9]+)*$');
// RegExp startEndRegrex = RegExp(r'^[a-zA-Z0-9]+([_.][a-zA-Z0-9]+)*$');

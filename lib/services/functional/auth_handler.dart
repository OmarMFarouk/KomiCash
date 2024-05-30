class AuthHandler {
  static loginErrHandler(username, password) async {
    if (password.text.isEmpty ||
        username.text.isEmpty ||
        password.text.length < 6) {
      return 'Some or all fields are empty';
    }

    return true;
  }

  static registerErrHandler(
      email, password, confirmPassword, name, username, refer) async {
    if (email.text.isEmpty ||
        password.text.isEmpty ||
        confirmPassword.text.isEmpty ||
        name.text.isEmpty ||
        username.text.isEmpty) {
      return 'Some or all fields are empty';
    }
    if (password.text != confirmPassword.text || password.text.length < 6) {
      return "Passwords don't match or less than 6 characters";
    }
    if (refer.text.length != 5 && refer.text.isNotEmpty) {
      return "Wrong referral code";
    }
    if (!email.text.contains('@') || !email.text.contains('.')) {
      return 'Invalid e-mail address';
    } else {
      return true;
    }
  }
}
//   static loginErrHandler(email, password) async {
//     QuerySnapshot statusQuery = await FirebaseFirestore.instance
//         .collection('users')
//         .where('email', isEqualTo: email.text)
//         .where('banned', isEqualTo: true)
//         .get();

//     QuerySnapshot emailQuery = await FirebaseFirestore.instance
//         .collection('users')
//         .where('email', isEqualTo: email.text)
//         .get();

//     var bytes = utf8.encode(password.text);
//     var hash = sha256.convert(bytes);

//     QuerySnapshot passQuery = await FirebaseFirestore.instance
//         .collection('users')
//         .where('password', isEqualTo: hash.toString())
//         .get();

//     if (email.text.isEmpty ||
//         password.text.isEmpty ||
//         password.text.length < 6) {
//       return 'Some or all fields are empty';
//     }
//     if (!email.text.contains('@') || !email.text.contains('.')) {
//       return 'Invalid e-mail address';
//     } else if (statusQuery.docs.isNotEmpty) {
//       return "You're banned";
//     } else if (emailQuery.docs.isEmpty) {
//       return "User doesn't exist";
//     } else if (passQuery.docs.isEmpty) {
//       return "Wrong password";
//     } else {
//       return true;
//     }
//   }

//   static registerErrHandler(email, password, confirmPassword, name) async {
//     QuerySnapshot query = await FirebaseFirestore.instance
//         .collection('users')
//         .where('email', isEqualTo: email.text)
//         .get();

//     if (email.text.isEmpty ||
//         password.text.isEmpty ||
//         confirmPassword.text.isEmpty ||
//         name.text.isEmpty) {
//       return 'Some or all fields are empty';
//     }
//     if (password.text != confirmPassword.text || password.text.length < 6) {
//       return "Passwords don't match or less than 6 characters";
//     }
//     if (!email.text.contains('@') || !email.text.contains('.')) {
//       return 'Invalid e-mail address';
//     } else if (query.docs.isNotEmpty) {
//       return "E-mail already exist";
//     } else {
//       return true;
//     }
//   }
// }

mixin ValidatorMixin{
  String? emailValidate(value) {
    if (value == "") {
      return "Please fill the Email Field!!";
    } else if (!value!.contains('@')) {
      return "Please enter a valid Email!!";
    }

    return null;
  }

  String? passValidate(value) {
    if (value == "") {
      return "Please fill the Pass Field!!";
    } else if (value!.length < 5) {
      return "Please enter an valid Password (password must contain atleast 5 chars)";
    }

    return null;
  }

  String? ageValidate(value) {
    if (value == "") {
      return "Please fill the Age Field!!";
    } else if (int.parse(value!.toString()) < 16) {
      return "Your Age must be above 16 yrs to proceed!!";
    }

    return null;
  }
}
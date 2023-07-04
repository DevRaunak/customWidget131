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
}
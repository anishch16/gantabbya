class StringsUtil{

  String getFirstName(String fullName) {
    List<String> nameParts = fullName.split(' ');
    if (nameParts.isNotEmpty) {
      return nameParts[0];
    } else {
      return ''; // Handle the case where the input string is empty
    }
  }

}


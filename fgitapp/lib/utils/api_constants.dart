class ApiUrls {
  static const String appBaseUrl =
      'https://api.github.com'; // this is live url in case of multiple flavor url they are store in other such variables with appropiate names
  static const String getAllusers = '/users';
  static const String getUserDetails = '/users/__userid__';
  static const String getUserReposList = '/users/__userid__/repos';
}

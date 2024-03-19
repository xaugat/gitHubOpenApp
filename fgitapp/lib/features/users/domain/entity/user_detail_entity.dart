class UserDetailsModel {
  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;

  String? url;

  String? followersUrl;
  String? followingUrl;

  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;

  String? type;
  bool? siteAdmin;
  String? name;
  String? company;
  String? blog;
  String? location;
  String? email;
  String? hireable;
  String? bio;
  String? twitterUsername;
  int? publicRepos;

  int? followers;
  int? following;
  String? createdAt;
  String? updatedAt;

  UserDetailsModel(
      {this.login,
      this.id,
      this.nodeId,
      this.avatarUrl,
      this.url,
      this.followersUrl,
      this.followingUrl,
      this.organizationsUrl,
      this.reposUrl,
      this.eventsUrl,
      this.type,
      this.siteAdmin,
      this.name,
      this.company,
      this.blog,
      this.location,
      this.email,
      this.hireable,
      this.bio,
      this.twitterUsername,
      this.publicRepos,
      this.followers,
      this.following,
      this.createdAt,
      this.updatedAt});
}

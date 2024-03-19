import 'package:fgitapp/features/users/domain/entity/user_detail_entity.dart';
import 'package:fgitapp/features/users/domain/entity/user_entity.dart';

class UserDetailsResponseModel extends UserDetailsModel {
  UserDetailsResponseModel(
      {required String login,
      required int? id,
      String? nodeId,
      String? avatarUrl,
      String? url,
      String? followersUrl,
      String? followingUrl,
      String? organizationsUrl,
      String? reposUrl,
      String? eventsUrl,
      String? receivedEventsUrl,
      String? type,
      bool? siteAdmin,
      String? name,
      String? company,
      String? blog,
      String? location,
      String? email,
      String? hireable,
      String? bio,
      int? publicRepos,
      int? followers,
      int? following,
      String? createdAt,
      String? updatedAt})
      : super(
            login: login,
            id: id,
            nodeId: nodeId,
            avatarUrl: avatarUrl,
            url: url,
            followersUrl: followersUrl,
            followingUrl: followersUrl,
            followers: followers,
            following: following,
            hireable: hireable,
            email: email,
            bio: bio,
            name: name,
            company: company,
            siteAdmin: siteAdmin,
            publicRepos: publicRepos,
            reposUrl: reposUrl);

  UserDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    nodeId = json['node_id'];
    avatarUrl = json['avatar_url'];

    url = json['url'];

    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];

    organizationsUrl = json['organizations_url'];
    reposUrl = json['repos_url'];
    eventsUrl = json['events_url'];
    receivedEventsUrl = json['received_events_url'];
    type = json['type'];
    siteAdmin = json['site_admin'];
    name = json['name'];
    company = json['company'];
    blog = json['blog'];
    location = json['location'];
    email = json['email'];
    hireable = json['hireable'];
    bio = json['bio'];

    publicRepos = json['public_repos'];

    followers = json['followers'];
    following = json['following'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login'] = login;
    data['id'] = id;
    data['node_id'] = nodeId;
    data['avatar_url'] = avatarUrl;

    data['url'] = url;

    data['followers_url'] = followersUrl;
    data['following_url'] = followingUrl;

    data['organizations_url'] = organizationsUrl;
    data['repos_url'] = reposUrl;
    data['events_url'] = eventsUrl;
    data['received_events_url'] = receivedEventsUrl;
    data['type'] = type;
    data['site_admin'] = siteAdmin;
    data['name'] = name;
    data['company'] = company;
    data['blog'] = blog;
    data['location'] = location;
    data['email'] = email;
    data['hireable'] = hireable;
    data['bio'] = bio;

    data['public_repos'] = publicRepos;

    data['followers'] = followers;
    data['following'] = following;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

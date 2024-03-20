import 'package:fgitapp/features/users/domain/entity/user_repo_detail_entity.dart';

class RepositoryModel extends RepositoryEntity {
  RepositoryModel(
      {required int id,
      required String name,
      required String fullName,
      required bool private,
      required int watchersCount,
      required int forkCounts,
      required OwnerModel owner})
      : super(
            id: id,
            name: name,
            fullName: fullName,
            private: private,
            owner: owner,
            watchersCount: watchersCount,
            forksCount: forkCounts);

  factory RepositoryModel.fromJson(Map<String, dynamic> json) {
    return RepositoryModel(
      id: json['id'],
      name: json['name'],
      fullName: json['full_name'],
      private: json['private'],
      watchersCount: json['watchers_count'],
      forkCounts: json['forks_count'],
      owner: OwnerModel.fromJson(json['owner']),
    );
  }

  RepositoryEntity toEntity() {
    return RepositoryEntity(
        id: id,
        name: name,
        fullName: fullName,
        private: private,
        owner: owner,
        watchersCount: watchersCount,
        forksCount: forksCount);
  }
}

class OwnerModel extends OwnerEntity {
  OwnerModel({required String login, required int id, required String nodeId})
      : super(id: id, login: login, nodeId: nodeId);

  factory OwnerModel.fromJson(Map<String, dynamic> json) {
    return OwnerModel(
      login: json['login'],
      id: json['id'],
      nodeId: json['node_id'],
    );
  }

  OwnerEntity toEntity() {
    return OwnerEntity(
      login: login,
      id: id,
      nodeId: nodeId,
    );
  }
}

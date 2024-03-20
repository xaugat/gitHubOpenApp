// entity.dart

import 'package:equatable/equatable.dart';

class RepositoryEntity extends Equatable {
  final int id;
  final String name;
  final String fullName;
  final bool private;
  final int forksCount;
  final int watchersCount;
  final OwnerEntity owner;

  const RepositoryEntity({
    required this.id,
    required this.name,
    required this.fullName,
    required this.private,
    required this.forksCount,
    required this.watchersCount,
    required this.owner,
  });

  @override
  List<Object?> get props =>
      [id, name, fullName, private, forksCount, watchersCount, owner];
}

class OwnerEntity extends Equatable {
  final String login;
  final int id;
  final String nodeId;

  const OwnerEntity({
    required this.login,
    required this.id,
    required this.nodeId,
  });

  @override
  List<Object?> get props => [login, id, nodeId];
}

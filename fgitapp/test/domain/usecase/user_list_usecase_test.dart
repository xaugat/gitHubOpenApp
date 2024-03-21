import 'package:dartz/dartz.dart';
import 'package:fgitapp/core/use_cases/common_use_cases.dart';
import 'package:fgitapp/features/users/domain/entity/user_entity.dart';
import 'package:fgitapp/features/users/domain/use_cases/user_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  GetUserList? getUserListUseCase;
  MockUserDataRepository mockUserDataRepository = MockUserDataRepository();

  setUp(() {
    mockUserDataRepository = MockUserDataRepository();
    getUserListUseCase = GetUserList(mockUserDataRepository);
  });

  final List<UsersListModel> testUserList = [
    UsersListModel(
        id: 1,
        login: 'xaugat',
        nodeId: '1234',
        avatarUrl: 'https:///www.saugat.com'),
    UsersListModel(
        id: 2,
        login: 'biraj',
        nodeId: '123456',
        avatarUrl: 'https:///www.saugat.com'),
    UsersListModel(
        id: 3,
        login: 'ashish',
        nodeId: '123456',
        avatarUrl: 'https:///www.saugat.com'),
  ];

  test('Should list all users list from api', () async {
    //arrange
    when(mockUserDataRepository.getUserDataList())
        .thenAnswer((_) async => Left(testUserList));

    //act
    final result = await getUserListUseCase!.call(NoParams());

    //assert
    expect(result, Left(testUserList));
  });
}

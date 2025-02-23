import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_rooms/models/user_model.dart';
import 'package:open_rooms/resources/auth/auth_controller.dart';
import 'package:open_rooms/resources/user_profile/user_profile_repository.dart';
import 'package:open_rooms/utils/show_snackbar.dart';
import 'package:routemaster/routemaster.dart';

final userProfileControllerProvider =
    StateNotifierProvider<UserProfileController, bool>((ref) {
  final userProfileRepository = ref.watch(UserProfileRepositoryProvider);
  return UserProfileController(
    userProfileRepository: userProfileRepository,
    ref: ref,
  );
});

class UserProfileController extends StateNotifier<bool> {
  final UserProfileRepository _userProfileRepository;
  final Ref _ref;
  UserProfileController({
    required UserProfileRepository userProfileRepository,
    required Ref ref,
  })  : _userProfileRepository = userProfileRepository,
        _ref = ref,
        super(false);

  void editProfile(
      {required String name,
      required String batch,
      required BuildContext context}) async {
    state = true;
    UserModel user = _ref.read(userProvider)!;

    user = user.copyWith(name: name, batch:batch);
    final res = await _userProfileRepository.editProfile(user);

    state = false;
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        _ref.read(userProvider.notifier).update((state) => user);
        Routemaster.of(context).pop();
      },
    );
  }
}

import 'package:broadway_example_ui/for%20firebase/user_fireabase_model.dart';

abstract class UserssEvent {}

class GetUserss extends UserssEvent {}

class SaveUserss extends UserssEvent {
  final UserFirebaseModel data;
  SaveUserss(this.data);
}

class DeleteUser extends UserssEvent {
  String id;
  DeleteUser(this.id);
}

class UpdateUserss extends UserssEvent {
  final UserFirebaseModel data;
  UpdateUserss(this.data);
}

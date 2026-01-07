import 'package:broadway_example_ui/for%20firebase/user_fireabase_model.dart';

abstract class UserssState {}

class UserssInitial extends UserssState {}

class UserssLoading extends UserssState {}

class UserssLoaded extends UserssState {
  final List<UserFirebaseModel> data;
  UserssLoaded(this.data);
}

class UserssError extends UserssState {}

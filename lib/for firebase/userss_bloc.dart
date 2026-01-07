import 'package:broadway_example_ui/for%20firebase/firebase_service.dart';
import 'package:broadway_example_ui/for%20firebase/user_fireabase_model.dart';
import 'package:broadway_example_ui/for%20firebase/userss_event.dart';
import 'package:broadway_example_ui/for%20firebase/userss_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserssBloc extends Bloc<UserssEvent, UserssState> {
  FirebaseService service;
  List<UserFirebaseModel> value = [];

  UserssBloc(this.service) : super(UserssInitial()) {
    on<GetUserss>((event, emit) async {
      emit(UserssLoading());
      final data = await service.getUsersDataWithModel();
      value = data;
      emit(UserssLoaded(value));
    });
    on<SaveUserss>((event, emit) async {
      emit(UserssLoading());
      await service.addUsersWithModel(event.data);
      emit(UserssLoaded(value));
    });
  }
}

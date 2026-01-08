import 'package:broadway_example_ui/for%20firebase/firebase_service.dart';
import 'package:broadway_example_ui/for%20firebase/user_fireabase_model.dart';
import 'package:broadway_example_ui/for%20firebase/userss_event.dart';
import 'package:broadway_example_ui/for%20firebase/userss_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserssBloc extends Bloc<UserssEvent, UserssState> {
  FirebaseService service;
  // List<UserFirebaseModel> value = [];

  UserssBloc(this.service) : super(UserssInitial()) {
    on<GetUserss>((event, emit) async {
      emit(UserssLoading());
      // getData();
      final data = await service.getUsersDataWithModel();
      // value = data;
      emit(UserssLoaded(data));
    });
    on<SaveUserss>((event, emit) async {
      emit(UserssLoading());
      await service.addUsersWithModel(event.data);

      final data = await service.getUsersDataWithModel();
      //  getData();
      emit(UserssLoaded(data));
    });
    on<DeleteUser>((event, emit) async {
      emit(UserssLoading());
      await service.deletUserss(event.id);
      final data = await service.getUsersDataWithModel();
      // getData();
      emit(UserssLoaded(data));
    });
    on<UpdateUserss>((event, emit) async {
      emit(UserssLoading());
      await service.updateUserss(event.data);
      final data = await service.getUsersDataWithModel();

      emit(UserssLoaded(data));
    });
  }
  // void getData() async {
  //   final data = await service.getUsersDataWithModel();
  //   value = data;
  // }
}

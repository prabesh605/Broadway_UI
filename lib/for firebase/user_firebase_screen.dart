import 'package:broadway_example_ui/for%20firebase/firebase_service.dart';
import 'package:broadway_example_ui/for%20firebase/user_fireabase_model.dart';
import 'package:broadway_example_ui/for%20firebase/userss_bloc.dart';
import 'package:broadway_example_ui/for%20firebase/userss_event.dart';
import 'package:broadway_example_ui/for%20firebase/userss_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirebaseUser extends StatefulWidget {
  const FirebaseUser({super.key});

  @override
  State<FirebaseUser> createState() => _FirebaseUserState();
}

class _FirebaseUserState extends State<FirebaseUser> {
  // List<Map<String, dynamic>> users = [];
  // List<UserFirebaseModel> users = [];
  FirebaseService service = FirebaseService();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                label: Text("Name"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                label: Text("Email"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final data = UserFirebaseModel(
                  name: nameController.text,
                  email: emailController.text,
                );
                // final Map<String, dynamic> json = {
                //   'name': nameController.text,
                //   'email': emailController.text,
                // };
                context.read<UserssBloc>().add(SaveUserss(data));
                // service.addUsersWithModel(data);
                nameController.clear();
                emailController.clear();
              },
              child: Text("Save"),
            ),

            ElevatedButton(
              onPressed: () async {
                context.read<UserssBloc>().add(GetUserss());

                // final result = await service.getUsersDataWithModel();
                // setState(() {
                //   users = result;
                // });
                // print(users);
              },
              child: Text("Get Data"),
            ),
            BlocBuilder<UserssBloc, UserssState>(
              builder: (context, state) {
                if (state is UserssLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is UserssError) {
                  return Center(child: Text("Error"));
                }
                if (state is UserssLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.data.length,
                      itemBuilder: (context, index) {
                        final user = state.data[index];
                        return ListTile(
                          title: Text(user.name),
                          subtitle: Text(user.email),
                        );
                      },
                    ),
                  );
                }
                return SizedBox.shrink();
              },
            ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: users.length,
            //     itemBuilder: (context, index) {
            //       final user = users[index];
            //       return ListTile(title: Text(user['name']));
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

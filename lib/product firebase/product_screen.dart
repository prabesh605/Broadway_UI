import 'package:broadway_example_ui/for%20firebase/firebase_service.dart';
import 'package:broadway_example_ui/for%20firebase/userss_bloc.dart';
import 'package:broadway_example_ui/for%20firebase/userss_state.dart';
import 'package:broadway_example_ui/product%20firebase/product_bloc.dart';
import 'package:broadway_example_ui/product%20firebase/product_event.dart';
import 'package:broadway_example_ui/product%20firebase/product_model.dart';
import 'package:broadway_example_ui/product%20firebase/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  // List<UserFirebaseModel> users = [];
  FirebaseService service = FirebaseService();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final imageController = TextEditingController();
  final descriptionController = TextEditingController();

  final nameUpdateController = TextEditingController();
  final priceUpdateController = TextEditingController();
  final imageUpdateController = TextEditingController();
  final descriptionUpdateController = TextEditingController();
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(GetProducts());
  }

  void showUpdataBottomSheet(String id) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Update"),
              SizedBox(height: 20),
              TextFormField(
                controller: nameUpdateController,
                decoration: InputDecoration(
                  label: Text("Name"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: priceUpdateController,
                decoration: InputDecoration(
                  label: Text("Email"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: imageUpdateController,
                decoration: InputDecoration(
                  label: Text("Image"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: descriptionUpdateController,
                decoration: InputDecoration(
                  label: Text("Decription"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final name = nameUpdateController.text;
                  final email = priceUpdateController.text;
                  // final data = UserFirebaseModel(
                  //   id: id,
                  //   name: name,
                  //   email: email,
                  // );
                  // context.read<UserssBloc>().add(UpdateUserss(data));
                  // service.updateUserss(data);
                  Navigator.pop(context);
                },
                child: Text("Update"),
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

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
              controller: priceController,
              decoration: InputDecoration(
                label: Text("Price"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: imageController,
              decoration: InputDecoration(
                label: Text("Image"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                label: Text("Description"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final value = ProductModel(
                  id: "",
                  name: nameController.text,
                  price: double.parse(priceController.text),
                  image: imageController.text,
                  description: descriptionController.text,
                );
                context.read<ProductBloc>().add(AddProduct(value));
                nameController.clear();
                priceController.clear();
              },
              child: Text("Save"),
            ),

            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is ProductError) {
                  return Center(child: Text("Error"));
                }
                if (state is ProductLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.data.length,
                      itemBuilder: (context, index) {
                        final user = state.data[index];
                        return ListTile(
                          leading: IconButton(
                            onPressed: () {
                              nameUpdateController.text = user.name;
                              priceUpdateController.text = "${user.price}";
                              showUpdataBottomSheet(user.id ?? "");
                            },
                            icon: Icon(Icons.edit),
                          ),
                          title: Text(user.name),
                          subtitle: Text("${user.price}"),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete, color: Colors.red),
                          ),
                        );
                      },
                    ),
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}

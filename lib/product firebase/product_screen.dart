import 'package:broadway_example_ui/for%20firebase/firebase_service.dart';
import 'package:broadway_example_ui/for%20firebase/userss_bloc.dart';
import 'package:broadway_example_ui/for%20firebase/userss_state.dart';
import 'package:broadway_example_ui/product%20firebase/login_page.dart';
import 'package:broadway_example_ui/product%20firebase/product_bloc.dart';
import 'package:broadway_example_ui/product%20firebase/product_event.dart';
import 'package:broadway_example_ui/product%20firebase/product_firebase_service.dart';
import 'package:broadway_example_ui/product%20firebase/product_model.dart';
import 'package:broadway_example_ui/product%20firebase/product_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  // List<UserFirebaseModel> users = [];
  ProductFirebaseService service = ProductFirebaseService();
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
    // context.read<ProductBloc>().add(GetProducts());
    context.read<ProductBloc>().add(LoadProducts());
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
                  label: Text("Price"),
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
                onPressed: () async {
                  final name = nameUpdateController.text;
                  final price = priceUpdateController.text;
                  final image = imageUpdateController.text;
                  final description = descriptionUpdateController.text;
                  final data = ProductModel(
                    id: id,
                    name: name,
                    price: double.parse(price),
                    image: image,
                    description: description,
                  );
                  final uid = await service.currentUser();
                  if (uid.isNotEmpty) {
                    context.read<ProductBloc>().add(UpdateProduct(data));

                    Navigator.pop(context);
                  }
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
      appBar: AppBar(
        title: Text("Product"),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPageFirebase()),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
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

            // StreamBuilder(
            //   stream: service.getProductStream(),
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return Center(child: CircularProgressIndicator());
            //     } else if (snapshot.hasError) {
            //       return Center(child: Text('Error: ${snapshot.error}'));
            //     } else if (snapshot.connectionState == ConnectionState.done) {
            //       return Text("Stream done");
            //     } else {
            //       final responseData = snapshot.data ?? [];

            //       return Expanded(
            //         child: ListView.builder(
            //           itemCount: responseData.length,
            //           itemBuilder: (context, index) {
            //             final user = responseData[index];
            //             return Row(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 IconButton(
            //                   onPressed: () {
            //                     nameUpdateController.text = user.name;
            //                     priceUpdateController.text = "${user.price}";
            //                     showUpdataBottomSheet(user.id ?? "");
            //                   },
            //                   icon: Icon(Icons.edit),
            //                 ),

            //                 Container(
            //                   height: 60,
            //                   width: 60,
            //                   child: Image.network(
            //                     "${user.image}",
            //                     fit: BoxFit.cover,
            //                   ),
            //                 ),
            //                 SizedBox(width: 20),
            //                 Column(
            //                   children: [
            //                     Text(user.name),
            //                     Text("${user.price}"),
            //                     Text("${user.description}"),
            //                     IconButton(
            //                       onPressed: () {},
            //                       icon: Icon(Icons.delete, color: Colors.red),
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             );
            //           },
            //         ),
            //       );
            //     }
            //     // return
            //   },
            // ),
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
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      nameUpdateController.text = user.name;
                                      priceUpdateController.text =
                                          "${user.price}";
                                      imageUpdateController.text = user.image;
                                      descriptionController.text =
                                          user.description;

                                      showUpdataBottomSheet(user.id ?? "");
                                    },
                                    icon: Icon(Icons.edit),
                                  ),
                                  Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        child: Image.network(
                                          "${user.image}",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(user.name),
                                          Text("${user.price}"),
                                          Text("${user.description}"),
                                        ],
                                      ),
                                      SizedBox(width: 40),
                                      IconButton(
                                        onPressed: () {
                                          context.read<ProductBloc>().add(
                                            DeleteProduct(user.id ?? ""),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
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

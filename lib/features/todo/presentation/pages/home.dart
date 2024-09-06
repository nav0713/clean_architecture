// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:todo_clearn/features/todo/presentation/controller/todo_controller.dart';

// class HomePage extends StatelessWidget {
//   HomePage({super.key});
//   final controller = Get.put(TodoController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Builder(
//           builder: (context) {
//             return const Text("todo Clearn");
//           }
//         ),
//       ),
//       body: Center(
//         child: Obx(
//           () {
//             return Text(controller.count.value.toString());
//           }
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(onPressed: controller.increment,child: const Icon(Icons.add),),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clearn/features/todo/data/database/todo_remote_database.dart';
import 'package:todo_clearn/features/todo/data/repositories/todo_repository_imp.dart';
import 'package:todo_clearn/features/todo/domain/usecase/add.dart';

import '../controller/todo_controller.dart';

class HomePage extends StatelessWidget{

   HomePage({super.key,});
  final controller = Get.put(TodoController(addTodoUseCase: AddTodoUseCase(repository: TodoRepositoryImp(remoteDatabase: TodoRemoteDatabaseImp()))));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Clean Architecture'),
      ),
      body:  ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  title: const Text("Title"),
                  subtitle: const Text("Description"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        splashRadius: 20,
                        onPressed: () {
                          showModalBottomSheet(
                            showDragHandle: true,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return Container(
                                width: double.maxFinite,
                                height: MediaQuery.of(context).size.height * 0.8,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Form(
                                    key: controller.formKey,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: controller.titleController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Title is required';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            labelText: 'Title',
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 8.0),
                                          child: TextFormField(
                                            controller: controller.descriptionController,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Description is required';
                                              }
                                              return null;
                                            },
                                            decoration: const InputDecoration(
                                              labelText: 'Description',
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.maxFinite,
                                          child: ElevatedButton(
                                            onPressed: () async {
                                          if(controller.formKey.currentState!.validate()){
                                            // controller.formKey.currentState!.save();
                                            controller.addTodo();
                                            Navigator.pop(context);
                                          }
                                            },
                                            child: const Text('Edit Todo'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );



                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        splashRadius: 20,
                        onPressed: () {
               
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
      ),    
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            showDragHandle: true,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.8,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.titleController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Title is required';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Title',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            controller: controller.descriptionController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Description is required';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Description',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            onPressed: () async {
                              if(controller.formKey.currentState!.validate()){
                                            // controller.formKey.currentState!.save();
                                            controller.addTodo();
                                            Navigator.pop(context);
                                          }
                            },
                            child: const Text('Add'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),);
          }


  }

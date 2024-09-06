import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clearn/features/todo/domain/entities/todo.dart';
import 'package:todo_clearn/features/todo/domain/usecase/add.dart';

import '../../../../shared/utils/usecase.dart';


class TodoController extends GetxController{
final formKey = GlobalKey<FormState>();
final titleController = TextEditingController();
final descriptionController = TextEditingController();
final AddTodoUseCase addTodoUseCase;
TodoController({required this.addTodoUseCase});

Future<void>addTodo()async{
 final results = await addTodoUseCase.call(Params(Todo(id: "1", text: "Todo1", description: "Todo 1 descrtpition")));
 results.fold(((failure){
print(failure.message);
 }), ((todo){
print("Success");
 }));
}
}
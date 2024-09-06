import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_clearn/features/todo/domain/entities/todo.dart';

abstract class TodoRemoteDatabase {
  Future<Todo> addTodo(Todo todo);
  Future<Todo> editTodo(Todo todo);
  Future<Todo> deleteTodo(Todo todo);
  Future<List<Todo>> listTodo();
}

class TodoRemoteDatabaseImp implements TodoRemoteDatabase{
  @override
  Future<Todo> addTodo(Todo todo) async{
    await FirebaseFirestore.instance.collection('todos').doc(todo.id).set(todo.toMap());
    return todo;

  }

  @override
  Future<Todo> deleteTodo(Todo todo) async{
    await FirebaseFirestore.instance.collection('todos').doc(todo.id).delete();
    return todo;
  }

  @override
  Future<Todo> editTodo(Todo todo) async{
    await FirebaseFirestore.instance.collection('todos').doc(todo.id).update(todo.toMap());
    return todo;
  }

  @override
  Future<List<Todo>> listTodo()async {
    final todosData = await FirebaseFirestore.instance.collection('todos').get();
    return todosData.docs.map((item)=>Todo.fromMap(item.data())).toList();
  }

}
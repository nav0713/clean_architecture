// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:todo_clearn/features/todo/data/database/todo_remote_database.dart';
import 'package:todo_clearn/features/todo/domain/entities/todo.dart';
import 'package:todo_clearn/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_clearn/shared/errors/failure.dart';

class TodoRepositoryImp implements TodoRepository {

  final TodoRemoteDatabase remoteDatabase;
  TodoRepositoryImp({
    required this.remoteDatabase,
  });
  @override

  Future<Either<Failure, Todo>> add(Todo todo)async {
   try{
      final results = await remoteDatabase.addTodo(todo);
      return Right(results);
   }catch(e){
    return Left(Failure(message: "Ooops, we could't add the todo"));
   }
   
  }

  @override
  Future<Either<Failure, Todo>> delete(Todo todo) async{
     try{
      final results = await remoteDatabase.deleteTodo(todo);
      return Right(results);
   }catch(e){
    return Left(Failure(message: "Ooops, we could't add the todo"));
   }
  }

  @override
  Future<Either<Failure, Todo>> edit(Todo todo) async{
     try{
      final results = await remoteDatabase.editTodo(todo);
      return Right(results);
   }catch(e){
    return Left(Failure(message: "Ooops, we could't add the todo"));
   }
  }

  @override
  Future<Either<Failure, List<Todo>>> getAll()async {
     try{
      final results = await remoteDatabase.listTodo();
      return Right(results);
   }catch(e){
    return Left(Failure(message: "Ooops, we could't add the todo"));
   }
  }

}

// a use case to a specific action or functionality that a user can perform within an application. It represents a logical unit of work that an appllication can perform to a user's request or an event
//usecase call a repository
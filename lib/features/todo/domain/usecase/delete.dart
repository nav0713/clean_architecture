import 'package:dartz/dartz.dart';
import 'package:todo_clearn/features/todo/domain/entities/todo.dart';
import 'package:todo_clearn/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_clearn/shared/errors/failure.dart';

import '../../../../shared/utils/usecase.dart';

class DeleteTodoUseCase implements Usecase<Todo,Params<Todo>>{
  final TodoRepository repository;

  DeleteTodoUseCase({required this.repository});

  @override
  Future<Either<Failure, Todo>> call(Params todo)async {
    return await repository.delete(todo.data);
  }

}
import 'package:dartz/dartz.dart';
import 'package:todo_clearn/features/todo/domain/entities/todo.dart';
import 'package:todo_clearn/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_clearn/shared/errors/failure.dart';

import '../../../../shared/utils/usecase.dart';

class ListTodoUseCase implements Usecase<List<Todo>,NoParams>{
  final TodoRepository repository;

  ListTodoUseCase({required this.repository});
  
  @override
  Future<Either<Failure, List<Todo>>> call(NoParams params) {
    return repository.getAll();
  } 
  

}
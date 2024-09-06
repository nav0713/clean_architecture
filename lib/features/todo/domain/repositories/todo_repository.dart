import 'package:dartz/dartz.dart';
import 'package:todo_clearn/features/todo/domain/entities/todo.dart';
import 'package:todo_clearn/shared/errors/failure.dart';

abstract class TodoRepository {
  Future<Either<Failure,Todo>> add(Todo todo);
  Future<Either<Failure,Todo>> edit(Todo todo);
  Future<Either<Failure,Todo>> delete(Todo todo);
  Future<Either<Failure,List<Todo>>> getAll();
}

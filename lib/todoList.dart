import 'dart:io';

void main() {
  final List<String> todoList = [];

  while (true) {
    print('\nChoose the option:');
    print('1. Add new Task:');
    print('2. Mark Task as Complete:');
    print('3. Remove a Task:');
    print('4. View todo List:');
    print('5. Exit');

    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        addTask(todoList);
        break;

      case '2':
        markTaskComplete(todoList);
        break;

      case '3':
        removeTask(todoList);
        break;

      case '4':
        viewTodoList(todoList);
        break;

      case '5':
        exit(0);
        break;

      default:
        print('Invalid choice. Please try again');
    }
  }
}

void addTask(List<String> todoList) {
  print('Enter task to add');
  var task = stdin.readLineSync();
  todoList.add(task!);
  print('Task added $task');
}

void markTaskComplete(List<String> todoList) {
  viewTodoList(todoList);

  print('enter index of task to mark as complete:');
  var index = int.tryParse(stdin.readLineSync()!);
  if (index != null && index >= 0 && index < todoList.length) {
    print(' ${todoList[index]} Task is completed');
    todoList[index] = 'completed ${todoList[index]}';
  } else {
    print('invalid index.Please try again');
  }
}

void removeTask(List<String> todoList) {
  viewTodoList(todoList);

  print('enter task index to remove');
  var index = int.tryParse(stdin.readLineSync()!);
  if (index != null && index >= 0 && index < todoList.length) {
    var removetask = todoList.removeAt(index);
    print('Task removed $removetask');
  } else {
    print('invalid index.Please try again');
  }
}

void viewTodoList(List<String> todoList) {
  print('/nTo-Do List');
  for (var i = 0; i < todoList.length; i++) {
    print('$i. ${todoList[i]}');
  }
}

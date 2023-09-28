import 'package:get/get.dart';

import '../service/http_services.dart';


class TodosController extends GetxController {
  var isLoading = true.obs;
  var todoList = [].obs;

  @override
  void onInit() {
    todosList();
    super.onInit();
  }

  void todosList() async {
    try {
      isLoading(true);
      var list = await HttpService.todosList();
      if (list !=null) {
        todoList.value = list;
      }
    }
    finally {
      isLoading(false);
    }
  }

}
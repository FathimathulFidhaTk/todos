import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todos/controllers/todos_controller.dart';


void main(){
  runApp(MaterialApp(home: ProductCart(),
    debugShowCheckedModeBanner: false,));
}

class ProductCart extends StatelessWidget {
  final TodosController todosController = Get.put(TodosController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Todos',style: TextStyle(color: Colors.white),),
        ),
        body: Column(
            children: [
              Expanded(
                child: Obx(
                      () {
                    if (todosController.isLoading.value)
                      return Center(child: CircularProgressIndicator());
                    else {
                      return ListView.builder(
                        itemCount: todosController.todoList.length,
                        itemBuilder: (context, index) {
                         return Card(
                           child: ListTile(
                             leading: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(todosController.todoList[index].id.toString(),style: TextStyle(),),
                                 Text(todosController.todoList[index].title.toString()),
                                 Text(todosController.todoList[index].completed.toString()),
                               ],
                             ),
                           ),
                         );
                        },
                      );
                    }
                  },
                ),
              )
            ]
        )
    );


  }

}

import 'package:flutter/material.dart';
import 'package:start/EXAMPLE1/Models/pancake_pto.dart';
import 'package:start/EXAMPLE1/async_value.dart';

class Pancakeprovider extends ChangeNotifier {
 

  final PancakeRepository _repository;
 

  AsyncValue<List<Pancake>>? pancakesState;
 


 

  Pancakeprovider(this._repository) {
 

    fetchUsers();
 

  }
 


 

  bool get isLoading =>
 

      pancakesState != null && pancakesState!.state == AsyncValueState.loading;
 

  bool get hasData =>
 

      pancakesState != null && pancakesState!.state == AsyncValueState.success;
 


 

  void fetchUsers() async {
 

    try {
 

      // 1- loading state
 

      pancakesState = AsyncValue.loading();
 

      notifyListeners();
 


 

      // 2 - Fetch users
 

      pancakesState = AsyncValue.success(await _repository.getPancakes());
 


 

      print("SUCCESS: list size ${pancakesState!.data!.length.toString()}");
 


 

      // 3 - Handle errors
 

    } catch (error) {
 

      print("ERROR: $error");
 

      pancakesState = AsyncValue.error(error);
 

    }
 


 

    notifyListeners();
 

  }
 


 

  void addPancake(String color, double price) async {
 

    // 1- Call repo to add
 

    await _repository.addPancake(color: color, price: price);
 


 

    // 2- Call repo to fetch
 

    fetchUsers();
 

  }
 


 

  void removePancake(String pancakeId) async {
 

    await _repository.removePancake(pancakeId);
 

    fetchUsers();
 

  }
 


 

  void editPancake(Pancake pancake , String panacakeId) async{
 

    await _repository.updatePancake(pancake, panacakeId);
 

    fetchUsers();
 

  }
 

}

class PancakeRepository {
  removePancake(String pancakeId) {}
  
  updatePancake(Pancake pancake, String panacakeId) {}
  
  addPancake({required String color, required double price}) {}
  
  getPancakes() {}
}
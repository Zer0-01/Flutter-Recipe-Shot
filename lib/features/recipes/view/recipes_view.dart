import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/data/remote/response/api_status.dart';
import 'package:flutter_recipe_shot/features/recipes/vm/recipes_vm.dart';
import 'package:provider/provider.dart';

class RecipesView extends StatefulWidget {
  static const String id = 'recipes_view';
  const RecipesView({super.key});

  @override
  State<RecipesView> createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecipesView> {
  RecipesVm vm = RecipesVm();

  @override
  void initState() {
    super.initState();
    vm.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          vm.toAddRecipeView(context);
        },
        child: const Icon(Icons.add),
      ),
      body: ChangeNotifierProvider<RecipesVm>(
        create: (context) => vm,
        child: Consumer<RecipesVm>(
          builder: (context, vm, _) {
            switch (vm.recipesResponse.status) {
              case ApiStatus.LOADING:
                return const CircularProgressIndicator();
              case ApiStatus.ERROR:
                return const Placeholder();
              case ApiStatus.COMPLETED:
                return vm.listRecipe.isEmpty
                    ? const Text('Is empty')
                    : ListView.builder(
                        itemCount: vm.listRecipe.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Text(vm.listRecipe[index].title),
                          );
                        },
                      );
              default:
            }

            return Container();
          },
        ),
      ),
    );
  }
}

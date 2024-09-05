import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/data/remote/response/api_status.dart';
import 'package:flutter_recipe_shot/features/profile/view_model/profile_view_model.dart';
import 'package:flutter_recipe_shot/features/recipes/widget/recipes_card_widget.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileViewModel vm = ProfileViewModel();

  @override
  void initState() {
    super.initState();
    vm.init();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileViewModel>(
      create: (context) => vm,
      child: Consumer<ProfileViewModel>(
        builder: (context, vm, child) {
          // Replacing switch-case with if-else
          if (vm.recipesResponse.status == ApiStatus.LOADING || vm.deleteRecipeResponse?.status == ApiStatus.LOADING) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (vm.recipesResponse.status == ApiStatus.ERROR || vm.deleteRecipeResponse?.status == ApiStatus.ERROR) {
            return Center(
              child: Text(vm.recipesResponse.message.toString()),
            );
          } else if (vm.recipesResponse.status == ApiStatus.COMPLETED && vm.deleteRecipeResponse?.status != ApiStatus.ERROR) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2015/09/16/08/55/online-942406_960_720.jpg'),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text('User Name'),
                    Text(vm.userUid),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: vm.recipesResponse.data?.length,
                      itemBuilder: (context, index) {
                        final recipe = vm.recipesResponse.data?[index];
                        return Slidable(
                          key: Key(recipe!.id),
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            dismissible: DismissiblePane(
                              onDismissed: () {},
                            ),
                            children: [
                              SlidableAction(
                                onPressed: (context) {},
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Share',
                              ),
                              SlidableAction(
                                onPressed: (context) {
                                  vm.deleteRecipe(recipe.id);
                                },
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          child: RecipesCardWidget(
                            imageUrl: recipe.imageUrl,
                            title: recipe.title,
                            description: recipe.description,
                            onTap: () {},
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }

          // Default return if none of the conditions match
          return Container();
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2015/09/16/08/55/online-942406_960_720.jpg'),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text('User Name'),
                Text(vm.userUid),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Item $index'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

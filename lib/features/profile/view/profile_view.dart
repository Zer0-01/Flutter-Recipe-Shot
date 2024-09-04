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
  Widget build(BuildContext context) {
    vm.init();
    return ChangeNotifierProvider<ProfileViewModel>(
      create: (context) => vm,
      child: Consumer<ProfileViewModel>(
        builder: (context, vm, child) {
          switch (vm.recipesResponse.status) {
            case ApiStatus.LOADING:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ApiStatus.ERROR:
              return Center(
                child: Text(vm.recipesResponse.message.toString()),
              );
            case ApiStatus.COMPLETED:
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
                        itemCount: vm.listRecipe.length,
                        itemBuilder: (context, index) {
                          final recipe = vm.listRecipe[index];
                          return Slidable(
                            startActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {},
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                                SlidableAction(
                                  onPressed: (context) {},
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Share',
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
            default:
          }
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

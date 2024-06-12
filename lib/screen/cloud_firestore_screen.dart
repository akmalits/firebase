import 'package:fireeeee/provider/cloud_firestore_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

const collectionName = 'random_numbers';

class ItemProvider with ChangeNotifier {}

class CloudFireStore extends StatelessWidget {
  static const routeName = '/cloud_firestore';

  const CloudFireStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: CloudFireStoreProvider(),
      child: Consumer<CloudFireStoreProvider>(
        builder: (context, provider, child) {
          return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () async {
                        await provider.getCondition();
                        provider.controller!.clear();
                      },
                      icon: const Icon(Icons.add))
                ],
              ),
              body: Stack(
                children: [
                  ListView.builder(
                      itemCount: provider.items!.length,
                      itemBuilder: (context, index) {
                        return Slidable(
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (c) {
                                  provider.deleteItem(
                                      provider.items![index].numbers);
                                },
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: Text(provider.items![index].numbers),
                            subtitle: Text(provider.items![index].timestamp
                                .toDate()
                                .toString()),
                          ),
                        );
                      }),
                  Visibility(
                    visible: provider.condition!,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            TextField(
                              controller: provider.controller,
                              keyboardType: TextInputType.number,
                            ),
                            TextButton(
                                onPressed: () {
                                  var numbers =
                                      provider.controller!.text.trim();
                                  if (numbers.isNotEmpty) {
                                    provider.addItem(numbers);
                                    provider.getCondition();
                                  }
                                },
                                child: const Text('Add'))
                          ]),
                        ),
                      ),
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }

  showItemDialog(BuildContext context) {
    var numbersController = TextEditingController();

    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              TextField(
                controller: numbersController,
              ),
              TextButton(
                  onPressed: () {
                    var numbers = numbersController.text.trim();
                    if (numbers.isNotEmpty) {
                      Navigator.pop(context, numbers);
                    }
                  },
                  child: const Text('Add'))
            ]),
          );
        });
  }
}

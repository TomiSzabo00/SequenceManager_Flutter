import 'package:flutter/material.dart';
import 'package:sequence_manager/screens/global/list_viewmodel.dart';

class AddNewList extends StatefulWidget {
  const AddNewList({
    Key? key,
    required this.title,
    required this.viewModel,
  }) : super(key: key);

  final String title;
  final ListViewModel viewModel;

  @override
  AddNewListState createState() => AddNewListState();
}

class AddNewListState extends State<AddNewList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Current ${widget.title.toLowerCase()}"),
                ],
              ),
              Expanded(
                child: FutureBuilder(
                  future: widget.viewModel.fetchItems(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(snapshot.data![index].title),
                            subtitle: snapshot.data![index].subtitle.isEmpty
                                ? null
                                : Text(snapshot.data![index].subtitle),
                            trailing: IconButton(
                              onPressed: () {
                                showMoreMenu();
                              },
                              icon: const Icon(Icons.more_horiz),
                            ),
                            contentPadding: const EdgeInsets.all(0),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Add new",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void showMoreMenu() async {
    await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 100, 0, 0),
      items: const [
        PopupMenuItem(
          value: "update",
          child: Text("Edit"),
        ),
        PopupMenuItem(
          value: "delete",
          child: Text("Delete"),
        ),
      ],
    ).then((value) => {
          if (value == "update")
            {
              // TODO: update item
            }
          else if (value == "delete")
            {
              // TODO: delete item
            }
        });
  }
}

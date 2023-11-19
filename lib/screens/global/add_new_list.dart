import 'package:flutter/material.dart';
import 'package:sequence_manager/models/list/list_item.dart';

// ignore: must_be_immutable
class AddNewList extends StatefulWidget {
  AddNewList({
    Key? key,
    required this.title,
    required this.fetchItems,
    required this.updateItem,
    required this.deleteItem,
    required this.addNewItem,
  }) : super(key: key);

  final String title;
  Future<List<ListItem>> fetchItems;
  Function(ListItem) updateItem;
  Function(ListItem) deleteItem;
  Function() addNewItem;

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
                  future: widget.fetchItems,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data!;
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(data[index].title),
                            subtitle: data[index].subtitle.isEmpty
                                ? null
                                : Text(data[index].subtitle),
                            trailing: PopupMenuButton(
                              onSelected: (value) {
                                if (value == "update") {
                                  widget.updateItem(data[index]);
                                } else if (value == "delete") {
                                  widget.deleteItem(data[index]);
                                }
                              },
                              itemBuilder: (context) {
                                return const [
                                  PopupMenuItem(
                                    value: "update",
                                    child: Text("Edit"),
                                  ),
                                  PopupMenuItem(
                                    value: "delete",
                                    child: Text("Delete"),
                                  ),
                                ];
                              },
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
                  onPressed: () {
                    widget.addNewItem();
                  },
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
}

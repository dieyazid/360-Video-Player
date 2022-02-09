import 'package:file_manager/file_manager.dart';
import 'package:flutter/material.dart';
import 'dart:io';


class Local extends StatefulWidget {
  const Local({Key? key}) : super(key: key);

  @override
  _LocalState createState() => _LocalState();
}

class _LocalState extends State<Local>  {
  final FileManagerController controller = FileManagerController();
  late File file;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: FileManager(
          controller: controller,
          builder: (context, snapshot) {
            final List<FileSystemEntity> entities = snapshot;
            return ListView.builder(
              itemCount: entities.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: FileManager.isFile(entities[index])
                        ? Icon(Icons.feed_outlined)
                        : Icon(Icons.folder),
                    title: Text(FileManager.basename(entities[index])),
                    onTap: () {
                      if (FileManager.isDirectory(entities[index])) {
                        controller
                            .openDirectory(entities[index]); // open directory
                      } else {
                        file = File(entities[index].path);
                        print(file.path);
                      }
                    },
                  ),
                );
              },
            );
          },
        ),
      );
}
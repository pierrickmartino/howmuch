import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';

import 'responsive.dart';

class Importation extends StatefulWidget {
  const Importation({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;
  @override
  _ImportationState createState() => _ImportationState();
}

class _ImportationState extends State<Importation> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _fileName;
  List<PlatformFile> _paths;
  String _directoryPath;
  String _extension = 'csv';
  bool _loadingPath = false;
  bool _multiPick = false;
  FileType _pickingType = FileType.custom;
  TextEditingController _controller = TextEditingController();

//class Importation extends StatefulWidget {
  // const Importation({
  //   Key key,
  //   @required this.screenSize,
  // }) : super(key: key);

  //final Size screenSize;

  void _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: _multiPick,
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '')?.split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      _fileName = _paths != null ? _paths.map((e) => e.name).toString() : '...';
    });
  }

  void _clearCachedFiles() {
    FilePicker.platform.clearTemporaryFiles().then((result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: result ? Colors.green : Colors.red,
          content: Text((result
              ? 'Temporary files removed with success.'
              : 'Failed to clean temporary files')),
        ),
      );
    });
  }

  void _selectFolder() {
    FilePicker.platform.getDirectoryPath().then((value) {
      setState(() => _directoryPath = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(
          top: 0, //screenSize.height / 20,
          left: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 15
              : widget.screenSize.width / 5,
          right: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 15
              : widget.screenSize.width / 5,
        ),
        child: ResponsiveWidget.isSmallScreen(context)
            ? Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: widget.screenSize.height / 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => _openFileExplorer(),
                          child: const Text("Download a file"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: ElevatedButton(
                            onPressed: () => _clearCachedFiles(),
                            child: const Text("Clear"),
                          ),
                        ),
                      ],
                    ),
                    // ElevatedButton(
                    //   onPressed: () => _selectFolder(),
                    //   child: const Text("Pick folder"),
                    // ),
                    // ElevatedButton(
                    //   onPressed: () => _clearCachedFiles(),
                    //   child: const Text("Clear temporary files"),
                    // ),
                  ),
                ],
              )
            : Column(
                // TODO
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: widget.screenSize.height / 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => _openFileExplorer(),
                          child: const Text("Download a file"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: ElevatedButton(
                            onPressed: () => _clearCachedFiles(),
                            child: const Text("Clear"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

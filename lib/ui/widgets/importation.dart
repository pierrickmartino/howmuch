import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

import '../../src/bloc/bloc.dart';
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
  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _fileName;
  List<PlatformFile> _paths;
  //String _directoryPath;
  final String _extension = 'csv';
  bool _loadingPath = false;
  final bool _multiPick = false;
  final FileType _pickingType = FileType.custom;
  //TextEditingController _controller = TextEditingController();

//class Importation extends StatefulWidget {
  // const Importation({
  //   Key key,
  //   @required this.screenSize,
  // }) : super(key: key);

  //final Size screenSize;

  Future<void> _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {
      //_directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        withReadStream: true,
        allowMultiple: _multiPick,
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '')?.split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      print('Unsupported operation$e');
    } catch (ex) {
      print(ex);
    }

    await _uploadFile(_paths.first.readStream);

    if (!mounted) return;
    setState(() {
      _loadingPath = false;

      _fileName = _paths != null ? _paths.map((e) => e.name).toString() : '...';
    });
  }

  Future<void> _uploadFile(Stream<List<int>> content) async {
    final List<String> lines = await content
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .toList();

    for (var i = 1; i < lines.length; i++) {
      // here we can read each line to bind the database

      //print('Line $i: ${lines[i]}');

      final split = lines[i].split(';');
      final Map<int, String> values = {
        for (int i = 0; i < split.length; i++) i: split[i]
      };

      // print(values); // {0: grubs, 1:  sheep}

      final product = values[0];
      final iban = values[1];
      final currency = values[2];
      final transactionDate =
          '${values[3].substring(6, 10)}${values[3].substring(3, 5)}${values[3].substring(0, 2)}';
      final accountingDate =
          '${values[4].substring(6, 10)}${values[4].substring(3, 5)}${values[4].substring(0, 2)}';
      final valueDate =
          '${values[5].substring(6, 10)}${values[5].substring(3, 5)}${values[5].substring(0, 2)}';
      final description1 = values[6];
      final description2 = values[7];
      final description3 = values[8];
      final transactionId = values[9];
      final debitAmount = values[10].replaceAll(',', '.').replaceAll(' ', '');
      final creditAmount = values[11].replaceAll(',', '.').replaceAll(' ', '');
      final transactionAmount =
          values[12].replaceAll(',', '.').replaceAll(' ', '');
      final type = values[13];
      final extraInfo = values[14];

      // insert into the moor database
      await BlocProvider.of<HowMuchAppBloc>(context).insertTransaction(
        product,
        iban,
        transactionId,
        description1,
        description2,
        description3,
        currency,
        extraInfo,
        DateTime.parse(valueDate),
        DateTime.parse(transactionDate),
        DateTime.parse(accountingDate),
        1, //type,
        double.parse(debitAmount.isEmpty ? '0' : debitAmount),
        double.parse(creditAmount.isEmpty ? '0' : creditAmount),
        double.parse(transactionAmount.isEmpty ? '0' : transactionAmount),
      );
    }
  }

  Future<void> _deleteAllTransactions() async {
    await BlocProvider.of<HowMuchAppBloc>(context).deleteAllTransactions();
  }

  // void _clearCachedFiles() {
  //   FilePicker.platform.clearTemporaryFiles().then((result) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         backgroundColor: result ? Colors.green : Colors.red,
  //         content: Text((result
  //             ? 'Temporary files removed with success.'
  //             : 'Failed to clean temporary files')),
  //       ),
  //     );
  //   });
  // }

  // void _selectFolder() {
  //   FilePicker.platform.getDirectoryPath().then((value) {
  //     setState(() => _directoryPath = value);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(
          top: widget.screenSize.height / 20,
          left: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 15
              : widget.screenSize.width / 5,
          right: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 15
              : widget.screenSize.width / 5,
        ),
        child: ResponsiveWidget.isSmallScreen(context)
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    // Padding(
                    // padding: EdgeInsets.only(
                    // top: 0), //widget.screenSize.height / 60),
                    // child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: _openFileExplorer,
                          child: const Text('Download a file'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Builder(
                            builder: (BuildContext context) => _loadingPath
                                ? const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: CircularProgressIndicator(),
                                  )
                                : _paths != null
                                    ? Text(_fileName)
                                    //Text(_fileName),
                                    //ElevatedButton(
                                    //     onPressed: () => _clearCachedFiles(),
                                    //     child: const Text("Clear"),
//                           ),
                                    : const SizedBox(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: IconButton(
                            onPressed: _deleteAllTransactions,
                            icon: const Icon(
                              LineAwesomeIcons.trash,
                              size: 16,
                            ),
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
                    // ),
                    // Builder(
                    //   builder: (BuildContext context) => _loadingPath
                    //       ? Padding(
                    //           padding: const EdgeInsets.only(left: 10.0),
                    //           child: const CircularProgressIndicator(),
                    //         )
                    //       : _directoryPath != null
                    //           ? ListTile(
                    //               title: const Text('Directory path'),
                    //               subtitle: Text(_directoryPath),
                    //             )
                    //           : _paths != null
                    //               ? Container(
                    //                   padding:
                    //                       const EdgeInsets.only(bottom: 30.0),
                    //                   height:
                    //                       MediaQuery.of(context).size.height *
                    //                           0.50,
                    //                   child: Scrollbar(
                    //                       child: ListView.separated(
                    //                     itemCount:
                    //                         _paths != null && _paths.isNotEmpty
                    //                             ? _paths.length
                    //                             : 1,
                    //                     itemBuilder:
                    //                         (BuildContext context, int index) {
                    //                       // final bool isMultiPath =
                    //                       //     _paths != null &&
                    //                       //         _paths.isNotEmpty;
                    //                       final String
                    //                           name = //'File $index: ' +
                    //                           // (isMultiPath
                    //                           //     ? _paths
                    //                           //         .map((e) => e.name)
                    //                           //         .toList()[index]
                    //                           //     :
                    //                           _fileName
                    //                           //?? '...')
                    //                           ;
                    //                       // final path = _paths
                    //                       //     .map((e) => e.path)
                    //                       //     .toList()[index]
                    //                       //     .toString();

                    //                       return ListTile(
                    //                         title: Text(
                    //                           name,
                    //                         ),
                    //                         //subtitle: Text(path),
                    //                       );
                    //                     },
                    //                     separatorBuilder:
                    //                         (BuildContext context, int index) =>
                    //                             const Divider(),
                    //                   )),
                    //                 )
                    //               : const SizedBox(),
                    // ),
                  ],
                ),
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
                          onPressed: _openFileExplorer,
                          child: const Text('Download a file'),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(left: 10),
                        //   child: ElevatedButton(
                        //     onPressed: () => _clearCachedFiles(),
                        //     child: const Text("Clear"),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

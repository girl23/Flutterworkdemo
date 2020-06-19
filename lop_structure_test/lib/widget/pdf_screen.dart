import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fullpdfview/flutter_fullpdfview.dart';
class PDFScreen extends StatefulWidget {
  final String path;
  PDFScreen({Key key, this.path}) : super(key: key);
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  String pathPDF ='';//"/Users/zhouli/Library/Developer/CoreSimulator/Devices/13A1161B-0EE7-42E7-88DE-29843854118C/data/Containers/Data/Application/BAC62998-9D1D-43C2-A4C7-8E4857BB16A6/Documents/sample177.pdf";
  int pages = 0;//总页数
  int currentPage=0;
  TextEditingController pageTFController=new TextEditingController();

  bool isReady = false;
  String errorMessage = '';
  GlobalKey pdfKey = GlobalKey();

  Future<File> createFileOfPdfUrl(String pdfUrl) async {


    final url =pdfUrl; //"https://pdfkit.org/docs/guide.pdf";
    final filename = url.substring(url.lastIndexOf("/") + 1);

    //检查本地是否已存在当前文件,如果存在返回已存在的文件
    var localDir = await getApplicationDocumentsDirectory();
    File localFile = File("${localDir.path}/$filename");
    var dirBool=await localFile.exists(); //返回真假
    if(dirBool){
      return localFile;
    }

    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }

  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();
    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);

    } catch (e) {
      throw Exception('=========Error parsing asset file!');
    }
    return completer.future;
  }
  @override
  void initState() {

    // TODO: implement initState
//    fromAsset('assets/sample177.pdf', 'sample177.pdf').then((f) {
//      setState(() {
//        pathPDF = f.path;
//      });
//    });
    createFileOfPdfUrl(widget.path).then((f){
      setState(() {
        pathPDF=f.path;
      });
    });
    super.initState();
  }
  @override
  void didUpdateWidget(PDFScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('updating');
  }
  @override
  Widget build(BuildContext context) {
    final Completer<PDFViewController> _controller =
    Completer<PDFViewController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Document"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            child: pathPDF==""?Container(color: Colors.white,): PDFView(
              key: pdfKey,
              filePath: pathPDF,//widget.path,
              fitEachPage: true,
              fitPolicy: FitPolicy.BOTH,
              dualPageMode: false,
              enableSwipe: true,
              swipeHorizontal: true,
              autoSpacing: true,
              pageFling: true,
              defaultPage: 0,
              pageSnap: true,
              backgroundColor: bgcolors.WHITE,
              onRender: (_pages) {
                print("OK RENDERED!!!!!");
                setState(() {
                  pages = _pages;
                  isReady = true;
                });
              },
              onError: (error) {
                setState(() {
                  errorMessage = error.toString();
                });
                print(error.toString());
              },
              onPageError: (page, error) {
                setState(() {
                  errorMessage = '$page: ${error.toString()}';
                });
                print('$page: ${error.toString()}');
              },
              onViewCreated: (PDFViewController pdfViewController) {
                _controller.complete(pdfViewController);
              },
              onPageChanged: (int page, int total) {
                print('page change: $page/$total');
                currentPage=page;
              },
            ),
          ),
          Positioned(child: Container(color: Colors.blue,child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: FutureBuilder<PDFViewController>(
                  future: _controller.future,
                  builder: (context, AsyncSnapshot<PDFViewController> snapshot){
                    return  RaisedButton(
                      onPressed: ()async {
                        currentPage=0;
                        await snapshot.data.setPage(currentPage).then((f){
                          print('isrest$currentPage+$f');
                        });
                      },
                      child: Text('首页'),
                      textColor: Colors.black,
                      elevation: 2,
                    );
                  }), ),
              Expanded(
                flex: 3,
                child: FutureBuilder<PDFViewController>(
                  future: _controller.future,
                  builder: (context, AsyncSnapshot<PDFViewController> snapshot){
                    return RaisedButton(
                      onPressed: ()async {
                        if(currentPage==0){
                          currentPage=0;
                        }else{
                          currentPage--;
                        }
                        await snapshot.data.setPage(currentPage).then((f){
                          print('isrest$currentPage+$f');
                        });
                      },
                      child: Text('上翻'),
                      textColor: Colors.black,
                      elevation: 2,
                    );
                  }),),
              Expanded(
                flex: 3,
                child: FutureBuilder<PDFViewController>(
                  future: _controller.future,
                  builder: (context, AsyncSnapshot<PDFViewController> snapshot){
                    return RaisedButton(
                      onPressed: ()async {
                        if(currentPage==pages-1){
                          currentPage=pages-1;
                        }else{
                          currentPage++;
                        }
                        await snapshot.data.setPage(currentPage).then((f){
                          print('isrest$currentPage+$f');
                        });
                      },
                      child: Text('下翻'),
                      textColor: Colors.black,
                      elevation: 2,
                    );
                  }),),
              Expanded(
                flex: 3,
                child: FutureBuilder<PDFViewController>(
                  future: _controller.future,
                  builder: (context, AsyncSnapshot<PDFViewController> snapshot){
                    return
                      RaisedButton(
                        onPressed: ()async {
                          currentPage=pages;
                          await snapshot.data.setPage(currentPage-1).then((f){
                            print('isrest$currentPage+$f');
                          });
                        },
                        child: Text('尾页'),
                        textColor: Colors.black,
                        elevation: 2,
                      );
                  }),),
              Expanded(
                  flex: 2,
                  child: Container(
                    height: 35,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child:  TextField(
                      keyboardType:TextInputType.number,
                      decoration: new InputDecoration(
                        enabledBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1,
                            )
                        ),
                      ),
                      controller: pageTFController,
                    ),
                  )
              ),
              Expanded(
                flex: 3,
                child: FutureBuilder<PDFViewController>(
                  future: _controller.future,
                  builder: (context, AsyncSnapshot<PDFViewController> snapshot){
                    return  RaisedButton(
                      onPressed: ()async {
                        String tFPage=pageTFController.text;
                        RegExp exp = RegExp(
                            r'^[0-9]*$');
                        bool matched = exp.hasMatch(tFPage);
                        if(matched){
                          currentPage=int.parse(tFPage);
                          await snapshot.data.setPage(currentPage).then((f){
                            print('isrest$currentPage+$f');
                          });
                        }
                      },
                      child: Text('跳转'),
                      textColor: Colors.black,
                      elevation: 2,
                    );
                  }),),
            ],
          ),),
            bottom: 40,
            right: 2,
            left: 2,
          ),

          errorMessage.isEmpty
              ? !isReady
              ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
              valueColor:  new AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          )
              : Container()
              : Center(child: Text(errorMessage))
        ],
      ),
    );
  }
}

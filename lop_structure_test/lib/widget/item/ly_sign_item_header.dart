import 'package:flutter/material.dart';
import 'package:image_pickers/Media.dart';
import 'package:image_pickers/UIConfig.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:lopstructuretest/provider/sign_item_provider.dart';
import 'package:lopstructuretest/widget/item/ly_image_gallery.dart';
import 'package:lopstructuretest/widget/sheetwidget/sheet_widget.dart';
import 'package:lopstructuretest/widget/sheetwidget/sheet_widget_item.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class LySignItemHeader extends StatefulWidget {
  final itemData;
  final double width;
  const LySignItemHeader({Key key, this.itemData,this.width}) : super(key: key);

  @override
  _LySignItemHeaderState createState() => _LySignItemHeaderState();
}

class _LySignItemHeaderState extends State<LySignItemHeader> {

  bool _isNormalCheck = false;
  bool _isNaCheck = false;
  bool _isShowImages =false;
  bool _isShowPdfs =false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isNaCheck = Provider.of<SingItemProvider>(context,listen: false).naChecks.contains(widget.itemData["itemId"]);
    _isNormalCheck = Provider.of<SingItemProvider>(context,listen: false).normalChecks.contains(widget.itemData["itemId"]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width == 0?MediaQuery.of(context).size.width:widget.width,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Offstage(
                offstage: widget.itemData["images"].isEmpty,
                child: IconButton(
                  onPressed: (){
                    setState(() {
                      _isShowImages = !_isShowImages;
                    });
                  },
                  icon: Icon(Icons.image),
                ),
              ),
              Offstage(
                offstage: !widget.itemData["takePic"],
                child: IconButton(
                  onPressed: (){
                    SheetWidget sw = SheetWidget(context,
                      18,
                      itemHeight: 40,
                      children: <SheetWidgetItem>[
                        //拍照
                        SheetWidgetItem("拍照", () async {
                          await ImagePickers.openCamera().then((Media media) {
                            /// media 包含照片路径信息 Include photo path information
                          });
                        },textColor: Colors.black45),
                        //相册
                        SheetWidgetItem("相册", () async {
                          List<Media> _listImagePaths = await ImagePickers.pickerPaths(
                              galleryMode: GalleryMode.image,
                              selectCount: 9,
                              showCamera: false,
                              compressSize: 500,
                              uiConfig:
                              UIConfig(uiThemeColor: Theme
                                  .of(context)
                                  .primaryColor));
                        },textColor: Colors.black45),
                      ],

                    );
                    sw.showSheet();
                  },
                  icon: Icon(Icons.camera_alt),
                ),
              ),
              Offstage(
                offstage: widget.itemData["pdfs"].isEmpty,
                child: IconButton(
                  onPressed: (){
                    setState(() {
                      _isShowPdfs = !_isShowPdfs;
                    });
                  },
                  icon: Icon(Icons.link),
                ),
              ),
              MaterialButton(
                onPressed: (){
                  print("选择Na");
                  setState(() {
                    _isNormalCheck = false;
                    _isNaCheck = !_isNaCheck;
                    Provider.of<SingItemProvider>(context,listen: false).naCheckedChange(widget.itemData["itemId"], _isNaCheck);
                  });
                },
                color: _isNaCheck?Colors.deepOrange:Colors.blue,
                highlightColor: Colors.lightBlueAccent,
                child: Text(_isNaCheck?"取消选择":"N/A"),
              ),
              MaterialButton(
                onPressed: (){
                  print("选择一般确认");
                  setState(() {
                    _isNaCheck = false;
                    _isNormalCheck = !_isNormalCheck;
                    Provider.of<SingItemProvider>(context,listen: false).normalCheckedChange(widget.itemData["itemId"], _isNormalCheck);
                  });
                },
                color: _isNormalCheck?Colors.deepOrange:Colors.blue,
                highlightColor: Colors.lightBlueAccent,
                child: Text(_isNormalCheck?"取消选择":"确认"),
              ),
            ],
          ),
          Offstage(
            offstage: !_isShowImages,
            child:  LyImageGallery(imageList: widget.itemData["images"],),
          ),
          Offstage(
            offstage: !_isShowPdfs,
            child:  ListView.builder(
              shrinkWrap: true,
              itemCount: widget.itemData["pdfs"].length,
             itemBuilder: (context,index){
               var value = widget.itemData["pdfs"][index];
               return ListTile(
                 onTap: ()async{
                   if (await canLaunch(value["link"])) {
                     await launch(value["link"], forceSafariVC: false);
                   } else {
                     throw 'Could not launch $value["link"]';
                   }
                 },
                 title: Text(value["text"]),
               );
             },
            ),
          ),

        ],
      )
    );
  }
  List<Widget> _buildPdfs(BuildContext context){
    List<Widget> items = List();
    for(int i=0; i < widget.itemData["pdfs"].length;i++ ){
      var value = widget.itemData["pdfs"][i];
      items.add( ListTile(
        onTap: ()async{
          if (await canLaunch(value["link"])) {
            await launch(value["link"], forceSafariVC: false);
          } else {
            throw 'Could not launch $value["link"]';
          }
        },
        title: Text(value["text"]),
      ));
    }
    return items;
  }
}

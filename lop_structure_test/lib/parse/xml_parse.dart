import 'dart:convert';
import 'dart:math';

import 'package:lopstructuretest/parse/constans.dart';
import 'package:xml/xml.dart';
import 'package:xml2json/xml2json.dart';
class XMLParse{
 
  static XmlDocument xmlParse(xmlStr){
    return parse(xmlStr);
  }
  static void xml2Json(xmlStr){
    var myTransformer = Xml2Json();
    myTransformer.parse(xmlStr);
    print(jsonDecode(myTransformer.toBadgerfish()));
//    print(myTransformer.toBadgerfish());
    
  }
  static void findAllElements(xmlStr){
    XmlDocument document = xmlParse(xmlStr);
    print("children size:${document.children.length} | ${document.children}");
    Iterable<XmlElement> xmlElements = document.getAllElements();
    xmlElements.forEach((element){
      print("name:${element.name} | descendants.length:${element.descendants.length} "
          "| depth:${element.depth} | attributes:${element.attributes} | nodeType:${element.nodeType}"
          " | ");
    });
  }
  static void findAllElementsRecursion(xmlStr){
    XmlDocument document = xmlParse(xmlStr);

    print("children size:${document.children.length} | ${document.children}");
    Iterable<XmlElement> xmlElements = document.getAllElements();
    xmlElements.forEach((element){
      print("name:${element.name} | descendants.length:${element.descendants.length} "
          "| depth:${element.depth} | attributes:${element.attributes} | nodeType:${element.nodeType}"
          " | ");
    });
  }
  static void findAllElementsByName(xmlStr,name){
    XmlDocument document = xmlParse(xmlStr);
    Iterable<XmlElement> xmlElements = document.findAllElements(name);
    xmlElements.forEach((element){
      print("name:${element.name} | descendants.length:${element.descendants.length} "
          "| depth:${element.depth} | attributes:${element.attributes} | nodeType:${element.nodeType}"
          " | hasParent:${element.hasParent} | text:${element.text}");
    });
  }
}

//void main(){
////  print(XMLParse.xmlParse(Constants.XML_STR).toString());
//  //XMLParse.xml2Json(Constants.XML_STR);
////  XMLParse.findAllElements(Constants.XML_STR);
//  //XMLParse.findAllElementsByName(Constants.XML_STR,"table");
//}
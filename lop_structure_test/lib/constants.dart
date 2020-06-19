import 'dart:ui';
import 'package:flutter/material.dart';

class Constants {
  static const singItemData = [
    {
      "type": "text",
      "lan": "zh",
      "zhText": "我是中国人！",
      "textFont": FontWeight.w600,
      "textColor": Colors.black87
    },
    {
      "type": "text",
      "lan": "zh",
      "zhText": "我是中国人！",
      "textFont": FontWeight.w600,
      "textColor": Colors.black87
    },
    {"type": "input", "textFont": FontWeight.w600, "textColor": Colors.green},
    {
      "type": "text",
      "lan": "zh",
      "zhText": "我爱我的祖国！我爱我的祖国！我爱我的祖国！",
      "enText": "I love my country!!!I love my country!!!I love my country!!!",
      "textFont": FontWeight.w600,
      "textColor": Colors.black87
    },
    {
      "type": "image",
      "imageUrl":
          "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=858329114,1036550300&fm=26&gp=0.jpg"
    },
    {
      "type": "text",
      "lan": "zh",
      "zhText":
          "我爱我的祖国！我爱我的祖国！我爱我的祖国！我爱我的祖国！我爱我的祖国！我爱我的祖国！我爱我的祖国！我爱我的祖国！我爱我的祖国！我爱我的祖国！我爱我的祖国！我爱我的祖国！",
      "textFont": FontWeight.w600,
      "textColor": Colors.black87
    },
    {
      "type": "text",
      "lan": "en",
      "enText": "I am Chinese!!!",
      "textFont": FontWeight.w600,
      "textColor": Colors.black87
    },
    {
      "type": "text",
      "lan": "en",
      "enText": "I am Chinese!!!",
      "textFont": FontWeight.w600,
      "textColor": Colors.black87
    },
    {
      "type": "text",
      "lan": "en",
      "enText": "I love my country!!!I love my country!!!I love my country!!!",
      "textFont": FontWeight.w600,
      "textColor": Colors.black87
    },
    {
      "type": "text",
      "lan": "en",
      "enText":
          "I love my country!!!I love my country!!!I love my country!!!I love my country!!!I love my country!!!I love my country!!!I love my country!!!I love my country!!!I love my country!!!I love my country!!!I love my country!!!I love my country!!!",
      "textFont": FontWeight.w600,
      "textColor": Colors.black87
    }
  ];
  static const MOUDLES = [
    {
      "moudleId": 101,
      "moudleTitle": "接机任务",
    },
    {
      "moudleId": 102,
      "moudleTitle": "放行任务",
    },
    {
      "moudleId": 103,
      "moudleTitle": "维修任务",
    },
    {
      "moudleId": 104,
      "moudleTitle": "送机任务",
    },
  ];
  static const MOUDLES1 = ["接机任务", "放行任务", "维修任务", "送机任务"];
  static const PROCESSES = [
    {
      "moudleId": 101,
      "moudleTitle": "接机任务",
      "processes": [
        {
          "processId": 1011,
          "processTitle": "接机任务-任务1",
        },
        {
          "processId": 1012,
          "processTitle": "接机任务-任务2",
        },
        {
          "processId": 1013,
          "processTitle": "接机任务-任务3",
        },
        {
          "processId": 1014,
          "processTitle": "接机任务-任务4",
        }
      ]
    },
    {
      "moudleId": 102,
      "moudleTitle": "放行任务",
      "processes": [
        {
          "processId": 1021,
          "processTitle": "放行任务-任务1",
        },
        {
          "processId": 1022,
          "processTitle": "放行任务-任务2",
        },
        {
          "processId": 1023,
          "processTitle": "放行任务-任务3",
        },
        {
          "processId": 1024,
          "processTitle": "放行任务-任务4",
        }
      ]
    },
    {
      "moudleId": 103,
      "moudleTitle": "维修任务",
      "processes": [
        {
          "processId": 1031,
          "processTitle": "维修任务-任务1",
        },
        {
          "processId": 1032,
          "processTitle": "维修任务-任务2",
        },
        {
          "processId": 1033,
          "processTitle": "维修任务-任务3",
        },
        {
          "processId": 1034,
          "processTitle": "维修任务-任务4",
        }
      ]
    },
    {
      "moudleId": 104,
      "moudleTitle": "放机任务",
      "processes": [
        {
          "processId": 1041,
          "processTitle": "放机任务-任务1",
        },
        {
          "processId": 1042,
          "processTitle": "放机任务-任务2",
        },
        {
          "processId": 1043,
          "processTitle": "放机任务-任务3",
        },
        {
          "processId": 1044,
          "processTitle": "放机任务-任务4",
        }
      ]
    }
  ];
  static const PROCESSES1 = [
    ["接机任务-任务1", "接机任务-任务2", "接机任务-任务3", "接机任务-任务4"],
    ["放行任务-任务1", "放行任务-任务2", "放行任务-任务3", "放行任务-任务4"],
    ["维修任务-任务1", "维修任务-任务2", "维修任务-任务3", "维修任务-任务4"],
    ["送机任务-任务1", "送机任务-任务2", "送机任务-任务3", "送机任务-任务4"]
  ];
  static const itemData = {
    "textZh": {
      "type": "text",
      "lan": "zh",
      "text": "我是中国人！我是中国人！我是中国人！我是中国人！我是中国人！",
      "textFont": FontWeight.w600,
      "textColor": Colors.black87
    },
    "input": {
      "type": "input",
      "textFont": FontWeight.w600,
      "textColor": Colors.green
    },
    "image": {
      "type": "image",
      "imageUrl":
          "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=858329114,1036550300&fm=26&gp=0.jpg"
    },
    "textEn": {
      "type": "text",
      "lan": "en",
      "text":
          "I am Chinese!!!I am Chinese!!!I am Chinese!!!I am Chinese!!!I am Chinese!!!",
      "textFont": FontWeight.w600,
      "textColor": Colors.black87
    },
    "radio": {
      "type": "radio",
      "stringList": ["是的", "不是", "无所谓", "可以有"]
    },
    "check": {
      "type": "check",
      "stringList": ["是的", "不是"]
    },
    "expandable": {
      "type": "expandabletext",
      "text":
          "啦啦啦，啦啦啦，我是卖报的小行家，不等天明去等派报，一面走，一面叫，今天的新闻真正好，七个铜板就买两份报。啦啦啦，啦啦啦，我是卖报的小行家，大风大雨里满街跑",
    }
  };

  static List itemDatas = [
    {
      "moudleId": 101,
      "processId": 1011,
      "processName": "接机任务-任务1",
      "items": [
        {
          "itemId": 10111,
          "itemTitle": "接机任务-接机任务1-条目1",
          "takePic": false,
          "pdfs": [],
          "images": [],
          "datas": [
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["radio"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["input"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["image"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
          ]
        },
        {
          "itemId": 10112,
          "itemTitle": "接机任务-接机任务1-条目2",
          "takePic": true,
          "pdfs": [
            {"text": "手册1", "link": "https://pdfkit.org/docs/guide.pdf"},
            {"text": "手册2", "link": "https://pdfkit.org/docs/guide.pdf"}
          ],
          "images": [],
          "datas": [
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["input"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["image"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
          ]
        },
        {
          "itemId": 10113,
          "itemTitle": "接机任务-接机任务1-条目3",
          "takePic": true,
          "pdfs": [
            {"text": "手册1", "link": "https://pdfkit.org/docs/guide.pdf"},
            {"text": "手册2", "link": "https://pdfkit.org/docs/guide.pdf"}
          ],
          "images": [
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
          ],
          "datas": [
            itemData["textZh"],
            itemData["textZh"],
            itemData["radio"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["expandable"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["input"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["image"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
          ]
        }
      ],
    },
    {
      "moudleId": 101,
      "processId": 1012,
      "processName": "接机任务-任务2",
      "items": [
        {
          "itemId": 10121,
          "itemTitle": "接机任务-接机任务2-条目1",
          "takePic": true,
          "pdfs": [],
          "images": [
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
          ],
          "datas": [
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["check"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["input"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["image"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
          ]
        },
        {
          "itemId": 10122,
          "itemTitle": "接机任务-接机任务2-条目2",
          "takePic": true,
          "pdfs": [
            {"text": "手册1", "link": "https://pdfkit.org/docs/guide.pdf"},
            {"text": "手册2", "link": "https://pdfkit.org/docs/guide.pdf"}
          ],
          "images": [
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
          ],
          "datas": [
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["expandable"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["check"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["input"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["image"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
          ]
        },
        {
          "itemId": 10123,
          "itemTitle": "接机任务-接机任务2-条目3",
          "takePic": true,
          "pdfs": [
            {"text": "手册1", "link": "https://pdfkit.org/docs/guide.pdf"},
            {"text": "手册2", "link": "https://pdfkit.org/docs/guide.pdf"}
          ],
          "images": [
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
          ],
          "datas": [
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["input"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["image"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
          ]
        }
      ]
    },
    {
      "moudleId": 101,
      "processId": 1013,
      "processName": "接机任务-任务3",
      "items": [
        {
          "itemId": 10131,
          "itemTitle": "接机任务-接机任务3-条目1",
          "takePic": true,
          "pdfs": [
            {"text": "手册1", "link": "https://pdfkit.org/docs/guide.pdf"},
            {"text": "手册2", "link": "https://pdfkit.org/docs/guide.pdf"}
          ],
          "images": [
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
          ],
          "datas": [
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["input"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["image"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
          ]
        },
        {
          "itemId": 10132,
          "itemTitle": "接机任务-接机任务3-条目2",
          "takePic": true,
          "pdfs": [
            {"text": "手册1", "link": "https://pdfkit.org/docs/guide.pdf"},
            {"text": "手册2", "link": "https://pdfkit.org/docs/guide.pdf"}
          ],
          "images": [
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
          ],
          "datas": [
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["input"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["image"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
          ]
        },
        {
          "itemId": 10133,
          "itemTitle": "接机任务-接机任务3-条目3",
          "takePic": true,
          "pdfs": [
            {"text": "手册1", "link": "https://pdfkit.org/docs/guide.pdf"},
            {"text": "手册2", "link": "https://pdfkit.org/docs/guide.pdf"}
          ],
          "images": [
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
          ],
          "datas": [
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["input"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["image"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
          ]
        }
      ]
    },
    {
      "moudleId": 102,
      "processId": 1021,
      "processName": "放行任务-任务1",
      "items": [
        {
          "itemId": 10211,
          "itemTitle": "放行任务-放行任务1-条目1",
          "takePic": true,
          "pdfs": [
            {"text": "手册1", "link": "https://pdfkit.org/docs/guide.pdf"},
            {"text": "手册2", "link": "https://pdfkit.org/docs/guide.pdf"}
          ],
          "images": [
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
          ],
          "datas": [
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["input"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["image"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
          ]
        },
        {
          "itemId": 10212,
          "itemTitle": "放行任务-放行任务1-条目2",
          "takePic": true,
          "pdfs": [
            {"text": "手册1", "link": "https://pdfkit.org/docs/guide.pdf"},
            {"text": "手册2", "link": "https://pdfkit.org/docs/guide.pdf"}
          ],
          "images": [
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
          ],
          "datas": [
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["input"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["image"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
          ]
        },
        {
          "itemId": 10213,
          "itemTitle": "放行任务-放行任务1-条目3",
          "takePic": true,
          "pdfs": [
            {"text": "手册1", "link": "https://pdfkit.org/docs/guide.pdf"},
            {"text": "手册2", "link": "https://pdfkit.org/docs/guide.pdf"}
          ],
          "images": [
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
          ],
          "datas": [
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["input"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["image"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
          ]
        }
      ]
    },
    {
      "moudleId": 102,
      "processId": 1022,
      "processName": "放行任务-任务2",
      "items": [
        {
          "itemId": 10221,
          "itemTitle": "放行任务-放行任务2-条目1",
          "takePic": true,
          "pdfs": [
            {"text": "手册1", "link": "https://pdfkit.org/docs/guide.pdf"},
            {"text": "手册2", "link": "https://pdfkit.org/docs/guide.pdf"}
          ],
          "images": [
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
          ],
          "datas": [
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["input"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["image"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
          ]
        },
        {
          "itemId": 10222,
          "itemTitle": "放行任务-放行任务2-条目2",
          "takePic": true,
          "pdfs": [
            {"text": "手册1", "link": "https://pdfkit.org/docs/guide.pdf"},
            {"text": "手册2", "link": "https://pdfkit.org/docs/guide.pdf"}
          ],
          "images": [
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
          ],
          "datas": [
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["input"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["image"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
          ]
        },
        {
          "itemId": 10223,
          "itemTitle": "放行任务-放行任务2-条目3",
          "takePic": true,
          "pdfs": [
            {"text": "手册1", "link": "https://pdfkit.org/docs/guide.pdf"},
            {"text": "手册2", "link": "https://pdfkit.org/docs/guide.pdf"}
          ],
          "images": [
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
          ],
          "datas": [
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["input"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["image"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
          ]
        }
      ]
    },
    {
      "moudleId": 102,
      "processId": 1023,
      "processName": "放行任务-任务2",
      "items": [
        {
          "itemId": 10231,
          "itemTitle": "放行任务-放行任务3-条目1",
          "takePic": true,
          "pdfs": [
            {"text": "手册1", "link": "https://pdfkit.org/docs/guide.pdf"},
            {"text": "手册2", "link": "https://pdfkit.org/docs/guide.pdf"}
          ],
          "images": [
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
          ],
          "datas": [
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["input"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["image"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
          ]
        },
        {
          "itemId": 10232,
          "itemTitle": "放行任务-放行任务3-条目2",
          "takePic": true,
          "pdfs": [
            {"text": "手册1", "link": "https://pdfkit.org/docs/guide.pdf"},
            {"text": "手册2", "link": "https://pdfkit.org/docs/guide.pdf"}
          ],
          "images": [
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
          ],
          "datas": [
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["input"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["image"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
          ]
        },
        {
          "itemId": 10233,
          "itemTitle": "放行任务-放行任务3-条目3",
          "takePic": true,
          "pdfs": [
            {"text": "手册1", "link": "https://pdfkit.org/docs/guide.pdf"},
            {"text": "手册2", "link": "https://pdfkit.org/docs/guide.pdf"}
          ],
          "images": [
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
          ],
          "datas": [
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["input"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["image"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
          ]
        }
      ]
    },
    {
      "moudleId": 103,
      "processId": 1031,
      "processName": "维修任务-任务1",
      "items": [
        {
          "itemId": 10311,
          "itemTitle": "维修任务-维修任务1-条目1",
          "takePic": true,
          "pdfs": [
            {"text": "手册1", "link": "https://pdfkit.org/docs/guide.pdf"},
            {"text": "手册2", "link": "https://pdfkit.org/docs/guide.pdf"}
          ],
          "images": [
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
          ],
          "datas": [
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["input"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["image"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
          ]
        },
        {
          "itemId": 10312,
          "itemTitle": "维修任务-维修任务1-条目2",
          "takePic": true,
          "pdfs": [
            {"text": "手册1", "link": "https://pdfkit.org/docs/guide.pdf"},
            {"text": "手册2", "link": "https://pdfkit.org/docs/guide.pdf"}
          ],
          "images": [
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
          ],
          "datas": [
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["input"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["image"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
          ]
        },
        {
          "itemId": 10313,
          "itemTitle": "维修任务-维修任务1-条目3",
          "takePic": true,
          "pdfs": [
            {"text": "手册1", "link": "https://pdfkit.org/docs/guide.pdf"},
            {"text": "手册2", "link": "https://pdfkit.org/docs/guide.pdf"}
          ],
          "images": [
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
          ],
          "datas": [
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["input"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["image"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
          ]
        }
      ]
    },
    {
      "moudleId": 103,
      "processId": 1032,
      "processName": "维修任务-任务2",
      "items": [
        {
          "itemId": 10321,
          "itemTitle": "维修任务-维修任务2-条目1",
          "takePic": true,
          "pdfs": [
            {"text": "手册1", "link": "https://pdfkit.org/docs/guide.pdf"},
            {"text": "手册2", "link": "https://pdfkit.org/docs/guide.pdf"}
          ],
          "images": [
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
          ],
          "datas": [
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["input"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["image"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
          ]
        },
        {
          "itemId": 10322,
          "itemTitle": "维修任务-维修任务2-条目2",
          "takePic": true,
          "pdfs": [
            {"text": "手册1", "link": "https://pdfkit.org/docs/guide.pdf"},
            {"text": "手册2", "link": "https://pdfkit.org/docs/guide.pdf"}
          ],
          "images": [
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
          ],
          "datas": [
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["input"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["image"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
          ]
        },
        {
          "itemId": 10323,
          "itemTitle": "维修任务-维修任务2-条目3",
          "takePic": true,
          "pdfs": [
            {"text": "手册1", "link": "https://pdfkit.org/docs/guide.pdf"},
            {"text": "手册2", "link": "https://pdfkit.org/docs/guide.pdf"}
          ],
          "images": [
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
          ],
          "datas": [
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["input"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["image"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
          ]
        }
      ]
    },
    {
      "moudleId": 103,
      "processId": 1033,
      "processName": "维修任务-任务3",
      "items": [
        {
          "itemId": 10331,
          "itemTitle": "维修任务-维修任务3-条目1",
          "takePic": true,
          "pdfs": [
            {"text": "手册1", "link": "https://pdfkit.org/docs/guide.pdf"},
            {"text": "手册2", "link": "https://pdfkit.org/docs/guide.pdf"}
          ],
          "images": [
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
          ],
          "datas": [
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["input"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["image"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
          ]
        },
        {
          "itemId": 10332,
          "itemTitle": "维修任务-维修任务3-条目2",
          "takePic": true,
          "pdfs": [
            {"text": "手册1", "link": "https://pdfkit.org/docs/guide.pdf"},
            {"text": "手册2", "link": "https://pdfkit.org/docs/guide.pdf"}
          ],
          "images": [
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
          ],
          "datas": [
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["input"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["image"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
          ]
        },
        {
          "itemId": 10333,
          "itemTitle": "维修任务-维修任务3-条目3",
          "takePic": true,
          "pdfs": [
            {"text": "手册1", "link": "https://pdfkit.org/docs/guide.pdf"},
            {"text": "手册2", "link": "https://pdfkit.org/docs/guide.pdf"}
          ],
          "images": [
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
          ],
          "datas": [
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["textZh"],
            itemData["input"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["image"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
            itemData["textEn"],
          ]
        }
      ]
    },
  ];

  static List itemDatas1 = [
    {
      "moudleId": 101,
      "processId": 1011,
      "itemId": 10111,
      "itemTitle": "接机任务-接机任务1-条目1",
      "takePic": false,
      "pdfs": [],
      "images": [],
      "datas": [
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["radio"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["input"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["image"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
      ]
    },
    {
      "moudleId": 101,
      "processId": 1011,
      "itemId": 10112,
      "itemTitle": "接机任务-接机任务1-条目2",
      "takePic": true,
      "pdfs": [
        {
          "text": "手册1",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        },
        {
          "text": "手册2",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        }
      ],
      "images": [],
      "datas": [
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["input"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["image"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
      ]
    },
    {
      "moudleId": 101,
      "processId": 1011,
      "itemId": 10113,
      "itemTitle": "接机任务-接机任务1-条目3",
      "takePic": true,
      "pdfs": [
        {
          "text": "手册1",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        },
        {
          "text": "手册2",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        }
      ],
      "images": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
      ],
      "datas": [
        itemData["textZh"],
        itemData["textZh"],
        itemData["radio"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["expandable"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["input"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["image"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
      ]
    },
    {
      "moudleId": 101,
      "processId": 1012,
      "itemId": 10121,
      "itemTitle": "接机任务-接机任务2-条目1",
      "takePic": true,
      "pdfs": [],
      "images": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
      ],
      "datas": [
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["check"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["input"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["image"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
      ]
    },
    {
      "moudleId": 101,
      "processId": 1012,
      "itemId": 10122,
      "itemTitle": "接机任务-接机任务2-条目2",
      "takePic": true,
      "pdfs": [
        {
          "text": "手册1",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        },
        {
          "text": "手册2",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        }
      ],
      "images": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
      ],
      "datas": [
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["expandable"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["check"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["input"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["image"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
      ]
    },
    {
      "moudleId": 101,
      "processId": 1012,
      "itemId": 10123,
      "itemTitle": "接机任务-接机任务2-条目3",
      "takePic": true,
      "pdfs": [
        {
          "text": "手册1",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        },
        {
          "text": "手册2",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        }
      ],
      "images": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
      ],
      "datas": [
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["input"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["image"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
      ]
    },
    {
      "moudleId": 101,
      "processId": 1013,
      "itemId": 10131,
      "itemTitle": "接机任务-接机任务3-条目1",
      "takePic": true,
      "pdfs": [
        {
          "text": "手册1",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        },
        {
          "text": "手册2",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        }
      ],
      "images": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
      ],
      "datas": [
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["input"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["image"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
      ]
    },
    {
      "moudleId": 101,
      "processId": 1013,
      "itemId": 10132,
      "itemTitle": "接机任务-接机任务3-条目2",
      "takePic": true,
      "pdfs": [
        {
          "text": "手册1",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        },
        {
          "text": "手册2",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        }
      ],
      "images": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
      ],
      "datas": [
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["input"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["image"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
      ]
    },
    {
      "moudleId": 101,
      "processId": 1013,
      "itemId": 10133,
      "itemTitle": "接机任务-接机任务3-条目3",
      "takePic": true,
      "pdfs": [
        {
          "text": "手册1",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        },
        {
          "text": "手册2",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        }
      ],
      "images": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
      ],
      "datas": [
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["input"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["image"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
      ]
    },
    {
      "moudleId": 102,
      "processId": 1021,
      "itemId": 10211,
      "itemTitle": "放行任务-放行任务1-条目1",
      "takePic": true,
      "pdfs": [
        {
          "text": "手册1",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        },
        {
          "text": "手册2",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        }
      ],
      "images": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
      ],
      "datas": [
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["input"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["image"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
      ]
    },
    {
      "moudleId": 102,
      "processId": 1021,
      "itemId": 10212,
      "itemTitle": "放行任务-放行任务1-条目2",
      "takePic": true,
      "pdfs": [
        {
          "text": "手册1",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        },
        {
          "text": "手册2",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        }
      ],
      "images": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
      ],
      "datas": [
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["input"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["image"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
      ]
    },
    {
      "moudleId": 102,
      "processId": 1021,
      "itemId": 10213,
      "itemTitle": "放行任务-放行任务1-条目3",
      "takePic": true,
      "pdfs": [
        {
          "text": "手册1",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        },
        {
          "text": "手册2",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        }
      ],
      "images": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
      ],
      "datas": [
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["input"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["image"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
      ]
    },
    {
      "moudleId": 102,
      "processId": 1022,
      "itemId": 10221,
      "itemTitle": "放行任务-放行任务2-条目1",
      "takePic": true,
      "pdfs": [
        {
          "text": "手册1",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        },
        {
          "text": "手册2",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        }
      ],
      "images": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
      ],
      "datas": [
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["input"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["image"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
      ]
    },
    {
      "moudleId": 102,
      "processId": 1022,
      "itemId": 10222,
      "itemTitle": "放行任务-放行任务2-条目2",
      "takePic": true,
      "pdfs": [
        {
          "text": "手册1",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        },
        {
          "text": "手册2",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        }
      ],
      "images": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
      ],
      "datas": [
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["input"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["image"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
      ]
    },
    {
      "moudleId": 102,
      "processId": 1022,
      "itemId": 10223,
      "itemTitle": "放行任务-放行任务2-条目3",
      "takePic": true,
      "pdfs": [
        {
          "text": "手册1",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        },
        {
          "text": "手册2",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        }
      ],
      "images": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
      ],
      "datas": [
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["input"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["image"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
      ]
    },
    {
      "moudleId": 102,
      "processId": 1023,
      "itemId": 10231,
      "itemTitle": "放行任务-放行任务3-条目1",
      "takePic": true,
      "pdfs": [
        {
          "text": "手册1",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        },
        {
          "text": "手册2",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        }
      ],
      "images": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
      ],
      "datas": [
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["input"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["image"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
      ]
    },
    {
      "moudleId": 102,
      "processId": 1023,
      "itemId": 10232,
      "itemTitle": "放行任务-放行任务3-条目2",
      "takePic": true,
      "pdfs": [
        {
          "text": "手册1",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        },
        {
          "text": "手册2",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        }
      ],
      "images": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
      ],
      "datas": [
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["input"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["image"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
      ]
    },
    {
      "moudleId": 102,
      "processId": 1023,
      "itemId": 10233,
      "itemTitle": "放行任务-放行任务3-条目3",
      "takePic": true,
      "pdfs": [
        {
          "text": "手册1",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        },
        {
          "text": "手册2",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        }
      ],
      "images": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
      ],
      "datas": [
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["input"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["image"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
      ]
    },
    {
      "moudleId": 103,
      "processId": 1031,
      "itemId": 10311,
      "itemTitle": "维修任务-维修任务1-条目1",
      "takePic": true,
      "pdfs": [
        {
          "text": "手册1",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        },
        {
          "text": "手册2",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        }
      ],
      "images": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
      ],
      "datas": [
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["input"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["image"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
      ]
    },
    {
      "moudleId": 103,
      "processId": 1031,
      "itemId": 10312,
      "itemTitle": "维修任务-维修任务1-条目2",
      "takePic": true,
      "pdfs": [
        {
          "text": "手册1",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        },
        {
          "text": "手册2",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        }
      ],
      "images": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
      ],
      "datas": [
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["input"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["image"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
      ]
    },
    {
      "moudleId": 103,
      "processId": 1031,
      "itemId": 10313,
      "itemTitle": "维修任务-维修任务1-条目3",
      "takePic": true,
      "pdfs": [
        {
          "text": "手册1",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        },
        {
          "text": "手册2",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        }
      ],
      "images": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
      ],
      "datas": [
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["input"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["image"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
      ]
    },
    {
      "moudleId": 103,
      "processId": 1032,
      "itemId": 10321,
      "itemTitle": "维修任务-维修任务2-条目1",
      "takePic": true,
      "pdfs": [
        {
          "text": "手册1",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        },
        {
          "text": "手册2",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        }
      ],
      "images": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
      ],
      "datas": [
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["input"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["image"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
      ]
    },
    {
      "moudleId": 103,
      "processId": 1032,
      "itemId": 10322,
      "itemTitle": "维修任务-维修任务2-条目2",
      "takePic": true,
      "pdfs": [
        {
          "text": "手册1",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        },
        {
          "text": "手册2",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        }
      ],
      "images": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
      ],
      "datas": [
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["input"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["image"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
      ]
    },
    {
      "moudleId": 103,
      "processId": 1032,
      "itemId": 10323,
      "itemTitle": "维修任务-维修任务2-条目3",
      "takePic": true,
      "pdfs": [
        {
          "text": "手册1",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        },
        {
          "text": "手册2",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        }
      ],
      "images": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
      ],
      "datas": [
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["input"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["image"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
      ]
    },
    {
      "moudleId": 103,
      "processId": 1033,
      "itemId": 10331,
      "itemTitle": "维修任务-维修任务3-条目1",
      "takePic": true,
      "pdfs": [
        {
          "text": "手册1",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        },
        {
          "text": "手册2",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        }
      ],
      "images": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
      ],
      "datas": [
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["input"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["image"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
      ]
    },
    {
      "moudleId": 103,
      "processId": 1033,
      "itemId": 10332,
      "itemTitle": "维修任务-维修任务3-条目2",
      "takePic": true,
      "pdfs": [
        {
          "text": "手册1",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        },
        {
          "text": "手册2",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        }
      ],
      "images": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
      ],
      "datas": [
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["input"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["image"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
      ]
    },
    {
      "moudleId": 103,
      "processId": 1033,
      "itemId": 10333,
      "itemTitle": "维修任务-维修任务3-条目3",
      "takePic": true,
      "pdfs": [
        {
          "text": "手册1",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        },
        {
          "text": "手册2",
          "link":
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
        }
      ],
      "images": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591246881289&di=d325bb0819d57f05f9bd6bfa662ca634&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F64%2F76%2F20300001349415131407760417677.jpg"
      ],
      "datas": [
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["textZh"],
        itemData["input"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["image"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
        itemData["textEn"],
      ]
    }
  ];
}

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/page/widget/empty.dart';
import 'package:flutter_learn/router/router.dart';
import 'package:flutter_learn/router/switch_animation.dart';
import 'package:flutter_learn/utils/toast.dart';

class NavigatorPage extends StatefulWidget {
  NavigatorPage(this.title, {Key key}) : super(key: key);
  final String title;
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('命名路由'),
                      onPressed: () => {
                        //不可以传参数
                        Navigator.pushNamed(context, "/empty")
                      },
                    ),
                    RaisedButton(
                      child: Text('构建路由'),
                      onPressed: () => {
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (BuildContext context) {
                          return new EmptyPage(title: "这是我传的参数");
                        })).then((result) => {
                              if (result != null) {XToast.toast(result)}
                            })
                      },
                    ),
                  ],
                ),
                 ButtonBar(
                  alignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('路由动画'),
                      onPressed: () =>
                          {Navigator.push(context, SlidePageRoute(routeName: "/empty"))},
                    ),
                    RaisedButton(
                      child: Text('fluro跳转'),
                      onPressed: () => {
                        XRouter.router.navigateTo(context,
                            "/web?url=${Uri.encodeComponent("https://www.baidu.com/")}&title=${Uri.encodeComponent("百度")}",
                            transition: TransitionType.fadeIn)
                      },
                    ),
                  ],
                ),
              ],
            )));
  }
}

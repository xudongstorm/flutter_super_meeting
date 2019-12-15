import 'package:flutter/material.dart';

class SuperMeetingCalllogHeadView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SuperMeetingCalllogHeadViewState();
  }
}

class SuperMeetingCalllogHeadViewState extends State<SuperMeetingCalllogHeadView> with SingleTickerProviderStateMixin{

  bool _isExpand = false;
  Animation<double> animation;
  AnimationController controller;

  String _entName = "中移互联网有限公司";
  String _totalDuration = "--";
  String _remainDuration = "--";
  double _headViewHeight;

  _startAnimation(){
  //  print("startAnimation - " + _isExpand.toString());
    if(!_isExpand){
      controller.forward();
    }else{
      controller.reverse();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    _headViewHeight = 45.0;
    animation = Tween(begin: 45.0, end: 196.0).animate(controller)
      ..addListener((){
        print(animation.value);
        setState(() {
          _headViewHeight = animation.value;
        });
      })
      ..addStatusListener((status){
        if(status == AnimationStatus.completed || status == AnimationStatus.dismissed){
          setState(() {
            _isExpand = !_isExpand;
          });
        }
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "超级会议"
        ),
      ),
      body: /*AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child){
          return */Container(
            height: _headViewHeight,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      width: double.infinity,
                      height: 44.0,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            _isExpand ? _entName : "本月剩余"+_remainDuration+"分钟",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                          Offstage(
                            offstage: _isExpand,
                            child: Image.asset("images/ic_arrow_down.png"),
                          )
                        ],
                      )
                    ),
                    onTap: (){
                      if(!_isExpand){
                        _startAnimation();
                      }
                    },
                  ),
                  Offstage(
                    offstage: !_isExpand,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 11.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '本月分钟总数',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromARGB(255, 161, 161, 161)
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 16.0),
                                    child: Text(
                                      _totalDuration,
                                      style: TextStyle(
                                          fontSize: 21.0,
                                          color: Color.fromARGB(255, 13, 108, 249)
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 21.0),
                                    width: 98.0,
                                    height: 32.0,
                                    alignment: Alignment.center,
                                    child: OutlineButton(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(255, 21, 124, 248),
                                            width: 1.0
                                        ),
                                        child: Text(
                                          '企业认证',
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Color.fromARGB(255, 21, 124, 248),
                                          ),
                                        ),
                                        color: Color.fromARGB(12, 21, 124, 248),
                                        onPressed: (){

                                        }
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '本月剩余分钟数',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromARGB(255, 161, 161, 161)
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 16.0),
                                    child: Text(
                                      _remainDuration,
                                      style: TextStyle(
                                          fontSize: 21.0,
                                          color: Color.fromARGB(255, 13, 108, 249)
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 21.0),
                                    width: 98.0,
                                    height: 32.0,
                                    alignment: Alignment.center,
                                    child: OutlineButton(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(255, 21, 124, 248),
                                            width: 1.0
                                        ),
                                        child: Text(
                                          '充值',
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Color.fromARGB(255, 21, 124, 248),
                                          ),
                                        ),
                                        color: Color.fromARGB(12, 21, 124, 248),
                                        onPressed: (){

                                        }
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            alignment: Alignment.center,
                            child: Image.asset("images/ic_arrow_upward.png"),
                          ),
                          onTap: (){
                            if(_isExpand){
                              _startAnimation();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1.0,
                    color: Color.fromARGB(255, 241, 241, 241),
                  )
                ],
              ),
            )
          ),
      //  },
      );
  //  );
  }
}

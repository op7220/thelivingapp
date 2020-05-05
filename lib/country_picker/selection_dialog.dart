
import 'package:country_code_picker/country_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterlivingapp/styles/constant_values.dart';
/// selection dialog used for selection of the country code
class SelectionDialog extends StatefulWidget {
  final List<CountryCode> elements;
  final bool showCountryOnly;
  final InputDecoration searchDecoration;
  final TextStyle searchStyle;
  final WidgetBuilder emptySearchBuilder;

  /// elements passed as favorite
  final List<CountryCode> favoriteElements;

  SelectionDialog(this.elements, this.favoriteElements, {
    Key key,
    this.showCountryOnly,
    this.emptySearchBuilder,
    InputDecoration searchDecoration = const InputDecoration(),
    this.searchStyle,
  }) :
    assert(searchDecoration != null, 'searchDecoration must not be null!'),
    this.searchDecoration = searchDecoration.copyWith(prefixIcon: Icon(Icons.search)),
    super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectionDialogState();
}

class _SelectionDialogState extends State<SelectionDialog> {
  /// this is useful for filtering purpose
  List<CountryCode> filteredElements;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0.0,leading: Container(color: Colors.white,),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: d_20),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 7,
                        child: Container(
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(color: Colors.black12, width: 1.0),
                            color: Color.fromRGBO(248, 248, 248, 10.0),
                          ),
                          child: TextField(
                            maxLength: 25,
                            style: widget.searchStyle,
                            decoration: InputDecoration(prefixIcon: Icon(Icons.search),hintText:"Search",border: InputBorder.none,
                                counterText: "",
                                counterStyle: TextStyle(fontSize: 0.0)),
                            onChanged: _filterElements,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: FlatButton(
                          child: Text("Cancel",style: TextStyle(fontSize:17.0,color: Color.fromRGBO(102, 126, 234, 10.0)),),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Align(alignment:Alignment.centerLeft,child: Text("Select Country",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w600),)),
                  SizedBox(height: 10.0,),
                ],
              ),
            ),
            Container(
                color: Colors.white,
                padding: EdgeInsets.only(bottom: 20.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView(
                    children: [
                      widget.favoriteElements.isEmpty
                          ? const DecoratedBox(decoration: BoxDecoration())
                          : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[]
                            ..addAll(widget.favoriteElements
                                .map(
                                  (f) => SimpleDialogOption(
                                child: _buildOption(f),
                                onPressed: () {
                                  _selectItem(f);
                                },
                              ),
                            )
                                .toList())
                            ..add(const Divider())),
                    ]
                      ..addAll(filteredElements.isEmpty
                          ? [_buildEmptySearchWidget(context)]
                          : filteredElements.map(
                              (e) => SimpleDialogOption(
                            key: Key(e.toLongString()),
                            child: _buildOption(e),
                            onPressed: () {
                              _selectItem(e);
                            },
                          )))
                )
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildOption(CountryCode e) {
    return Container(
      width: 400,
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          /*Flexible(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Image.asset(
                e.flagUri,
                package: 'country_code_picker',
                width: 32.0,
              ),
            ),
          ),*/
          Expanded(
            //flex: 4,
            child: Text(
          e.toCountryStringOnly(),style: TextStyle(fontSize: 17.0,color: Color.fromRGBO(127, 127, 127, 10.0))
              /*widget.showCountryOnly
                  ? e.toCountryStringOnly()
                  : e.toLongString()*/,
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptySearchWidget(BuildContext context) {
    if (widget.emptySearchBuilder != null) {
      return widget.emptySearchBuilder(context);
    }

    return Center(child: Text('No Country Found'));
  }

  @override
  void initState() {
    filteredElements = widget.elements;
    super.initState();
  }

  void _filterElements(String s) {
    s = s.toUpperCase();
    setState(() {
      filteredElements = widget.elements
          .where((e) =>
              e.code.contains(s) ||
              e.dialCode.contains(s) ||
              e.name.toUpperCase().contains(s))
          .toList();
    });
  }

  void _selectItem(CountryCode e) {
    Navigator.pop(context, e);
  }
}

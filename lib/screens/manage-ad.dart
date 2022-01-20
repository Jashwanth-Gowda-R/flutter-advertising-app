import 'package:flutter/material.dart';

class ManageAdScreen extends StatefulWidget {
  bool isEdit;
  Map product = {};

  ManageAdScreen({
    Key key,
    this.isEdit,
    this.product,
  }) : super(key: key);

  @override
  _ManageAdScreenState createState() => _ManageAdScreenState();
}

class _ManageAdScreenState extends State<ManageAdScreen> {
  TextEditingController _titleCtrl = TextEditingController();
  TextEditingController _priceCtrl = TextEditingController();
  TextEditingController _mobileCtrl = TextEditingController();
  TextEditingController _descCtrl = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleCtrl.text =
        widget.product["title"] != null ? widget.product["title"] : "";
    _priceCtrl.text = widget.product["price"] != null
        ? widget.product["price"].toString()
        : "";
    _mobileCtrl.text =
        widget.product["mobile"] != null ? widget.product["mobile"] : "";
    _descCtrl.text = widget.product["description"] != null
        ? widget.product["description"]
        : "";
  }

  _buildImageList() {
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.product["images"].length,
        itemBuilder: (bc, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
            height: 80,
            width: 80,
            margin: EdgeInsets.all(4.0),
            padding: EdgeInsets.all(4.0),
            child: Image.network(
              widget.product["images"][index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.isEdit ? 'Edit' : 'Create'} Ad"),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Container(
                        child: Center(
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_a_photo_outlined,
                                  size: 40,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Tap to upload",
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      widget.isEdit ? _buildImageList() : Container(),
                      SizedBox(height: 16),
                      TextField(
                        controller: _titleCtrl,
                        decoration: InputDecoration(
                          hintText: "Title",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: _priceCtrl,
                        decoration: InputDecoration(
                          hintText: "Price",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: _mobileCtrl,
                        decoration: InputDecoration(
                          hintText: "Contact Number",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: _descCtrl,
                        maxLines: 5,
                        minLines: 3,
                        decoration: InputDecoration(
                          hintText: "Description",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                          ),
                          child: Text("Submit Ad"),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}



import 'package:flutter/material.dart';

import '../common/common_function.dart';
import '../common/image_utils.dart';
import '../theme/app_text_theme.dart';

class ShowBookDetailsScreen extends StatefulWidget {
  String? img, bookName, authorName, aboutAuthor, aboutBook, rating, issueDate;

  ShowBookDetailsScreen(
      {this.img,
      this.bookName,
      this.aboutAuthor,
      this.rating,
      this.aboutBook,
      this.authorName,
      this.issueDate});

  @override
  State<ShowBookDetailsScreen> createState() => _ShowBookDetailsScreenState();
}

class _ShowBookDetailsScreenState extends State<ShowBookDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        toolbarHeight: 70,
        title: Text(
          "Book Details",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isNullEmptyOrFalse(widget.img)
                  ? Container()
                  : Center(
                      child: getImageView(
                          //this function call for network image with loader...
                          finalUrl: widget.img,
                          fit: BoxFit.cover,
                          height: 190,
                          width: 140),
                    ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "${widget.bookName}",
                  style: primaryColor24TextStyleMedium,
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "Rating : ${widget.rating} / 5",
                  style: primaryColor14TextStyleMedium,
                ),
              ),
              SizedBox(height: 5),
              Center(
                child: Text(
                  "Issue Date : ${widget.issueDate}",
                  style: primaryColor14TextStyleMedium,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'About Book : ',
                  style: primaryColor14TextStyleMedium,
                  children: <TextSpan>[
                    TextSpan(
                      text: '${widget.aboutBook}',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Author Name : ',
                  style: primaryColor14TextStyleMedium,
                  children: <TextSpan>[
                    TextSpan(
                      text: '${widget.authorName}',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'About Author : ',
                  style: primaryColor14TextStyleMedium,
                  children: <TextSpan>[
                    TextSpan(
                      text: '${widget.aboutAuthor}',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empathy_flutter/firebase.dart';
import 'package:flutter/material.dart';

class getProductHealthData extends StatelessWidget {
  final String displayName;
  String causeText = '自分のことに関する悩み';

  getProductHealthData({
    super.key,
    required this.displayName,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getProductsHealth(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        //snapshot.dataの中にdisplaynameが含まれれば表示
        //含まれなければCardも表示しない
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data.contains(displayName)) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 10, left: 20, right: 20),
                      child: Text('3. 自分の身体・健康について悩んでいる')),
                  if (snapshot.data.length >= 1)
                    if (snapshot.data[0] == displayName)
                      Column(
                        children: [
                          if (snapshot.data.length >= 2)
                            matchingCard(
                              snapshot: snapshot.data[1],
                              pictograph: '🐱',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 3)
                            matchingCard(
                              snapshot: snapshot.data[2],
                              pictograph: '🦊',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 4)
                            matchingCard(
                              snapshot: snapshot.data[3],
                              pictograph: '🐻',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 5)
                            matchingCard(
                              snapshot: snapshot.data[4],
                              pictograph: '🐼',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 6)
                            matchingCard(
                              snapshot: snapshot.data[5],
                              pictograph: '🐸',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 7)
                            matchingCard(
                              snapshot: snapshot.data[6],
                              pictograph: '🐨',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 8)
                            matchingCard(
                              snapshot: snapshot.data[7],
                              pictograph: '🐶',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 9)
                            matchingCard(
                              snapshot: snapshot.data[8],
                              pictograph: '🐱',
                              cause: causeText,
                            ),
                        ],
                      ),
                  if (snapshot.data.length >= 2)
                    if (snapshot.data[1] == displayName)
                      Column(
                        children: [
                          if (snapshot.data.length >= 1)
                            matchingCard(
                              snapshot: snapshot.data[0],
                              pictograph: '🐱',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 3)
                            matchingCard(
                              snapshot: snapshot.data[2],
                              pictograph: '🦊',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 4)
                            matchingCard(
                              snapshot: snapshot.data[3],
                              pictograph: '🐻',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 5)
                            matchingCard(
                              snapshot: snapshot.data[4],
                              pictograph: '🐼',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 6)
                            matchingCard(
                              snapshot: snapshot.data[5],
                              pictograph: '🐸',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 7)
                            matchingCard(
                              snapshot: snapshot.data[6],
                              pictograph: '🐨',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 8)
                            matchingCard(
                              snapshot: snapshot.data[7],
                              pictograph: '🐶',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 9)
                            matchingCard(
                              snapshot: snapshot.data[8],
                              pictograph: '🐱',
                              cause: causeText,
                            ),
                        ],
                      ),
                  if (snapshot.data.length >= 3)
                    if (snapshot.data[2] == displayName)
                      Column(
                        children: [
                          if (snapshot.data.length >= 1)
                            matchingCard(
                              snapshot: snapshot.data[0],
                              pictograph: '🐱',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 2)
                            matchingCard(
                              snapshot: snapshot.data[1],
                              pictograph: '🦊',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 4)
                            matchingCard(
                              snapshot: snapshot.data[3],
                              pictograph: '🐻',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 5)
                            matchingCard(
                              snapshot: snapshot.data[4],
                              pictograph: '🐼',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 6)
                            matchingCard(
                              snapshot: snapshot.data[5],
                              pictograph: '🐸',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 7)
                            matchingCard(
                              snapshot: snapshot.data[6],
                              pictograph: '🐨',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 8)
                            matchingCard(
                              snapshot: snapshot.data[7],
                              pictograph: '🐶',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 9)
                            matchingCard(
                              snapshot: snapshot.data[8],
                              pictograph: '🐱',
                              cause: causeText,
                            ),
                        ],
                      ),
                  if (snapshot.data.length >= 4)
                    if (snapshot.data[3] == displayName)
                      Column(
                        children: [
                          if (snapshot.data.length >= 1)
                            matchingCard(
                              snapshot: snapshot.data[0],
                              pictograph: '🐱',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 2)
                            matchingCard(
                              snapshot: snapshot.data[1],
                              pictograph: '🦊',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 3)
                            matchingCard(
                              snapshot: snapshot.data[2],
                              pictograph: '🐻',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 5)
                            matchingCard(
                              snapshot: snapshot.data[4],
                              pictograph: '🐼',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 6)
                            matchingCard(
                              snapshot: snapshot.data[5],
                              pictograph: '🐸',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 7)
                            matchingCard(
                              snapshot: snapshot.data[6],
                              pictograph: '🐨',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 8)
                            matchingCard(
                              snapshot: snapshot.data[7],
                              pictograph: '🐶',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 9)
                            matchingCard(
                              snapshot: snapshot.data[8],
                              pictograph: '🐱',
                              cause: causeText,
                            ),
                        ],
                      ),
                  if (snapshot.data.length >= 5)
                    if (snapshot.data[4] == displayName)
                      Column(
                        children: [
                          if (snapshot.data.length >= 1)
                            matchingCard(
                              snapshot: snapshot.data[0],
                              pictograph: '🐱',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 2)
                            matchingCard(
                              snapshot: snapshot.data[1],
                              pictograph: '🦊',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 3)
                            matchingCard(
                              snapshot: snapshot.data[2],
                              pictograph: '🐻',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 4)
                            matchingCard(
                              snapshot: snapshot.data[3],
                              pictograph: '🐼',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 6)
                            matchingCard(
                              snapshot: snapshot.data[5],
                              pictograph: '🐸',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 7)
                            matchingCard(
                              snapshot: snapshot.data[6],
                              pictograph: '🐨',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 8)
                            matchingCard(
                              snapshot: snapshot.data[7],
                              pictograph: '🐶',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 9)
                            matchingCard(
                              snapshot: snapshot.data[8],
                              pictograph: '🐱',
                              cause: causeText,
                            ),
                        ],
                      ),
                  if (snapshot.data.length >= 6)
                    if (snapshot.data[5] == displayName)
                      Column(
                        children: [
                          if (snapshot.data.length >= 1)
                            matchingCard(
                              snapshot: snapshot.data[0],
                              pictograph: '🐱',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 2)
                            matchingCard(
                              snapshot: snapshot.data[1],
                              pictograph: '🦊',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 3)
                            matchingCard(
                              snapshot: snapshot.data[2],
                              pictograph: '🐻',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 4)
                            matchingCard(
                              snapshot: snapshot.data[3],
                              pictograph: '🐼',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 5)
                            matchingCard(
                              snapshot: snapshot.data[4],
                              pictograph: '🐸',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 7)
                            matchingCard(
                              snapshot: snapshot.data[6],
                              pictograph: '🐨',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 8)
                            matchingCard(
                              snapshot: snapshot.data[7],
                              pictograph: '🐶',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 9)
                            matchingCard(
                              snapshot: snapshot.data[8],
                              pictograph: '🐱',
                              cause: causeText,
                            ),
                        ],
                      ),
                  if (snapshot.data.length >= 7)
                    if (snapshot.data[6] == displayName)
                      Column(
                        children: [
                          if (snapshot.data.length >= 1)
                            matchingCard(
                              snapshot: snapshot.data[0],
                              pictograph: '🐱',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 2)
                            matchingCard(
                              snapshot: snapshot.data[1],
                              pictograph: '🦊',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 3)
                            matchingCard(
                              snapshot: snapshot.data[2],
                              pictograph: '🐻',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 4)
                            matchingCard(
                              snapshot: snapshot.data[3],
                              pictograph: '🐼',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 5)
                            matchingCard(
                              snapshot: snapshot.data[4],
                              pictograph: '🐸',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 6)
                            matchingCard(
                              snapshot: snapshot.data[5],
                              pictograph: '🐨',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 8)
                            matchingCard(
                              snapshot: snapshot.data[7],
                              pictograph: '🐶',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 9)
                            matchingCard(
                              snapshot: snapshot.data[8],
                              pictograph: '🐱',
                              cause: causeText,
                            ),
                        ],
                      ),
                  if (snapshot.data.length >= 8)
                    if (snapshot.data[7] == displayName)
                      Column(
                        children: [
                          if (snapshot.data.length >= 1)
                            matchingCard(
                              snapshot: snapshot.data[0],
                              pictograph: '🐱',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 2)
                            matchingCard(
                              snapshot: snapshot.data[1],
                              pictograph: '🦊',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 3)
                            matchingCard(
                              snapshot: snapshot.data[2],
                              pictograph: '🐻',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 4)
                            matchingCard(
                              snapshot: snapshot.data[3],
                              pictograph: '🐼',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 5)
                            matchingCard(
                              snapshot: snapshot.data[4],
                              pictograph: '🐸',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 6)
                            matchingCard(
                              snapshot: snapshot.data[5],
                              pictograph: '🐨',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 7)
                            matchingCard(
                              snapshot: snapshot.data[6],
                              pictograph: '🐶',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 9)
                            matchingCard(
                              snapshot: snapshot.data[8],
                              pictograph: '🐱',
                              cause: causeText,
                            ),
                        ],
                      ),
                  if (snapshot.data.length >= 9)
                    if (snapshot.data[8] == displayName)
                      Column(
                        children: [
                          if (snapshot.data.length >= 1)
                            matchingCard(
                              snapshot: snapshot.data[0],
                              pictograph: '🐱',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 2)
                            matchingCard(
                              snapshot: snapshot.data[1],
                              pictograph: '🦊',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 3)
                            matchingCard(
                              snapshot: snapshot.data[2],
                              pictograph: '🐻',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 4)
                            matchingCard(
                              snapshot: snapshot.data[3],
                              pictograph: '🐼',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 5)
                            matchingCard(
                              snapshot: snapshot.data[4],
                              pictograph: '🐸',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 6)
                            matchingCard(
                              snapshot: snapshot.data[5],
                              pictograph: '🐨',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 7)
                            matchingCard(
                              snapshot: snapshot.data[6],
                              pictograph: '🐶',
                              cause: causeText,
                            ),
                          if (snapshot.data.length >= 8)
                            matchingCard(
                              snapshot: snapshot.data[7],
                              pictograph: '🐱',
                              cause: causeText,
                            ),
                        ],
                      ),
                ]);
          }
          return Column();
        }
        return Column();
      },
    );
  }

  Future getProductsHealth() async {
    var collection =
        await FirebaseFirestore.instance.collection('自分のこと').doc('身体・健康').get();
    return Future.value(collection['users'] as List);
  }
}

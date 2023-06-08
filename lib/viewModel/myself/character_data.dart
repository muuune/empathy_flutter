import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empathy_flutter/firebase.dart';
import 'package:flutter/material.dart';

class getProductCharacterData extends StatelessWidget {
  final String displayName;

  getProductCharacterData({
    super.key,
    required this.displayName,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getProductsCharacter(),
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
                      child: Text('1. 自分の性格について悩んでいる')),
                  if (snapshot.data.length >= 1)
                    if (snapshot.data[0] == displayName)
                      Column(
                        children: [
                          if (snapshot.data.length >= 1)
                            matchingCard(
                              snapshot: snapshot.data[0],
                              pictograph: '🐱',
                            ),
                          if (snapshot.data.length >= 3)
                            matchingCard(
                              snapshot: snapshot.data[2],
                              pictograph: '🦊',
                            ),
                          if (snapshot.data.length >= 4)
                            matchingCard(
                              snapshot: snapshot.data[3],
                              pictograph: '🐻',
                            ),
                          if (snapshot.data.length >= 5)
                            matchingCard(
                              snapshot: snapshot.data[4],
                              pictograph: '🐼',
                            ),
                          if (snapshot.data.length >= 6)
                            matchingCard(
                              snapshot: snapshot.data[5],
                              pictograph: '🐸',
                            ),
                          if (snapshot.data.length >= 7)
                            matchingCard(
                              snapshot: snapshot.data[6],
                              pictograph: '🐨',
                            ),
                          if (snapshot.data.length >= 8)
                            matchingCard(
                              snapshot: snapshot.data[7],
                              pictograph: '🐶',
                            ),
                          if (snapshot.data.length >= 9)
                            matchingCard(
                              snapshot: snapshot.data[8],
                              pictograph: '🐱',
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
                            ),
                          if (snapshot.data.length >= 3)
                            matchingCard(
                              snapshot: snapshot.data[2],
                              pictograph: '🦊',
                            ),
                          if (snapshot.data.length >= 4)
                            matchingCard(
                              snapshot: snapshot.data[3],
                              pictograph: '🐻',
                            ),
                          if (snapshot.data.length >= 5)
                            matchingCard(
                              snapshot: snapshot.data[4],
                              pictograph: '🐼',
                            ),
                          if (snapshot.data.length >= 6)
                            matchingCard(
                              snapshot: snapshot.data[5],
                              pictograph: '🐸',
                            ),
                          if (snapshot.data.length >= 7)
                            matchingCard(
                              snapshot: snapshot.data[6],
                              pictograph: '🐨',
                            ),
                          if (snapshot.data.length >= 8)
                            matchingCard(
                              snapshot: snapshot.data[7],
                              pictograph: '🐶',
                            ),
                          if (snapshot.data.length >= 9)
                            matchingCard(
                              snapshot: snapshot.data[8],
                              pictograph: '🐱',
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
                            ),
                          if (snapshot.data.length >= 2)
                            matchingCard(
                              snapshot: snapshot.data[1],
                              pictograph: '🦊',
                            ),
                          if (snapshot.data.length >= 4)
                            matchingCard(
                              snapshot: snapshot.data[3],
                              pictograph: '🐻',
                            ),
                          if (snapshot.data.length >= 5)
                            matchingCard(
                              snapshot: snapshot.data[4],
                              pictograph: '🐼',
                            ),
                          if (snapshot.data.length >= 6)
                            matchingCard(
                              snapshot: snapshot.data[5],
                              pictograph: '🐸',
                            ),
                          if (snapshot.data.length >= 7)
                            matchingCard(
                              snapshot: snapshot.data[6],
                              pictograph: '🐨',
                            ),
                          if (snapshot.data.length >= 8)
                            matchingCard(
                              snapshot: snapshot.data[7],
                              pictograph: '🐶',
                            ),
                          if (snapshot.data.length >= 9)
                            matchingCard(
                              snapshot: snapshot.data[8],
                              pictograph: '🐱',
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
                            ),
                          if (snapshot.data.length >= 2)
                            matchingCard(
                              snapshot: snapshot.data[1],
                              pictograph: '🦊',
                            ),
                          if (snapshot.data.length >= 4)
                            matchingCard(
                              snapshot: snapshot.data[3],
                              pictograph: '🐻',
                            ),
                          if (snapshot.data.length >= 5)
                            matchingCard(
                              snapshot: snapshot.data[4],
                              pictograph: '🐼',
                            ),
                          if (snapshot.data.length >= 6)
                            matchingCard(
                              snapshot: snapshot.data[5],
                              pictograph: '🐸',
                            ),
                          if (snapshot.data.length >= 7)
                            matchingCard(
                              snapshot: snapshot.data[6],
                              pictograph: '🐨',
                            ),
                          if (snapshot.data.length >= 8)
                            matchingCard(
                              snapshot: snapshot.data[7],
                              pictograph: '🐶',
                            ),
                          if (snapshot.data.length >= 9)
                            matchingCard(
                              snapshot: snapshot.data[8],
                              pictograph: '🐱',
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
                            ),
                          if (snapshot.data.length >= 2)
                            matchingCard(
                              snapshot: snapshot.data[1],
                              pictograph: '🦊',
                            ),
                          if (snapshot.data.length >= 3)
                            matchingCard(
                              snapshot: snapshot.data[2],
                              pictograph: '🐻',
                            ),
                          if (snapshot.data.length >= 4)
                            matchingCard(
                              snapshot: snapshot.data[3],
                              pictograph: '🐼',
                            ),
                          if (snapshot.data.length >= 6)
                            matchingCard(
                              snapshot: snapshot.data[5],
                              pictograph: '🐸',
                            ),
                          if (snapshot.data.length >= 7)
                            matchingCard(
                              snapshot: snapshot.data[6],
                              pictograph: '🐨',
                            ),
                          if (snapshot.data.length >= 8)
                            matchingCard(
                              snapshot: snapshot.data[7],
                              pictograph: '🐶',
                            ),
                          if (snapshot.data.length >= 9)
                            matchingCard(
                              snapshot: snapshot.data[8],
                              pictograph: '🐱',
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
                            ),
                          if (snapshot.data.length >= 2)
                            matchingCard(
                              snapshot: snapshot.data[1],
                              pictograph: '🦊',
                            ),
                          if (snapshot.data.length >= 3)
                            matchingCard(
                              snapshot: snapshot.data[2],
                              pictograph: '🐻',
                            ),
                          if (snapshot.data.length >= 4)
                            matchingCard(
                              snapshot: snapshot.data[3],
                              pictograph: '🐼',
                            ),
                          if (snapshot.data.length >= 5)
                            matchingCard(
                              snapshot: snapshot.data[4],
                              pictograph: '🐸',
                            ),
                          if (snapshot.data.length >= 7)
                            matchingCard(
                              snapshot: snapshot.data[6],
                              pictograph: '🐨',
                            ),
                          if (snapshot.data.length >= 8)
                            matchingCard(
                              snapshot: snapshot.data[7],
                              pictograph: '🐶',
                            ),
                          if (snapshot.data.length >= 9)
                            matchingCard(
                              snapshot: snapshot.data[8],
                              pictograph: '🐱',
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
                            ),
                          if (snapshot.data.length >= 2)
                            matchingCard(
                              snapshot: snapshot.data[1],
                              pictograph: '🦊',
                            ),
                          if (snapshot.data.length >= 3)
                            matchingCard(
                              snapshot: snapshot.data[2],
                              pictograph: '🐻',
                            ),
                          if (snapshot.data.length >= 4)
                            matchingCard(
                              snapshot: snapshot.data[3],
                              pictograph: '🐼',
                            ),
                          if (snapshot.data.length >= 5)
                            matchingCard(
                              snapshot: snapshot.data[4],
                              pictograph: '🐸',
                            ),
                          if (snapshot.data.length >= 6)
                            matchingCard(
                              snapshot: snapshot.data[5],
                              pictograph: '🐨',
                            ),
                          if (snapshot.data.length >= 8)
                            matchingCard(
                              snapshot: snapshot.data[7],
                              pictograph: '🐶',
                            ),
                          if (snapshot.data.length >= 9)
                            matchingCard(
                              snapshot: snapshot.data[8],
                              pictograph: '🐱',
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
                            ),
                          if (snapshot.data.length >= 2)
                            matchingCard(
                              snapshot: snapshot.data[1],
                              pictograph: '🦊',
                            ),
                          if (snapshot.data.length >= 3)
                            matchingCard(
                              snapshot: snapshot.data[2],
                              pictograph: '🐻',
                            ),
                          if (snapshot.data.length >= 4)
                            matchingCard(
                              snapshot: snapshot.data[3],
                              pictograph: '🐼',
                            ),
                          if (snapshot.data.length >= 5)
                            matchingCard(
                              snapshot: snapshot.data[4],
                              pictograph: '🐸',
                            ),
                          if (snapshot.data.length >= 6)
                            matchingCard(
                              snapshot: snapshot.data[5],
                              pictograph: '🐨',
                            ),
                          if (snapshot.data.length >= 7)
                            matchingCard(
                              snapshot: snapshot.data[6],
                              pictograph: '🐶',
                            ),
                          if (snapshot.data.length >= 9)
                            matchingCard(
                              snapshot: snapshot.data[8],
                              pictograph: '🐱',
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
                            ),
                          if (snapshot.data.length >= 2)
                            matchingCard(
                              snapshot: snapshot.data[1],
                              pictograph: '🦊',
                            ),
                          if (snapshot.data.length >= 3)
                            matchingCard(
                              snapshot: snapshot.data[2],
                              pictograph: '🐻',
                            ),
                          if (snapshot.data.length >= 4)
                            matchingCard(
                              snapshot: snapshot.data[3],
                              pictograph: '🐼',
                            ),
                          if (snapshot.data.length >= 5)
                            matchingCard(
                              snapshot: snapshot.data[4],
                              pictograph: '🐸',
                            ),
                          if (snapshot.data.length >= 6)
                            matchingCard(
                              snapshot: snapshot.data[5],
                              pictograph: '🐨',
                            ),
                          if (snapshot.data.length >= 7)
                            matchingCard(
                              snapshot: snapshot.data[6],
                              pictograph: '🐶',
                            ),
                          if (snapshot.data.length >= 8)
                            matchingCard(
                              snapshot: snapshot.data[7],
                              pictograph: '🐱',
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

  Future getProductsCharacter() async {
    var collection =
        await FirebaseFirestore.instance.collection('自分のこと').doc('自分の性格').get();
    return Future.value(collection['users'] as List);
  }
}

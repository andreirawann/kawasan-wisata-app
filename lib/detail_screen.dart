import 'package:flutter/material.dart';
import 'package:wisataapp/model/tourism_place.dart';

var informationTextstyle = const TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatelessWidget {
  final TourismPlace place;
  const DetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: [
                  Image.asset(place.imageAsset),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back)),
                          ),
                          const FavoriteButton(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Text(
                  place.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Staatliches',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.calendar_today),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          place.openDays,
                          style: informationTextstyle,
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.access_time),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          place.openTime,
                          style: informationTextstyle,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.monetization_on),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          place.ticketPrice,
                          style: informationTextstyle,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  place.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: place.imageUrls.map((url) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(url),
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
      ),
    );
  }
}

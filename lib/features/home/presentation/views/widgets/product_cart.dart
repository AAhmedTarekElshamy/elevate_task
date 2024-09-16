import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../data/models/card_model.dart';

class ProductCard extends StatefulWidget {
   ProductCard(
      {super.key, required this.cardModel, required this.favColor});
  final CardModel cardModel;
 bool favColor;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.white),
      ),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image and favorite icon
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12)),
                child: Image(
                  height: 120, // Set a fixed height for the image
                  width: double.infinity,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    widget.cardModel.image.toString() ??
                        "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg",
                  ),
                ),
              ),

              //*CachedNetworkImage(
              //                     height: 120,
              //                     fit: BoxFit.cover,
              //                     imageUrl:"
              //                     placeholder: (context, url) => const CircularProgressIndicator(),
              //                     errorWidget: (context, url, error) => const Icon(Icons.error),
              //                   ),*/
              Positioned(
                top: 7,
                right: 1,
                child: Container(
                  height: 35,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey[400],
                    child: IconButton(
                      alignment: Alignment.center,
                      icon: Icon(
                        Icons.favorite ,
                        color: widget.favColor == false ? Colors.white : Colors.red,

                      ),
                      color: Colors.black,
                      onPressed: () {
                        setState(() {
                          widget.favColor=!widget.favColor;
                        });

                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Product details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.cardModel.title ?? 'Nike Air Jordan',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.cardModel.description ?? 'Nike shoes flexible for wo...',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(height: 3),
          // Price details
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  widget.cardModel.price.toString() ?? 'EGP 1,200',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  '2000 EGP',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 2),
          // Rating and review
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),

              child: Row(
                children: [
                  Text(
                    'Review (${widget.cardModel.rating?.rate ?? 4.8 })'  ,
                    style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                  ),
                  const Icon(Icons.star, color: Colors.amber, size: 18 ),
                  const Spacer(),
                  // Add to cart button
                  Container(
                    height: 35, // Adjust the button height slightly
                    width: 35,
                    // margin: const EdgeInsets.only(
                    //     right: 1), // Adjust the button width slightly
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.plus,
                        color: Colors.white,
                      ),
                      //const Icon(Icons.add, color: Colors.white,size: 22,),
                      onPressed: () {
                        // Add to cart functionality
                      },
                      iconSize: 20, // Smaller icon size
                    ),
                  ),
                ],
              ),

          ),
        ],
      ),
    );
  }
}

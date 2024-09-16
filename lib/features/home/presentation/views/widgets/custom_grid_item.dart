 import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
 class CustomGridItem extends StatelessWidget {
   const CustomGridItem({super.key});

   @override
   Widget build(BuildContext context) {
     return Material(
       elevation: 3,
       child: Container(
         decoration: BoxDecoration(
           //     color: Colors.black,
             border: Border.all(
               color: Colors.blue, // Border color
               width: 1,          // Border width
             ),

             borderRadius: BorderRadius.circular(12)),
         child: Column(

           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Stack(
               children: [
                 const ClipRRect(
                   borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft:Radius.circular(12) ),
                   child: Image(
                     height: 120, // Set a fixed height for the image
                     width: double.infinity,
                     fit: BoxFit.cover,
                     image: AssetImage('lib/assets/shoes.jpg'),
                   ),
                 ),
                 Positioned(
                   top: 7,
                   right: 1,
                   child: Container(
                     height: 35,
                     child:   CircleAvatar(
                       radius:25,
                       backgroundColor: Colors.white,
                       child: IconButton(
                         alignment: Alignment.center,
                         icon:const Icon(Icons.favorite_border), color: Colors.blue, onPressed: () {  },),
                     ),
                   ),
                 ),
               ],
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const Text(
                     'Nike Air Jordan',
                     textAlign: TextAlign.left,
                     style: TextStyle(
                       fontSize: 16,
                       fontWeight: FontWeight.w500,
                       color: Colors.black,
                     ),
                     overflow: TextOverflow.ellipsis,
                   ),
                   Text(
                     'Nike shoes flexible for wo...',
                     style: TextStyle(
                       fontSize: 14,
                       color: Colors.grey[700],
                     ),
                     overflow: TextOverflow.ellipsis,
                   ),
                   //const SizedBox(height: 8),

                   SizedBox(
                     height: 10,
                   ),
                   const Row(
                     children: [
                       Text(
                         'EGP 1,200',
                         style: TextStyle(
                           fontSize: 16,
                           fontWeight:  FontWeight.w500,
                           color: Colors.black,
                         ),
                       ),
                       SizedBox(width: 8),
                       Text(
                         '2000 EGP',
                         style: TextStyle(
                           fontSize: 14,
                           color: Colors.blue,
                           decoration: TextDecoration.lineThrough,
                         ),
                       ),
                     ],
                   ),
                   const SizedBox(
                     height: 5,
                   ),

                   // Rating and review
                   Row(
                     children: [
                       Text(
                         'Review (4.6)',
                         style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                       ),
                       const Icon(Icons.star, color: Colors.amber, size: 16),
                       const Spacer(), // Pushes the icon button to the right

                       // Add to cart button
                       Container(
                         height: 35, // Adjust the button height slightly
                         width: 35,
                         margin: const EdgeInsets.only(
                             right: 10), // Adjust the button width slightly
                         decoration: const BoxDecoration(
                           color: Colors.blue,
                           shape: BoxShape.circle,
                         ),
                         child: IconButton(
                           icon: const FaIcon(FontAwesomeIcons.plus,color: Colors.white,),
                         //const Icon(Icons.add, color: Colors.white,size: 22,),
                           onPressed: () {
                             // Add to cart functionality
                           },
                           iconSize: 20, // Smaller icon size
                         ),
                       ),
                       //  const SizedBox(height: 10,),
                     ],
                   ),
                 ],
               ),
             ),
             //SizedBox(height: 25,),
           ],
         ),
       ),
     );
   }
 }

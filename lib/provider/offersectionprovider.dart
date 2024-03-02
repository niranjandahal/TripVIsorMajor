import 'package:flutter/material.dart';

class offersectionprovider extends ChangeNotifier {
  int datacount = 0;

  // List<String> offerlist1 = [
  //   'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
  //   'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
  //   'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
  //   'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
  //   'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
  // ];+

  final List<Map<String, dynamic>> offerlist1 = [
    {
      "id": "offer1",
      "name": "Annapurna Base Camp Trek",
      "region": "Annapurna",
      "duration": 14,
      "difficulty": "Moderate",
      "highlights": [
        "Stunning views of Annapurna I, Machapuchare, and Hiunchuli",
        "Diverse landscapes, from lush valleys to glaciers",
        "Traditional villages and cultural experiences",
        "Opportunity to see unique flora and fauna"
      ],
      "price": 1500,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQks-8u2-wtDvBupaGzpoyLx4ap5Pf-vGICAXxynGS7PA&s",
      "description":
          "Embark on a classic journey to the foot of Annapurna I, Nepal's 10th highest peak. This moderate trek offers breathtaking scenery, diverse landscapes, and cultural encounters."
    },
    {
      "id": "offer2",
      "name": "Everest Base Camp Trek",
      "region": "Khumbu",
      "duration": 16,
      "difficulty": "Challenging",
      "highlights": [
        "Stand at the foot of the world's highest mountain",
        "Experience Sherpa culture and traditions",
        "Witness breathtaking views of the Khumbu Valley and surrounding peaks",
        "Visit Gokyo Lakes and Kala Patthar for panoramic views"
      ],
      "price": 3000,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQks-8u2-wtDvBupaGzpoyLx4ap5Pf-vGICAXxynGS7PA&s",
      "description":
          "Challenge yourself on this iconic trek to the base camp of Mt. Everest. Experience the beauty and grandeur of the Himalayas, Sherpa culture, and breathtaking panoramas."
    },
    {
      "id": "offer3",
      "name": "Langtang Valley Trek",
      "region": "Langtang",
      "duration": 10,
      "difficulty": "Moderate",
      "highlights": [
        "Explore the Langtang Valley, known as the 'Valley of Glaciers'",
        "Visit Kyanjin Gompa and Tserko Ri for stunning views",
        "Experience Tamang culture and traditions",
        "Opportunity to see unique flora and fauna"
      ],
      "price": 1200,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQks-8u2-wtDvBupaGzpoyLx4ap5Pf-vGICAXxynGS7PA&s",
      "description":
          "Trek through the Langtang Valley, a region known for its natural beauty and cultural diversity. This moderate trek offers stunning views, unique flora and fauna, and cultural experiences."
    },
    {
      "id": "offer4",
      "name": "Manaslu Circuit Trek",
      "region": "Manaslu",
      "duration": 18,
      "difficulty": "Challenging",
      "highlights": [
        "Trek around the world's eighthhighest peak",
        "Experience diverse landscapes and ecosystems",
        "Cross the challenging Larkya La Pass",
        "Visit traditional villages and monasteries"
      ],
      "price": 2500,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQks-8u2-wtDvBupaGzpoyLx4ap5Pf-vGICAXxynGS7PA&s",
      "description":
          "Embark on an off-the-beaten-path adventure around Manaslu, a region known for its natural beauty and cultural diversity. This challenging trek offers stunning views, diverse landscapes, and cultural encounters."
    },
    {
      "id": "offer5",
      "name": "Upper Mustang Trek",
      "region": "Mustang",
      "duration": 14,
      "difficulty": "Moderate",
      "highlights": [
        "Explore the 'Forbidden Kingdom' of Mustang",
        "Visit ancient monasteries and caves",
        "Experience Tibetan culture and traditions",
        "Witness unique landscapes and rock formations"
      ],
      "price": 2000,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQks-8u2-wtDvBupaGzpoyLx4ap5Pf-vGICAXxynGS7PA&s",
      "description":
          "Journey to the remote and mystical region of Upper Mustang, known for its ancient monasteries, caves, and unique landscapes. This moderate trek offers a glimpse into a bygone era."
    }
  ];

  bool offerlist1loaded = false;

  // List<String> offerlist2 = [
  //   'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
  //   'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
  //   'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
  //   'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
  //   'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
  // ];

  List<Map<String, dynamic>> offerlist2 = [
    {
      "id": "offer1",
      "name": "Annapurna Base Camp Trek",
      "region": "Annapurna",
      "duration": 14,
      "difficulty": "Moderate",
      "highlights": [
        "Stunning views of Annapurna I, Machapuchare, and Hiunchuli",
        "Diverse landscapes, from lush valleys to glaciers",
        "Traditional villages and cultural experiences",
        "Opportunity to see unique flora and fauna"
      ],
      "price": 1500,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQks-8u2-wtDvBupaGzpoyLx4ap5Pf-vGICAXxynGS7PA&s",
      "description":
          "Embark on a classic journey to the foot of Annapurna I, Nepal's 10th highest peak. This moderate trek offers breathtaking scenery, diverse landscapes, and cultural encounters."
    },
    {
      "id": "offer2",
      "name": "Everest Base Camp Trek",
      "region": "Khumbu",
      "duration": 16,
      "difficulty": "Challenging",
      "highlights": [
        "Stand at the foot of the world's highest mountain",
        "Experience Sherpa culture and traditions",
        "Witness breathtaking views of the Khumbu Valley and surrounding peaks",
        "Visit Gokyo Lakes and Kala Patthar for panoramic views"
      ],
      "price": 3000,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQks-8u2-wtDvBupaGzpoyLx4ap5Pf-vGICAXxynGS7PA&s",
      "description":
          "Challenge yourself on this iconic trek to the base camp of Mt. Everest. Experience the beauty and grandeur of the Himalayas, Sherpa culture, and breathtaking panoramas."
    },
    {
      "id": "offer3",
      "name": "Langtang Valley Trek",
      "region": "Langtang",
      "duration": 10,
      "difficulty": "Moderate",
      "highlights": [
        "Explore the Langtang Valley, known as the 'Valley of Glaciers'",
        "Visit Kyanjin Gompa and Tserko Ri for stunning views",
        "Experience Tamang culture and traditions",
        "Opportunity to see unique flora and fauna"
      ],
      "price": 1200,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQks-8u2-wtDvBupaGzpoyLx4ap5Pf-vGICAXxynGS7PA&s",
      "description":
          "Trek through the Langtang Valley, a region known for its natural beauty and cultural diversity. This moderate trek offers stunning views, unique flora and fauna, and cultural experiences."
    },
    {
      "id": "offer4",
      "name": "Manaslu Circuit Trek",
      "region": "Manaslu",
      "duration": 18,
      "difficulty": "Challenging",
      "highlights": [
        "Trek around the world's eighthhighest peak",
        "Experience diverse landscapes and ecosystems",
        "Cross the challenging Larkya La Pass",
        "Visit traditional villages and monasteries"
      ],
      "price": 2500,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQks-8u2-wtDvBupaGzpoyLx4ap5Pf-vGICAXxynGS7PA&s",
      "description":
          "Embark on an off-the-beaten-path adventure around Manaslu, a region known for its natural beauty and cultural diversity. This challenging trek offers stunning views, diverse landscapes, and cultural encounters."
    },
    {
      "id": "offer5",
      "name": "Upper Mustang Trek",
      "region": "Mustang",
      "duration": 14,
      "difficulty": "Moderate",
      "highlights": [
        "Explore the 'Forbidden Kingdom' of Mustang",
        "Visit ancient monasteries and caves",
        "Experience Tibetan culture and traditions",
        "Witness unique landscapes and rock formations"
      ],
      "price": 2000,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQks-8u2-wtDvBupaGzpoyLx4ap5Pf-vGICAXxynGS7PA&s",
      "description":
          "Journey to the remote and mystical region of Upper Mustang, known for its ancient monasteries, caves, and unique landscapes. This moderate trek offers a glimpse into a bygone era."
    },
  ];

  bool offerlist2loaded = false;

  // List<String> offerlist3 = [
  //   'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
  //   'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
  //   'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
  // ];

  List<Map<String, dynamic>> offerlist3 = [
    {
      "id": "premium1",
      "name": "Luxury Everest Expedition",
      "region": "Khumbu",
      "duration": 20,
      "difficulty": "Challenging",
      "highlights": [
        "Summiting Mount Everest",
        "Luxurious accommodations throughout the trek",
        "Professional cinematographer capturing your journey",
        "Custom drone shots of your trek",
        "Compilation video of your trek after it's over"
      ],
      "price": 10000,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQks-8u2-wtDvBupaGzpoyLx4ap5Pf-vGICAXxynGS7PA&s",
      "description":
          "Embark on the ultimate luxury trekking experience to Everest Base Camp. This premium package includes sumptuous accommodations, professional cinematography, and drone shots to capture every moment of your journey."
    },
    {
      "id": "premium2",
      "name": "Helicopter Tour of the Himalayas",
      "region": "Various",
      "duration": 1,
      "difficulty": "Easy",
      "highlights": [
        "Scenic helicopter tour of the Himalayas",
        "Aerial views of Mount Everest, Annapurna, and more",
        "Landing at Everest Base Camp or Annapurna Base Camp",
        "Champagne breakfast at the mountain base camp"
      ],
      "price": 5000,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQks-8u2-wtDvBupaGzpoyLx4ap5Pf-vGICAXxynGS7PA&s",
      "description":
          "Experience the grandeur of the Himalayas on a private helicopter tour. This premium package offers breathtaking aerial views of the world's highest peaks, with the option to land at Everest or Annapurna Base Camp."
    },
    {
      "id": "premium3",
      "name": "Luxury Annapurna Sanctuary Trek",
      "region": "Annapurna",
      "duration": 14,
      "difficulty": "Moderate",
      "highlights": [
        "Sumptuous accommodations and gourmet meals",
        "Professional guide and porter service",
        "Private helicopter transfer to and from the trek",
        "Customized itinerary and personalized service"
      ],
      "price": 8000,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQks-8u2-wtDvBupaGzpoyLx4ap5Pf-vGICAXxynGS7PA&s",
      "description":
          "Embark on a luxurious trek to the Annapurna Sanctuary, with private helicopter transfers, gourmet meals, and personalized service. This premium package offers the ultimate in comfort and convenience."
    },
  ];

  bool offerlist3loaded = false;

  int getcounts(int index) {
    if (index == 1) {
      datacount = offerlist1.length;
    } else if (index == 2) {
      datacount = offerlist2.length;
    } else if (index == 3) {
      datacount = offerlist3.length;
    }
    return datacount;
  }
}

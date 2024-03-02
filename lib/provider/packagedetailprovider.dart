import 'package:flutter/material.dart';

class PackageDetailsProvider extends ChangeNotifier {
  List<Map<String, dynamic>> trekDetailsList = [
    {
      "trek_details": {
        "name": "Everest Base Camp Trek",
        "region": "Everest",
        "duration": 16,
        "difficulty": "Challenging",
        "highlights": [
          "Close-up views of Mount Everest and other Himalayan peaks",
          "Scenic flight to Lukla airport, one of the most dangerous airports in the world",
          "Trekking through Sherpa villages and experiencing their culture",
          "Visit to Tengboche Monastery, one of the highest monasteries in the world",
          "Crossing high suspension bridges over rushing rivers",
          "Exploring the vibrant town of Namche Bazaar, the gateway to Everest",
          "Witnessing the breathtaking Khumbu Icefall",
          "Reaching the iconic Everest Base Camp, a feat of endurance and determination"
        ],
        "price": 2000,
        "image": "https://example.com/everest_base_camp_trek.jpg",
        "description":
            "Embark on the adventure of a lifetime with the Everest Base Camp Trek. This challenging trek takes you to the base camp of the world's highest mountain, Mount Everest. You'll trek through rugged terrain, dense forests, and high mountain passes while enjoying breathtaking views of snow-capped peaks. Along the way, you'll experience the rich Sherpa culture, visit ancient monasteries, and meet fellow trekkers from around the world. This trek is a test of physical and mental endurance, but the sense of achievement when you reach Everest Base Camp is unparalleled."
      },
      "itinerary": {
        "day1": "Arrive in Kathmandu and transfer to hotel",
        "day2": "Fly from Kathmandu to Lukla and trek to Phakding",
        "day3": "Trek from Phakding to Namche Bazaar",
        "day4": "Acclimatization day in Namche Bazaar",
        "day5": "Trek from Namche Bazaar to Tengboche",
        "day6": "Trek from Tengboche to Dingboche",
        "day7": "Acclimatization day in Dingboche",
        "day8": "Trek from Dingboche to Lobuche",
        "day9": "Trek from Lobuche to Gorak Shep and visit Everest Base Camp",
        "day10":
            "Hike to Kala Patthar for sunrise views and trek back to Pheriche",
        "day11": "Trek from Pheriche to Namche Bazaar",
        "day12": "Trek from Namche Bazaar to Lukla",
        "day13": "Fly from Lukla to Kathmandu",
        "day14": "Spend a day at leisure in Kathmandu",
        "day15": "Depart from Kathmandu"
      },
      "what_to_pack": {
        "clothing": [
          "Moisture-wicking base layers",
          "Insulating layers (fleece or down jacket)",
          "Waterproof and windproof jacket and pants",
          "Warm hat and gloves",
          "Hiking boots with ankle support",
          "Thick woolen socks",
          "Sun hat and sunglasses",
          "Gaiters (optional)",
          "Trekking poles"
        ],
        "gear": [
          "Backpack (40-50 liters)",
          "Sleeping bag (rated for sub-zero temperatures)",
          "Sleeping pad",
          "Water bottles or hydration system",
          "Headlamp with extra batteries",
          "Personal first aid kit",
          "Sunscreen and lip balm",
          "Insect repellent",
          "Toiletries and personal hygiene items",
          "Camera or smartphone for photos"
        ]
      },
      "accommodation":
          "Accommodation during the trek will be in tea houses or lodges along the route. These are basic but comfortable guesthouses that offer meals and a place to sleep. Rooms may have twin beds or dormitory-style accommodation, and bathrooms are usually shared. While basic amenities are provided, it's advisable to bring your own sleeping bag for added warmth and comfort.",
      "guide_and_porter": {
        "guide": {
          "name": "Tenzing Sherpa",
          "experience": "10+ years of guiding experience in the Everest region",
          "knowledge":
              "Expert knowledge of the local trails, culture, and safety protocols",
          "responsibilities": [
            "Leading the group on the trekking route",
            "Providing information about the region and landmarks",
            "Ensuring the safety and well-being of the trekking group",
            "Organizing accommodation and meals"
          ]
        },
        "porter": {
          "name": "Pasang Sherpa",
          "role": "Carrying trekking gear and supplies for the group",
          "strength":
              "Strong and experienced in carrying heavy loads at high altitudes",
          "responsibilities": [
            "Carrying trekking bags, tents, and other equipment",
            "Assisting with setting up camp and meal preparation",
            "Ensuring the safety of the group's belongings"
          ]
        }
      },
      "safety_and_health": {
        "altitude_sickness": {
          "symptoms": [
            "Headache",
            "Nausea or vomiting",
            "Fatigue",
            "Shortness of breath",
            "Loss of appetite"
          ],
          "prevention":
              "Proper acclimatization, staying hydrated, and listening to your body are key to preventing altitude sickness. It's important to ascend slowly, take rest days for acclimatization, and descend if symptoms worsen."
        },
        "medical_facilities":
            "Medical facilities along the trekking route are limited and basic. There are small clinics in some villages, but they may not have the necessary equipment or medication for serious medical conditions. It's important to carry a basic first aid kit and any personal medications you may need. In case of emergency, helicopters can be arranged for evacuation to hospitals in Kathmandu.",
        "travel_insurance":
            "Travel insurance that covers trekking activities and emergency medical evacuation is essential for Everest Base CampTrek. It should also include coverage for high-altitude trekking and medical expenses incurred during the trek."
      },
      "additional_information": {
        "permits": [
          "Sagarmatha National Park Entry Permit",
          "TIMS (Trekkers' Information Management System) Card"
        ],
        "weather":
            "Weather in the Everest region is highly variable and can change rapidly. Spring (March to May) and autumn (September to November) are the best seasons for trekking, with clear skies and mild temperatures. Winter (December to February) is cold and snowy, while summer (June to August) brings monsoon rains and poor visibility.",
        "communication":
            "Cell phone coverage is available in some parts of the trekking route, but it can be unreliable. Local SIM cards can be purchased in Kathmandu or Namche Bazaar for communication. Wi-Fi is available in most tea houses, but it may be slow and unreliable."
      },
      "trek_overview": {
        "distance": "120 km/75 mi",
        "days_required": "12 days",
        "total_ascent": "6015 m/19 734 ft",
        "total_descent": "5821 m/19 097 ft",
        "highest_point": "5640 m/18 500 ft Kala Patthar",
        "difficulty": "Difficult",
        "permits":
            "Local Government fee (NPR 2000/US / \u0024 17 pp.) and Sagarmatha National Park permit (NPR 3000/US \u0024 25 pp.) is required. No TIMS card is needed for the trek.",
        "cost_per_day":
            "US  \u0024  29 (without flights)  \u0024  58 per person per day including permits and transportation.",
        "guide": "Not compulsory",
        "accommodation": "Guest houses",
        "best_time":
            "Spring (March to May) and autumn (September to November) are the best seasons for trekking, with clear skies and mild temperatures.",
        "tips":
            "Doing an organized tour through an agency is a good option if you are alone or not confident to do the trek unassisted, it is an easier but more expensive option. Finding porters and guides in Kathmandu is easy, just go to any local agency they will assist you to organize staff for your purposes. The Sherpa guides usually know the trail, best views and area very well. Doing it yourself is not hard and plane, bus, or jeep tickets from Kathmandu to Lukla are the only thing that you have to organize. You follow a very clear main trail, everybody stays in the same little “towns” with many tea houses enjoying sherpa culture, and it is not necessary to book anything."
      }
    }
  ];
}

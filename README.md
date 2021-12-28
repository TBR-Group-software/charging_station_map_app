 <p  align="center ">
 <img width="250" alt="splash" src="https://user-images.githubusercontent.com/86306159/147558747-dadef8d2-f8a7-44af-9753-7ffa055cae3f.png">
</p>


## About the project
The purpose of this project is to develop the mobile application which allows finding the nearby charging stations on the map in New York City using Google Maps API with beautiful neon UI.
<p float="center", align="justify ">
  <img src="https://github.com/TBR-Group-software/charging_station_map_app/blob/main/assets/images/charge_gif1.gif?raw=true" width="250" />
     
  <img src="https://github.com/TBR-Group-software/charging_station_map_app/blob/main/assets/images/charge_gif2.gif?raw=truef" width="250" />
    
</p>

## Features
- Beautiful neon UI.
- Contains Google Maps API.
- Custom Map Style and Map Markers.
- Search nearby charging station on the map.
- Tap to charging point and browse address of charging station.
## Built with
- [Flutter](https://flutter.dev/) - Beautiful native apps in record time.
- [Visual Studio Code](https://code.visualstudio.com/) - Code Editing.
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) - To separate architecture into loosely coupled layers.
- [Flutter BloC](https://pub.dev/packages/flutter_bloc) - State Management for separating the UI from Business Logic.
- [Get It](https://pub.dev/packages/get_it) - Dependency Injection.
- [Google Maps Flutter](https://pub.dev/packages/google_maps_flutter) - Google Maps Package.
- [Custom Info Window](https://pub.dev/packages/custom_info_window) - Custom Info Window for Map Marker.

## Getting Started


**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/TBR-Group-software/charging_station_map_app.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```
**Step 3:**

To launch the application add your Google Maps API and Open Trip API keys in the .env file instead of YOUR_GOOGLE_MAPS_API_KEY and OPEN_TRIP_MAP_API_KEY strings.

```
GOOGLE_MAPS_API_KEY=YOUR_API_KEY
OPEN_TRIP_MAP_API_KEY=YOUR_API_KEY
```

.env file is placed in the root directory of the project


## License
This project is licensed under the GNU GPL v3 License - see the [LICENSE.md](https://github.com/TBR-Group-software/charging_station_map_app/blob/main/LICENSE.md) file for details.

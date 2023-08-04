
![Logo](https://socialify.git.ci/mvishok/RainAPP/image?description=1&descriptionEditable=A%20Flutter%20(Dart)%20alerting%20app%20using%20Open-Meteo%20API%20to%20notify%20rain%20within%09the%20next%20hour&forks=1&issues=1&language=1&name=1&owner=1&pulls=1&stargazers=1&theme=Light)
# RainAPP

RainAPP, built with Flutter (Dart), is a location-based alerting application that keeps you informed about imminent rainfall within the next hour. Using the Geolocator package, it retrieves your coordinates to provide hyper-local weather updates. Powered by the Open-Meteo API, you'll receive real-time weather information and timely alerts, ensuring you stay prepared for changing weather conditions in your specific region.
## Features
 - 🌧️ Receive rain alerts for the upcoming hour in your area
 - 📍 Utilize Geolocator to get your precise coordinates.
 - ⏰ Timely notifications to plan your activities.
 - 🌍 Simple and intuitive interface.
 
## Installnation

To get started with RainAPP, you can follow these simple steps to install the application on your Android device:

1. Download the APK file from [Releases](https://github.com/mvishok/RainAPP/releases/) section of this repository.

2. Once the APK file is downloaded, go to your device's Settings.

3. In the Settings menu, navigate to "Security" or "Privacy" (the name may vary depending on your device).

4. Enable the option "Allow installation from unknown sources." This will allow you to install apps from sources other than the Google Play Store.

5. Use your device's File Manager or a dedicated APK installer app to locate and open the downloaded RainAPP APK file.

6. Follow the on-screen instructions to complete the installation process.

7. After the installation is successful, you can find and launch RainAPP from your device's app drawer.

Please note that RainAPP currently supports only Android devices.
## Technologies Used

- **Flutter (Dart):** RainAPP is developed using the Flutter framework, which allows for cross-platform mobile app development with a single codebase. Dart, a modern and efficient programming language, powers the logic and functionality of the application.

- **Open-Meteo API:** RainAPP integrates with the Open-Meteo API to fetch real-time weather data. This API provides accurate weather forecasts, including information about rainfall, enabling timely alerts to users.

- **Geolocator Package:** To offer a personalized experience, RainAPP utilizes the Geolocator package. This enables the app to access the device's location services and retrieve the user's precise coordinates, providing hyper-local weather updates.
## Run Locally

To run RainAPP locally on your development environment, follow these steps:

**Prerequisites:**

1. Ensure you have Flutter and Dart SDK installed on your system. If not, follow the official installation guide for your operating system: https://flutter.dev/docs/get-started/install

2. Make sure you have Git installed to clone the RainAPP repository.

Steps:

1. Clone the RainAPP repository to your local machine using the following command:
```bash
git clone https://github.com/mvishok/RainAPP.git
```

2. Navigate to the project directory:
```bash
cd RainAPP
```

3. Fetch the required dependencies using Flutter:
```bash
flutter pub get
```

4. Connect your Android device to your computer using a USB cable and enable USB debugging on the device.

5. To run the app on your connected Android device, execute the following command:
```bash
flutter run
```
Alternatively, you can use an Android emulator or iOS simulator by opening them before running the app.

6. The app should now be running on your device or emulator, providing real-time weather updates and alerts for imminent rainfall within the next hour based on your current location.

Please note that RainAPP uses the Open-Meteo API to fetch weather data, and it may require an internet connection to function properly.

Feel free to explore and test the app locally, and if you encounter any issues or have any suggestions, you can contribute to the project by opening pull requests or filing bug reports on the GitHub repository. Happy coding! 🚀
## License

[Apache-2.0](https://github.com/mvishok/RainAPP/blob/main/LICENSE)


## Author

👤 **Vishok M**

* Website: https://vishok.tech/
* Twitter: [@vishokmanikantan](https://twitter.com/vishokmanikantan)
* Github: [@mvishok](https://github.com/mvishok)
* LinkedIn: [@vishokmanikantan](https://linkedin.com/in/vishokmanikantan)

## Support

For support, please use the repository [Issues](https://github.com/mvishok/pricenet/issues) channel.

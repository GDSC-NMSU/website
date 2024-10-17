
# Flutter Web Project

This project is a Flutter-based website with two main pages: a Members page and a Member profile page. It lists club members with links to individual profiles and includes resume, project links, and favorite images.

## Installation Instructions

### 1. Prerequisites

Before you start, make sure you have the following tools installed on your machine:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (with web support)
- [Dart SDK](https://dart.dev/get-dart) (comes with Flutter)
- [Chrome Browser](https://www.google.com/chrome/) (for web development)

Ensure Flutter is properly installed and web support is enabled:

```bash
flutter --version
flutter config --enable-web
```

### 2. Clone the Repository

Clone this project to your local machine:

```bash
git clone https://github.com/GDSC-NMSU/website/tree/members
cd your-flutter-web-project
```

### 3. Install Dependencies

Install the required packages and dependencies by running:

```bash
flutter pub get
```

### 4. Run the Project

To run the project on your local development server (Chrome browser by default), use the following command:

```bash
flutter run -d chrome
```

This will launch your project in a new browser window.

### 5. Clean Build (Optional)

If you encounter any issues or changes don't reflect as expected, you may want to clean the build and re-fetch dependencies:

```bash
flutter clean
flutter pub get
```

## Notes

- **Web Version**: This project is built specifically for the web, but it can be adapted for mobile and desktop as well.
- **Launching URLs**: Make sure to use `https://` URLs when testing the hyperlink functionality on the web.

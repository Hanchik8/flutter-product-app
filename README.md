# Product App

A simple Flutter app that loads products from DummyJSON.

- Product list and product details
- Server requests with Dio
- State management with Bloc

## Run

```bash
flutter pub get
flutter run
```

The app needs an internet connection. API: https://dummyjson.com/products

## Run with Docker

```bash
docker build -t product-app .
docker run --rm -p 127.0.0.1:8080:8080 product-app
```

Open http://localhost:8080 in a browser. Press Ctrl+C to stop the container.
The container runs the Flutter web app; product data still comes from DummyJSON.

The first build downloads the Flutter image. Starting the container also compiles the web app and may take a few minutes.

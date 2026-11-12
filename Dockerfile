FROM ghcr.io/cirruslabs/flutter:3.41.2

WORKDIR /app

COPY pubspec.yaml pubspec.lock ./
RUN flutter --no-version-check pub get

COPY lib ./lib
COPY web ./web
COPY analysis_options.yaml ./

EXPOSE 8080

CMD ["flutter", "--no-version-check", "run", "--no-pub", "-d", "web-server", "--web-hostname", "0.0.0.0", "--web-port", "8080", "--release"]

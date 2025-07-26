
# 🌍 GsmPay Interview Task – Flutter Application
A Flutter-based mobile application built as part of the GsmPay interview process. The app follows clean architecture principles with modular and testable code.

- Start time: 12:30 - 1404/05/04
- End time: 18:00 - 1404/05/04
- Preview Video
```bash
https://drive.google.com/file/d/1iA9KLQGHRO0-7WTx8it3XWQezLVxFGnd/view?usp=sharing
```

## 🛠 Setup & Installation

### Prerequisites
- Flutter SDK
- Dart
- Android Studio / VS Code
- Emulator or real device

### Installation Steps

- Clone the project
```bash
https://github.com/AliEasy/flutter_gsmpay_interview.git
```
- Install dependencies
```bash
flutter pub get
```
- Generate code
```bash
dart run build_runner build --delete-conflicting-outputs
```
- Generate l10n code
```bash
dart run intl_utils:generate
```

- Run The app

## 🧱 Built With

### Architecture
This project uses **Clean Architecture** to separate responsibilities across layers:

- **Presentation Layer**: Flutter UI + Cubit (Bloc)

- **Domain Layer**: Entities + UseCases (Business Logic)

- **Data Layer**: Repositories + Remote APIs (Fake Api Call)

### Key Choices
- **State Management**: Cubit for simple & predictable state handling.

- **Dependency Injection**: injectable + get_it for scalable service location.

- **Data Models & Immutability**: freezed for concise data classes and union types.

- **Localization**: intl with .arb files, supporting multi-language extensibility.
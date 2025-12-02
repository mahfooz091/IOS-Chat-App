# IOS-Chat-App

A simple, clean iOS chat application built with Swift. This repository contains an Xcode project (`ChatApp`) and uses CocoaPods for dependency management. The app demonstrates a basic chat UI, message handling, and project structure for building a messaging client.

---

## Features

* Basic one-to-one chat UI (send/receive messages)
* Local message persistence (if implemented in project)
* Uses CocoaPods (Pods folder present)
* Ready to integrate with backends (Firebase, custom API, etc.)

> *Note: This README is a general-purpose template. Replace placeholders below (like backend setup or screenshots) with project-specific details.*

---

## Requirements

* macOS with Xcode (recommended Xcode 14+ or 15+)
* iOS 14+ (adjust according to your project settings)
* Swift 5+
* CocoaPods installed (`gem install cocoapods`) or use Swift Package Manager if project is configured for it

---

## Quick Start

1. **Clone the repository**

```bash
git clone git@github.com:mahfooz091/IOS-Chat-App.git
cd IOS-Chat-App
```

2. **Install dependencies (CocoaPods)**

```bash
pod install
```

> If the project uses CocoaPods, open the workspace file. If the project uses SPM, follow Xcode package instructions.

3. **Open Xcode workspace**

```bash
open ChatApp.xcworkspace
```

4. **Configure backend (if any)**

* If using Firebase: add `GoogleService-Info.plist` to the project and enable the required services (Auth, Firestore/Realtime DB, Storage).
* If using a custom backend: update the network configuration and API keys in the appropriate config file.

5. **Select a simulator/device and run (⌘R)**

---

## Project Structure (example)

```
IOS-Chat-App/
├─ ChatApp/                # Xcode project source
├─ ChatApp.xcworkspace     # Workspace (open this)
├─ Pods/                   # CocoaPods dependencies
├─ Podfile
├─ Podfile.lock
└─ README.md
```

---

## Common Commands

* Install pods: `pod install`
* Open workspace: `open ChatApp.xcworkspace`
* Clean build folder in Xcode: `Shift + Cmd + K`

---

## Screenshots

<img width="369" height="795" alt="Screenshot 2025-12-02 at 22 42 02" src="https://github.com/user-attachments/assets/88eb1752-61da-449a-862e-b05f43750fbf" />
<img width="368" height="799" alt="Screenshot 2025-12-02 at 22 42 23" src="https://github.com/user-attachments/assets/f1eb230a-bfe5-4b1d-8e3b-af4005ecedef" />
<img width="762" height="668" alt="Screenshot 2025-12-02 at 22 45 47" src="https://github.com/user-attachments/assets/14b7a099-5371-462e-823f-fe6409e869a5" />


---

## Troubleshooting

* If you see build errors after installing pods, try cleaning the build folder: `Shift + Cmd + K` and then `Cmd + B` to rebuild.
* If CocoaPods throws errors, run `pod repo update` then `pod install` again.

---

## Contributing

Contributions are welcome. Please open an issue or submit a pull request.

---

## Contact

Maintainer: `mahfooz091`.

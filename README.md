# Swift Keyboard Notifications

A UIKit practice project demonstrating how to observe keyboard events and adjust the interface dynamically using `NotificationCenter`.

## Overview

This project explores how iOS applications can respond to keyboard visibility changes while keeping text input accessible and maintaining a clean observer lifecycle.

## Features

- Observe keyboard appearance and dismissal notifications.
- Adjust the text field's position to prevent it from being obscured by the keyboard.
- Animate layout changes using Auto Layout constraints.
- Restore the original layout when the keyboard is hidden.
- Dismiss the keyboard by tapping outside the text field or pressing Return.
- Remove notification observers when the view controller is deallocated.

## Technologies

- Swift
- UIKit
- Storyboards
- NotificationCenter
- Auto Layout
- Xcode

## Project Structure

```text
SwiftKeyboardNotification/
├── AppDelegate.swift
├── SceneDelegate.swift
├── Main.storyboard
├── ViewControllers/
│   └── KeyboardViewController.swift
├── Assets.xcassets/
└── Info.plist
```

*Note: Update this tree if your actual Xcode project uses different file names or folders.*

## How It Works

1. The view controller registers for keyboard-related notifications.
2. When the keyboard appears or changes its frame, the controller calculates the overlap and updates the text field's bottom constraint.
3. The layout change is animated to provide a smoother user experience.
4. When the keyboard is dismissed, the original constraint value is restored.
5. The view controller removes its observers in `deinit` to prevent unnecessary observer registrations from remaining active.

## How to Run

1. Clone this repository.
2. Open `SwiftKeyboardNotification.xcodeproj` in Xcode.
3. Select an iOS Simulator or a connected device.
4. Build and run the application.
5. Tap the text field to display the keyboard and verify that the interface adjusts correctly.

## Learning Objectives

- Understand keyboard notifications in UIKit.
- Use `NotificationCenter` to respond to system events.
- Update Auto Layout constraints programmatically.
- Animate interface changes.
- Manage notification observer lifecycles.

## Autor

👨🏻‍💻 Erik Valencia Cardona

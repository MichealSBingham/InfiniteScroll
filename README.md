# Whop iOS Take Home

## Overview

This project is a SwiftUI-based iOS app that features an infinitely scrollable list view. Each row can either open a web view or expand to show more clickable web view rows. The app demonstrates SwiftUI skills, UI interaction handling, and state management.

## Running Instructions

1. Open the project in Xcode.
2. Set the deployment target to iOS 16.
3. Run the app on a simulator or a physical device.

## Features

- Infinitely scrollable list
- Expandable folders
- WKWebView integration
- Smooth animations
- State management with `@State`, `@ObservedObject`
- Accessibility support for VoiceOver

## Project Structure

- **Model**: Defines the data structure.
- **ViewModel**: Handles the state management and logic.
- **Views**: Contains the UI components.

## Code Highlights

### Model

```swift
import Foundation

enum ListItemType: Equatable {
    case link(url: String)
    case folder(items: [ListItem])
}

struct ListItem: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let type: ListItemType
    var isExpanded: Bool = false
    
    static func ==(lhs: ListItem, rhs: ListItem) -> Bool {
        return lhs.title == rhs.title && lhs.type == rhs.type && lhs.isExpanded == rhs.isExpanded
    }
}

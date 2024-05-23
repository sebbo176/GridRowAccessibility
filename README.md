# SwiftUI Grid VoiceOver Demo

This repository contains a demo project that shows how to enable VoiceOver for individual rows in a SwiftUI Grid. Since `.accessibilityElement` cannot be used directly on layout containers like GridRows, the solution utilizes the `.accessibilityRepresentation` modifier to achieve the desired accessibility behavior.

## Features

- **VoiceOver support per GridRow**: Ensures that each row in the SwiftUI Grid can be independently accessed by VoiceOver.
- **Custom accessibility elements**: Demonstrates how to use a `VStack` with `.color.clear` and `accessibilityLabels` to represent the content of each row.

## Requirements

- iOS 14.0+
- Xcode 12.0+
- SwiftUI

## Installation

Clone the repository to your local machine:

```bash
git clone https://github.com/sebbo176/GridRowAccessibility.git
cd GridRowAccessibility
```

Open the project in Xcode:

```bash
open GridTest.xcodeproj
```

Build and run the project on your preferred iOS device or simulator.

## Usage

This demo project includes a SwiftUI view that implements a grid with VoiceOver support per row. The key implementation details are as follows:

### Grid Implementation

The grid is implemented using SwiftUI's `Grid` layout, with each row represented by a `GridRow`.

### Accessibility Implementation

To enable VoiceOver support for each row, the `.accessibilityRepresentation` modifier is used. Here is an example of how this is achieved:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        Grid {
            ForEach(dataFromViewModel) {
                gridRow(title: $0.value)
            }
        }
        .accessibilityRepresentation {
            VStack(spacing: 0) {
                ForEach(dataFromViewModel) {
                    Color.clear
                        .accessibilityLabel($0.accessibilityValue)
                }
            }
        }
    }
}
```

### How It Works

- **Grid and GridRow**: The `Grid` and `GridRow` are used to layout the items.
- **.accessibilityRepresentation**: This modifier is applied to each `GridRow`, creating a `VStack` with a `Color.clear` element.
- **.accessibilityLabel**: The `VStack` is assigned an `accessibilityLabel` to describe the content of each row.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contributing

Contributions are welcome! If you have suggestions or improvements, please create a pull request or open an issue.

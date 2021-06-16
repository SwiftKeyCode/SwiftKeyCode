# KeyCode

A Framework for creating presentations using SwiftUI.

## Setup

When using LatTeX views from this package, make sure the "outgoing connections" capability is enabled. While there are no outgoing connections, this capability is required to launch WKWebView even with local strings.

## How To Use

First, include this package. Best, you start with a theme (ToDo).

When your project is set up, you can navigate the presentation as such:

* **→ right arrow** | next slide / step
* **← left arrow** | previous slide / step

Hold one of the following modifiers for animation modification:

* **⌥ option** | animate slowly
* **⌘ command** | animate even more slowly
* **⇧ shift** | no animation

Note that as opposed to normal presentation programs, you can easily skip through your presentation holding left or right. SwiftUI is pretty good at state interpolation.

## Project Structure

This package contains two categories of classes: Those necessary for holding any presentation, and some utility functions common in many presentations. I recommend looking through a template to get an idea, as currently, no great documentation exists. I may follow up on this.

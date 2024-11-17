# HoloWeb

## Description

HoloWeb is an iOS application with AppClip integration that enables WebXR AR experiences on iOS devices, bridging a fundamental platform limitation since WebXR is not supported in Safari iOS. It offers two distinct modes:

* Handheld AR Mode: Users can experience WebXR content through their iPhone's screen using ARKit, allowing them to view and interact with 3D content overlaid on the real world.

* Stereoscopic AR Mode: When paired with a [HoloKit](https://holokit.io) headset, HoloWeb delivers an immersive mixed reality experience by splitting the screen into stereoscopic views, creating true depth perception and hands-free AR interactions.

The AppClip integration ensures instant access to these experiences without requiring a full app installation.

## Background

WebXR is not supported on Safari for iOS, at least up to iOS 18.

While Safari on visionOS 2 (Apple Vision Pro) supports WebXR for VR experiences, it doesn't support AR sessions.

For iOS, WebXR support is primarily available through [Mozilla's WebXR Viewer app](https://github.com/mozilla-mobile/webxr-ios/), which hasn't been updated in several years.

## Motivation

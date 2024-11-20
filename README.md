# HoloWeb

## WIP

Alert: This repository is a work in progress and is not yet functional.

The author, [Botao Amber Hu](https://botao.hu/), is currently occupied with PhD applications and unable to continue development at this time. We're seeking assistance with this project. If you're interested in collaborating, please apply for our [WebXR+iOS Engineer position](https://www.notion.so/Reality-Design-Lab-is-looking-for-WebXR-iOS-Engineer-1405c6192b7e8057ba5bf73bf375e3ff?pvs=21). This is a bounty-based opportunity -- complete the project to earn the reward ($10,000)!
[Collaborate with us](https://reality.design/collab-with-us)

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

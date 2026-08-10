# Vrmon

Pokemon in VR

---

This is simply me playing around with VR game dev using LOVR. A project just for funzies.

## Building/Running

### 1. Install dependencies

| Dependency                                     |                                                |
| ---------------------------------------------- | ---------------------------------------------- |
| [Lua](https://lua.org/)                        | Language used for development                  |
| [LOVR](https://lovr.org/)                      | Like [LOVE2D](https://love2d.org/), but for VR |
| [ADB](https://developer.android.com/tools/adb) | To install the game onto headset               |
| [Just](https://github.com/casey/just)          | _(Optional)_ Simplified scripts                |

### 2. Build and run code

Ensure you have LOVR and ADB set up on your PC, as well as have the [LOVR apk](<https://lovr.org/docs/Getting_Started_(Quest)>) installed on your headset.

#### Method 1: Just

`just rebuild`

#### Method 2: Direct

`adb -s <your-device-id> push --sync . /sdcard/Android/data/org.lovr.app/files`

SOURCE: [LOVR Docs](<https://lovr.org/docs/Getting_Started_(Quest)>)

## Supported Platforms

Currently only being ran and tested on [NixOS](https://nixos.org/) and the [Meta Quest 3s](https://www.meta.com/quest/quest-3s/). Support for other platforms may vary. For guidance with NixOS setup, feel free to checkout my [config](https://github.com/WeebNetsu/nixos-config).

# Vrmon

Pokemon in VR

---

This is simply me playing around with VR game dev using LOVR. A project just for funzies.

## Building/Running

### 1. Install Project dependencies

| Dependency                                     | Description                                    |
| ---------------------------------------------- | ---------------------------------------------- |
| [Lua](https://lua.org/)                        | Language used for development                  |
| [LOVR](https://lovr.org/)                      | Like [LOVE2D](https://love2d.org/), but for VR |
| [ADB](https://developer.android.com/tools/adb) | To install the game onto headset               |
| [Just](https://github.com/casey/just)          | _(Optional)_ Simplified scripts                |

<!-- | [LuaRocks](https://luarocks.org/)              | To install dependencies                        | -->

### 2. Build and Run

Ensure you have LOVR and ADB set up on your PC, as well as have the [LOVR apk](<https://lovr.org/docs/Getting_Started_(Quest)>) installed on your headset.

<!-- #### Step 1: Install LuaRocks Dependencies

| Dependency                                       | Description                             |
| ------------------------------------------------ | --------------------------------------- |
| [UUID](https://luarocks.org/modules/tieske/uuid) | Generate UUIDs to keep track of objects |

##### Method 1: Just

`just install-deps`

##### Method 2: Direct

`luarocks install <list out all deps here>`

#### Step 2: Run The Code -->

#### Method 1: Just

`just rebuild`

#### Method 2: Direct

`adb -s <your-device-id> push --sync . /sdcard/Android/data/org.lovr.app/files`

SOURCE: [LOVR Docs](<https://lovr.org/docs/Getting_Started_(Quest)>)

## Supported Platforms

Currently only being ran and tested on [NixOS](https://nixos.org/) and the [Meta Quest 3s](https://www.meta.com/quest/quest-3s/). Support for other platforms may vary. For guidance with NixOS setup, feel free to checkout my [config](https://github.com/WeebNetsu/nixos-config).

---

If you want to support the work I do, please consider donating to me on one of these platforms:

[<img alt="YouTube" src="https://img.shields.io/badge/-YouTube%20Member-CD201F?style=flat-square&logo=youtube&logoColor=white" />](https://youtube.com/@stevesteacher/join)
[<img alt="kofi" src="https://img.shields.io/badge/-Kofi-7648BB?style=flat-square&logo=ko-fi&logoColor=white" />](https://ko-fi.com/stevesteacher)
[<img alt="liberapay" src="https://img.shields.io/badge/-LiberaPay-EBC018?style=flat-square&logo=liberapay&logoColor=white" />](https://liberapay.com/stevesteacher/)
[<img alt="paypal" src="https://img.shields.io/badge/-PayPal-0c1a55?style=flat-square&logo=paypal&logoColor=white" />](https://www.paypal.com/donate/?hosted_button_id=P9V2M4Q6WYHR8)

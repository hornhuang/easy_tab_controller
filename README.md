# easy_tab_controller

A user-friendly TabBarController widget for flutter developer.

![](https://github.com/hornhuang/PictureRepository/blob/master/easy_tab_controller/code-snapshot.png)

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

The plugin project was generated without specifying the `--platforms` flag, no platforms are currently supported.
To add platforms, run `flutter create -t plugin --platforms <platforms> .` under the same
directory. You can also find a detailed instruction on how to add platforms in the `pubspec.yaml` at https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

## Installing

This will add a line like this to your package's pubspec.yaml (and run an implicit dart pub get):

```
dependencies:
  easy_tab_controller: ^1.0.1
```

## Using

You can see more information in example

```
    EasyTabController(
      location: WebTabLocation.left,
      tabs: [
        TabItemBuilder(
          icon: Icon(Icons.directions_car),
          title: "Android",
        ),
        TabItemBuilder(
          icon: Icon(Icons.directions_bike),
          title: "iOS",
        ),
      ],
      body:[
        Center(
          child: Text(""),
        ),
        Center(
          child: Text(""),
        ),
      ],
    );
```

## Preview

Welcome to my person website: [hornhuang.github.io](https://hornhuang.github.io/#/?pg=trend&) you can see it when your browser become narrow ～

<table border="0">
    <tr>
        <td><img src="https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/81cc5a302ad54ccf8ae2fbd1e7ca6187~tplv-k3u1fbpfcp-watermark.image" ></td>
        <td><img src="https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/81cc5a302ad54ccf8ae2fbd1e7ca6187~tplv-k3u1fbpfcp-watermark.image" ></td>
        <td><img src="https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/81cc5a302ad54ccf8ae2fbd1e7ca6187~tplv-k3u1fbpfcp-watermark.image" ></td>
        <td><img src="https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/81cc5a302ad54ccf8ae2fbd1e7ca6187~tplv-k3u1fbpfcp-watermark.image" ></td>
    </tr>
    <tr>
        <td><img src="https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/81cc5a302ad54ccf8ae2fbd1e7ca6187~tplv-k3u1fbpfcp-watermark.image" ></td>
        <td><img src="https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/81cc5a302ad54ccf8ae2fbd1e7ca6187~tplv-k3u1fbpfcp-watermark.image" ></td>
        <td><img src="https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/81cc5a302ad54ccf8ae2fbd1e7ca6187~tplv-k3u1fbpfcp-watermark.image" ></td>
        <td><img src="https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/81cc5a302ad54ccf8ae2fbd1e7ca6187~tplv-k3u1fbpfcp-watermark.image" ></td>
    </tr>
</table>

# Version

Here are changes for every version.

## [1.0.1](https://github.com/hornhuang/easy_tab_controller/releases/tag/1.0.1)
the first version prepare basic functions for you, it not only support tabs click-switch, but also support all direction for tabs shown.
- Page display and switch.
- Direction between tabs and pages.

## [1.0.2](https://github.com/hornhuang/easy_tab_controller/releases/tag/1.0.2)
Good news! i add the example code for you. this version has been support to add placeholder for page (as a background). Even better, you can customize the style of your own tags. 
- Perfect example code.
- Add placeholder to page.
- Users can customize the tab style.

## [1.0.3](https://github.com/hornhuang/easy_tab_controller/releases/tag/1.0.3)
- use get to reconstruction this project.

# MIT License

Copyright (c) 2021 hornhuang

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

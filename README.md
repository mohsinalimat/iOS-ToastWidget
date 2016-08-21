# GZToast

[![CI Status](https://travis-ci.org/SamuelZhaoY/iOS-ToastWidget.svg?branch=master)](https://travis-ci.org/SamuelZhaoY/iOS-ToastWidget.svg?branch=master)
[![Version](https://img.shields.io/cocoapods/v/Toast.svg?style=flat)](http://cocoapods.org/pods/GZToast)
[![License](https://img.shields.io/cocoapods/l/Toast.svg?style=flat)](http://cocoapods.org/pods/GZToast)
[![Platform](https://img.shields.io/cocoapods/p/Toast.svg?style=flat)](http://cocoapods.org/pods/GZToast)

GZToast is a toast widget which enabe user to build up toast view in iOS apps with three common default styles. At the same time, developer can also easily insert an customized toasting content of one's own. Users can also define popup time and completion callback of one's own.<br/>

This project now support screen rotation. <br/>

What's next: <br/>
- Test cases to be provided.<br/>

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Demo

![ezgif com-resize](https://cloud.githubusercontent.com/assets/8198256/17836603/ac28cbfe-67ca-11e6-9859-8dbd00eaa241.gif)

### Default style1: pure toast in text

```objc
[[GZToastView toastWithText:@"toast style 1"] showForDuration:4
                                                     onCompletion:^{
                                                      NSLog(@"Toast complete");
                                                     }];
```

### Default style2:

```objc
[[GZToastView toastWithText:@"toast style 2: icon with corresponding toast description. Adding the long desc to see the overall layout."
                          icon:[UIImage imageNamed:@"Icon.png"]]
     showForDuration:4
        onCompletion:^{
            NSLog(@"Toast complete");
     }];
```

### Default style3:
```objc
[[GZToastView toastWithText:@"toast style 3: icon with corresponding toast description. Adding the long desc to see the overall layout."
                          icon:[UIImage imageNamed:@"Icon.png"]
                         title:@"Title"]
     showForDuration:4
     onCompletion:^{
         NSLog(@"Toast complete");
     }];
```

### Customized style:
```objc
UIActivityIndicatorView* indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    indicator.frame = CGRectMake(0, 0, 55, 55);
    [indicator startAnimating];
    [[GZToastView toastWithCustomizedContent:indicator] showForDuration:4
                                                           onCompletion:^{
                                                               NSLog(@"Toast complete");
                                                               [indicator stopAnimating];
                                                           }];
```

## Feature list

- Support default toast style: Pure Text Toast/Icon + Toast Text/Icon + Toast title + Toast Text
- Work well with customized toast content
- Auto support screen rotation
- Provide option for bottom style/centeral popup in screen
- Provide different types of animation

## Screen Shot

<div style="border:none;overflow:auto;max-width:800px">
<table style="border:none;width:640px;table-layout:fixed"> 
<tr style="border:none;padding:8px;background-color:#dddddd">
    <td style="border:none;padding:8px"><img src="https://cloud.githubusercontent.com/assets/8198256/17829286/e85aad3e-66dc-11e6-8f46-26e465452a99.png" alt="HTML5 Icon" width="320px" height="500px"></td>
	<td style="border:none;padding:8px"><img src="https://cloud.githubusercontent.com/assets/8198256/17829289/ea0ded30-66dc-11e6-90e5-b5b35b06a278.png" alt="HTML5 Icon" width="320px" height="500px"></td>
</tr>
<tr style="border:none;padding:8px;background-color:#dddddd">
	<td style="border:none;padding:8px"><img src="https://cloud.githubusercontent.com/assets/8198256/17829303/34e0146e-66dd-11e6-9e3f-2c7973520704.png" alt="HTML5 Icon" width="320px" height="500px"></td>
	  <td style="border:none;padding:8px"><img src="https://cloud.githubusercontent.com/assets/8198256/17829287/e93eea3a-66dc-11e6-86ac-ae49fc000900.png" alt="HTML5 Icon" width="320px" height="500px"></td>
</tr>
<tr style="border:none;padding:8px;background-color:#dddddd">
	<td style="border:none;padding:8px"><img src="https://cloud.githubusercontent.com/assets/8198256/17829291/ea235968-66dc-11e6-8afe-14ddc404a782.png" alt="HTML5 Icon" width="320px" height="500px"></td>
	<td style="border:none;padding:8px"><img src="https://cloud.githubusercontent.com/assets/8198256/17829288/e96b1b5a-66dc-11e6-84fc-9c5cc8e2cf47.png" alt="HTML5 Icon" width="320px" height="500px"></td>
</tr>

</table>
</div>

## Installation

### CocoaPods

Toast is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "GZToast"
```

### Source

Since this is a small project, you can also copy the source code: <br/>
<br/>
GZToastView.h <br/>
GZToastView.m <br/>

to you project.

## 

samuel.zhao.yue, samuel.zhao.yue@live.com

## License

Toast is available under the MIT license. See the LICENSE file for more info.

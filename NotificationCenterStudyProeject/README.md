# [Swift] NotificationCenter

### 애플 공식 문서자료

---



```
Class
NotificationCenter
등록된 관찰자에게 정보를 알려줄 수 있는 알림 발송 메커니즘 클래스 입니다.
```

- 정의

```swift
class NotificationCenter: NSObject
```

- 개요

  객체는 알림을 받기 위해서 알림센터에 등로합니다. 등록할 때, 사용하는 메소드는 다음과 같습니다.

  1. addObserver(_:selector:name:object)
  2. addObserver(forName:object:queue:using)

  객체가 관찰자로 등록 되었다면, 알림을 받을 수 있습니다.

  앱을 실행할 때, 실행할 때마다 하나의 알림센터를 가집니다. 그 때 default로 설정된 알림센터를 가지게 됩니다. 그리고 커스텀을 원한다면 커스터마이징은 가능합니다.

- 하나의 알림센터는 오직 하나의 프로그램에서만 알림을 전달할 수 있습니다. 만약 다른 프로세스에서 알림을 등록하고 싶거나 받고 싶다면 `DistributedNotificationCenter` 를 사용하라고 합니다.

  ~~사용해본경험이 없어서 추가설명은 어려습니다.ㅠ~~



### 내가 사용한 상황

---

혹시 사용하시는 분이 도움이 될까하여 올려봅니다. (일부 로직이 부족할 수 있습니다. 혹시 보이신다면 조언부탁드립니다!)

#### Q. 동영상 종료 시점에 호출될 메소드를 찾아서, print문으로 "DEBUG: 영상이 종료되었습니다."를 호출하라.

- Solution

```markdown
1. AVPlayer이든 AVPlayerViewController(Delegate) 객체 내부에 있는 메소드에서 영상이 종료된 시점에 호출되는 메소드를 찾는다.
1. -> True : 찾았다면, 그 메소드 내부에 print("DEBUG: 영상이 종료되었습니다.") 코드를 작성한다.
1. -> false: 몾찾았다면, `timeSlider.maximumValue = Float(seconds)` 에서 maximumValue와 일치하거나 그것보다 값이 커진 경우에 커스텀메소드(직접만든 메소드)를 호출한다.
```

```swift
11:46
상황)
1. AVPlayer나 AVPlayerViewController 자체에 종료 시, 호출되는 메소드를 못 찾았다.
2. 그래서 대안으로 NotificationCenter를 통해서 해결하려고 한다.
3. 내가 NotificationCenter를 활용해본 경험이 없어서 위 블로그를 참조해서 구현하려고 한다.
4. 만약 구현을 했다고 가정하면 로직은 다음과 같다.
	a. NotificationCenter에 Notification을 명명한다.
		-> "AVPlayerItemDidPlayToEndTime"

	b. AVPlayer에 관찰자를 추가한다. (사용 메소드: addObserver) 
		-> "viewDidLoad"에 추가한다.

	c. `timeSlider.maximumValue = Float(seconds)` 값을 활용하여, if 절을 구성한다.
		-> "self.player.addPeriodicTimeObserver"에 if 절을 구현한다.

	b. if절의 조건문은 if (maximumValue == time.seconds) 로 설정한다.

	e. 종료 시, print("DEBUG: 영상이 종료되었습니다.") 를 호출해본다.
```



### 참고)

---

https://jiseobkim.github.io/swift/2018/10/27/swift-NotificationCenter.html 
-> 상당히 잘 정리된 글로 큰 도움을 받았습니다.




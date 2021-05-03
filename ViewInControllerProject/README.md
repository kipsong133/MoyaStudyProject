# View 안에 Controller 추가 예제

프로젝트를 수행하다보면, View안에 Controller를 넣어야하는 경우가 있습니다.

그럴 경우, 해당 프로젝트를 유용하게 사용하시면 좋을 것 같습니다.



### 구조

---

- ViewController.swift
  - DetailView
    - DetailController.swift
- SecondController.swift



"ViewController" 와 "SecondController" 가 계층구조로 최상위에 위치하고 있습니다.

ViewController의 하위에 DetailView가 있으며 해당 View에 DetailController가 추가된 구조입니다.
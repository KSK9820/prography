## 프로젝트 개요

> Prography 사전 과제
Unsplash API를 이용해서 사진 썸네일 목록들(List photos), 디테일 포토(get a photo), 랜덤 사진 카드(get a random photo)를 구현 함.
> 
- Target version: 17.0
- Framework: Combine, SwiftUI
<br/>

## 구현 영상

- Device: iPhone 15 Pro
<br/>

## 프로젝트 파일 구조

```
.
├── Prography
│   ├── Assets.xcassets
│   │   ├── Contents.json
│   ├── Cache
│   │   ├── ImageCacheLoader.swift
│   │   └── ImageCacher.swift
│   ├── ContentView.swift
│   ├── Extension
│   │   ├── Extension+UINavigationController.swift
│   │   ├── Extension+UITabBarController.swift
│   │   └── Extensioni+View.swift
│   ├── Info.plist
│   ├── ModelDTO
│   │   └── PhotoDTO.swift
│   ├── Network
│   │   ├── HTTPPublisher
│   │   │   └── HTTPPublishable.swift
│   │   ├── HTTPRequest
│   │   │   ├── HTTPRequestable.swift
│   │   │   └── UnsplashRequest.swift
│   │   └── HTTPService
│   │       ├── HTTPServicable.swift
│   │       └── HTTPService.swift
│   ├── Preview Content
│   │   └── Preview Assets.xcassets
│   │       └── Contents.json
│   ├── PrographyApp.swift
│   ├── VIew
│   │   ├── CacheImageView.swift
│   │   ├── Cell
│   │   │   ├── BookmarkImageCell.swift
│   │   │   ├── RandomPhotoImageCell.swift
│   │   │   └── RecentImageCell.swift
│   │   ├── MainView.swift
│   │   ├── PhotoDetailView.swift
│   │   └── RandomPhotoView.swift
│   └── ViewModel
│       ├── CellViewModel
│       │   ├── RandomPhotoImageCellViewModel.swift
│       │   └── RecentImageCellViewModel.swift
│       ├── MainViewModel.swift
│       ├── RandomPhotoViewModel.swift
│       └── photoDetailViewModel.swift
└── Prography.xcodeproj
```
<br/>

## 객체의 역할

### Cache

| 이름 | 타입 | 내용 |
| --- | --- | --- |
| ImageCacher | final class | 캐시 구현 |
| ImageCacheLoader | final class | 구현한 ImageCacher를 사용해서, 캐시에 url에 대한 이미지가 있으면 캐시에서 이미지를 가져오고, 없다면 네트워크 통신 및 캐시 저장 |
| CacheImageVIew | struct | Cache ImageView의 재사용을 위한 컴포넌트 |

### View & ViewModel

- ContentView > MainView, RandomPhotoView
    - MainView(MainViewModel) > RecentImageCell(RecentImageCellViewModel), BookMarkImageCell, PhotoDetailView(photoDetailViewModel)
    - RandomPhotoView(RandomPhotoViewModel) > RandomPhotoImageCell(RandomPhotoImageCellViewModel)

### DTO

- PhotoDTO: 사용하는 url 모두 response data를 같은 모델 타입을 사용

### Network

| 이름 | 타입 | 내용 |
| --- | --- | --- |
| HTTPPublisher
> HTTPPublishable | protocol | Unspalsh API와 네트워크 통신 |
| HTTPRequest
> HTTPRequestable | protocol | Request 생성 |
| HTTPRequest
> UnsplashRequest | Enum | HTTPReqeustable을 준수하는 concrete 객체 |
| HTTPService
> HTTPServicable | protocol | 생성된 request로 API 통신을 호출하고, 결과를 decode하는 객체 |
| HTTPService
> HTTPService | final class | HTTPServicable을 채택한 concrete 객체 |

### Extension

- UINavigationController
- UITabBarController
- View
<br/>

## Trouble Shooting

- 매번 Image를 request할 때 발생하는 비용이 크기 때문에 Cache를 이용해서 이를 줄이고자 함.
    1. Cache에서 key를 검색하고, value를 저장하는 객체
    2. 캐시에 url에 대한 이미지가 있으면 캐시에서 이미지를 가져오고, 없다면 네트워크 통신 및 캐시 저장하는 객체
    3. 캐시 결과를 보여줄 View
    - 세 단계를 통해서 이미지를 보여줄 수 있다.
    - 이 때 ImageCacher 객체를 매번 생성을 하면 하나의 공통된 Cache를 사용할 수 없기 때문에, 이미지 로드에서 오류가 발생하였다.
        - 해당 부분은 ImageCacher를 매번 생성하지 않고 하나의 Shared Singleton을 사용하는 방법으로 수정하여 오류를 해결하였다.
- RandomPhotoView에서 Button을 누를 시에 Scroll이 재생성되는 오류가 있다.
    - 이는 Cell을 생성하는 ForEach문이 재호출되기 때문(추후 수정 예정)

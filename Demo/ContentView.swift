import SwiftUI
import MapKit
import WebKit
//主頁
struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .ignoresSafeArea()
                Text("Shiba")
                    .font(.custom("Chalkduster", size: 75))
                    .foregroundColor(.yellow)
                    .shadow(color: .black, radius: 3, x: 5, y: 5) // 增加陰影效果
                    .padding()
                    .cornerRadius(10)
                    .padding(.bottom, 870.0)
                Text("Inu")
                    .font(.custom("Chalkduster", size: 75))
                    .foregroundColor(.yellow)
                    .shadow(color: .black, radius: 3, x: 5, y: 5) // 增加陰影效果
                    .padding()
                    .cornerRadius(10)
                    .padding(.bottom, 720.0)
                Image("page")
                    .padding(.bottom, 190.0)
                NavigationLink(destination: NextPage()) {
                    Text(">")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .padding(.top, 500.0)
                        .cornerRadius(20)
                }
                
            }
            .navigationTitle("")
        }
    }
}
//下一頁
struct NextPage: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
            ZStack {
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .ignoresSafeArea()
                
                ScrollView(.vertical) {
                    Introduction()
                        .padding()
                }
                .padding()
            }
            .navigationBarBackButtonHidden(true) // 隐藏默认返回按钮
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss() // 返回上一页
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black) // 设定返回按钮颜色
                    .font(.title)
            })
            .navigationTitle("")
    }
}
//簡介
struct Introduction: View {
    var body: some View {
            VStack {
                Image("Shiba")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 270, height: 270)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.brown, lineWidth: 10)
                    )
                    .shadow(radius: 10)
                    .clipped()
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading) {
                    Text("簡介柴犬")
                        .font(.largeTitle)
                        .bold()
                        .padding(.leading, 10)
                    
                    Text("柴犬英文叫做ShibaInu，在台灣是不少人喜愛的犬種之一，但最初是被培育成狩獵小型動物的獵犬據說早期的柴犬外觀和樣貌比現在更為多樣化，是因為二戰期間饑荒和犬瘟疫影響下，讓當時的柴犬幾乎滅絕。")
                        .frame(width: 380)
                        .padding(.leading, 15)
                    
                    Text("不同顏色和品種的柴柴")
                        .bold()
                        .font(.largeTitle)
                        .padding(.leading, 10)
                        .padding(.top, 10)
                    
                    ScrollView(.horizontal) {
                        Various()
                    }
                    
                    Text("柴犬各種魔法卡")
                        .bold()
                        .font(.largeTitle)
                        .padding(.leading, 10)
                        .padding(.top, 20)
                    
                    ScrollView(.horizontal) {
                        Card()
                    }
                    Text("柴犬很像吉娃娃的時候")
                        .bold()
                        .font(.largeTitle)
                        .padding(.leading, 10)
                        .padding(.top, 20)
                    VStack{
                        YouTubePlayerWithCoverView(videoURL: "https://youtu.be/fV-BM1nEog8?si=_2mo7STYXXlA5Kql", thumbnailImageName: "giwa")
                        Text("reels:吵架柴")
                            .font(.title3)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.leading)
                    }
                    VStack{
                        YouTubePlayerWithCoverView(videoURL: "https://youtu.be/pY_ZDwPMcvo?si=Wv57CppYMM_S0sEV", thumbnailImageName: "giwa2")
                        Text("reels:罵髒話柴")
                            .font(.title3)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.leading)
                    }
                    VStack{
                        YouTubePlayerWithCoverView(videoURL: "https://youtube.com/shorts/XkvXRRvcF-c?si=z-4W_iRgxPDzJWJ7", thumbnailImageName: "giwa3")
                        Text("reels:颱風天散步柴")
                            .font(.title3)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            .padding()
    }
}

// 子視圖：用於封面和播放 YouTube 影片
struct YouTubePlayerWithCoverView: View {
    var videoURL: String  // 接收完整的 YouTube 影片連結
    var thumbnailImageName: String  // 封面圖片名稱
    @State private var isPlaying = false
    var body: some View {
        VStack {
            if isPlaying {
                // 播放 YouTube 影片
                YouTubePlayerView(videoURL: videoURL)
                    .frame(height: 185)
            } else {
                // 顯示自定義封面圖
                Button(action: {
                    isPlaying = true // 點擊後開始播放影片
                }) {
                    Image(thumbnailImageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width:200,height: 200)
                }
                .padding(.leading, 110.0)
            }
        }
    }
}

// 子視圖：封裝 WKWebView 用於播放影片
struct YouTubePlayerView: UIViewRepresentable {
    var videoURL: String  // 接收完整的 YouTube 影片連結

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // 使用傳入的 YouTube 影片連結
        if let url = URL(string: videoURL) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}

//種類
struct Various: View {
    var body: some View {
        HStack(spacing: 20) {
            VStack {
                Image("red")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(.circle)
                Text("赤柴")
            }
            VStack {
                Image("white")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(.circle)
                Text("白柴")
            }
            VStack {
                Image("black")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(.circle)
                Text("黑柴")
            }
            VStack {
                Image("flax")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(.circle)
                Text("胡麻柴")
            }
            VStack {
                Image("meinon")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(.circle)
                Text("美濃柴")
            }
            VStack {
                Image("xin")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(.circle)
                Text("信州柴")
            }
            VStack {
                Image("mon")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(.circle)
                Text("山陰柴")
            }
        }
        .padding(.leading, 15)
        .frame(minWidth: UIScreen.main.bounds.width * 2)
    }
}
//魔法卡
struct Card: View {
    // 使用 @State 來追踪每個圖片的放大狀態
    @State private var selectedImage: String? = nil // 用來保存被點擊的圖片
    var body: some View {
        ZStack {
            // 當圖片被選中時，背景變暗
            if selectedImage != nil {
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
            }
            HStack(spacing: 60) {
                // 第一張圖片
                Image("magic")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 160, height: 300)
                    .onTapGesture {
                        selectedImage = "magic" // 點擊選中圖片
                    }
                // 第二張圖片
                Image("magic2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 160, height: 300)
                    .onTapGesture {
                        selectedImage = "magic2"
                    }
                // 第三張圖片
                Image("magic3")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 160, height: 300)
                    .onTapGesture {
                        selectedImage = "magic3"
                    }
                // 第四張圖片
                Image("magic4")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 160, height: 300)
                    .onTapGesture {
                        selectedImage = "magic4"
                    }
                // 第五張圖片
                Image("magic5")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 160, height: 300)
                    .onTapGesture {
                        selectedImage = "magic5"
                    }
            }
            .padding(.leading, 60)
            .frame(minWidth: UIScreen.main.bounds.width * 2)
            // 全屏圖片顯示
            if let selectedImage = selectedImage {
                Image(selectedImage)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height) // 占滿全屏
                    .background(Color.black.opacity(0.8)) // 全屏背景
                    .ignoresSafeArea()
                    .onTapGesture {
                        self.selectedImage = nil // 點擊退出放大模式
                    }
            }
        }
        .animation(.easeInOut(duration: 0.3), value: selectedImage) // 動畫效果
    }
}

#Preview {
    ContentView()
}

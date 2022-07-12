import SwiftUI
import WebKit

struct ContentView: View {
    
    let url = Bundle.main.url(forResource: "demo", withExtension: "html")!
    
    var body: some View {
        return ZStack {
            WKWebViewRepresentable(url: self.url)
                .padding(12.0)
        }
        .frame(width: 400.0, height: 400.0)
        .background {
            Color.green
        }
    }
}

public struct WKWebViewRepresentable: NSViewRepresentable {
    
    public init(url: URL) {
        self.url = url
    }
    
    let url: URL
    
    private let configuration: WKWebViewConfiguration = {
        let config = WKWebViewConfiguration()
        config.setValue(false, forKey: "drawsBackground")
        return config
    }()
    
    public func makeNSView(context: Context) -> WKWebView {
        let webView = WKWebView(frame: CGRect.zero, configuration: configuration)
        webView.wantsLayer = true
        return webView
    }
    
    public func updateNSView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: self.url)
        webView.load(request)
    }
}

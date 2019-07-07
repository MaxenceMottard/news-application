//
//  ContentView.swift
//  github-search
//
//  Created by Maxence Mottard on 07/07/2019.
//  Copyright © 2019 Maxence Mottard. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State var networkManager = NetworkManager()
    
    var body: some View {
        
        NavigationView {
            
            List(networkManager.articles.identified(by: \.url)) {
                
                ArticleView(article: $0)
                
            }
            
        }
        
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

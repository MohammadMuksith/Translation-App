//
//  TranslationView.swift
//  Translation App
//
//  Created by Mohammad Muksith on 1/9/23.
//

import SwiftUI
import LibreTranslate


struct TranslationView: View {
    @Binding var text: Scan
    @Binding var translation: String
    @Binding var translator: Translator
    // ^ here you should pass in text variable from parent view
    var body: some View {
        ScrollView{Text(text.content)
            Button {
                Task{
                    translation = try await translator.translate((text.content), from: "en", to: "es")
                    print(translation)
                }
            } label:{ }
            NavigationLink(destination: ScrollView{Text(translation)} ,label: {
                ZStack{
                    Spacer()
                    Text("Translate")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                    
                }
                .padding()
                
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("g")).frame(width: 355,height: 50))
            })
        }
    }
}

struct TranslationDummyView: View {
    @State private var showScan=false
    @State private var texts:[Scan]=[]
    @State var translator = Translator("https://libretranslate.de")
    @State var translation = ""
    var body: some View {
        TranslationView(text: $texts[0], translation: $translation, translator: $translator)
    }
}

struct TranslationView_Previews: PreviewProvider {
    static var previews: some View {
        TranslationDummyView()
    }
}

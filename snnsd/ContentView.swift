//
//  ContentView.swift
//  snnsd
//
//  Created by Mohammad Muksith on 12/12/22.
//

import SwiftUI
import LibreTranslate

struct ContentView: View {
    @State private var showScan=false
    @State private var texts:[Scan]=[]
    let translator = Translator("https://libretranslate.de")
    @State var translation = ""
    var body: some View {
        NavigationView{
            VStack {
                
                if texts.count>0{
                    List{
                        
                        ForEach(texts){
                            
                            text in NavigationLink(destination:
                                                    
                                                    ScrollView{Text(text.content)
                                //#warning("replace with translation view")
                                
//                                Button {
//                                    Task{
//
//                                        print("\(text.content) before ")
//
//                                        translation = try await translator.translate((text.content), from: "en", to: "es")
//                                        print(translation + " afterc")
//
//
//
//
//                                    }
//
//
//                                }
//
//                            label:{
//                                Text("Translate")
//
//                            }
                                NavigationLink(destination: ScrollView{Text(translation)}
                                               
                                               ,label: {
                                    Button {
                                        Task{
                                            
                                            print("\(text.content) before ")
                                            
                                            translation = try await translator.translate((text.content), from: "en", to: "es")
                                            print(translation + " afterc")
                                            
                                            
                                            
                                            
                                        }
                                        
                                        
                                    }
                                    
                                label:{
                                    Text("Translate")
                                    
                                }})
//                                    ZStack{
//                                        Spacer()
//                                        Text("Translate")
//                                            .font(.largeTitle)
//                                            .foregroundColor(Color.white)
//
//                                    }
//                                    .padding()
//
//                                    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("g")).frame(width: 355,height: 50))
//                                })
                                //                                TranslationDummyView()
                                
                            }
                                                   
                                                   , label: {
                                Text(text.content).lineLimit(1)
                                
                            })
                            
                            
                        }
                        
                        
                    }
                    
                    
                }
                else{
                    Text("")
                }
            }
            .navigationTitle("Scan")
            
            .navigationBarItems(trailing:
                                    Button(action:{
                self.showScan=true
            },label:{
                Image(systemName: "doc.text.viewfinder")
                    .foregroundColor(Color("g"))
                    .bold()
                    .font(.title)
            })
                                        .sheet(isPresented: $showScan, content: {makeScannerView()}))
            
            
        }
    }
    
    
    private func makeScannerView()->ScannerView{
        ScannerView(completion: {
            textPerPage in
            if let outputText=textPerPage?.joined(separator:"\n").trimmingCharacters(in: .whitespacesAndNewlines){
                let newScanData=Scan(content: outputText)
                self.texts.insert(newScanData, at: 0)
            }
            self.showScan=false
        })
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





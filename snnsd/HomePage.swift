//
//  HomePage.swift
//  snnsd
//
//  Created by Mohammad Muksith on 12/13/22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView{
            VStack {
              
                
                Spacer()
                HStack{
               
                    ZStack{
                        Image(systemName: "text.viewfinder")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color("g"))
                            .font(.largeTitle)
                        
                    }
                    .padding(80)
                  
                }
                Spacer()
                ZStack{
                    NavigationLink(destination:ContentView()){
                        
                        
                        
                        HStack{
                            Text("START")
                                .font(.largeTitle)
                                .foregroundColor(.primary)
                                .colorInvert()
                            
                                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("g")).frame(width: 355,height: 50))
                        }
                        
                        
                    }
                }
            }
            .padding()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

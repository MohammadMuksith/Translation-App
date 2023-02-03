//
//  sssa.swift
//  snnsd
//
//  Created by Mohammad Muksith on 12/12/22.
//

import Foundation

struct Scan:Identifiable{
    var id = UUID()
    let content:String
    init(content:String){
        self.content=content
        
    }
}

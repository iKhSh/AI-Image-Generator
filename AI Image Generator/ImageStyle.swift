//
//  ImageStyle.swift
//  AI Image Generator
//
//  Created by Khalid Shiba on 20.02.24.
//

import Foundation


enum ImageStyle: String , CaseIterable{
    
    case surrealism
    case realism
    case threeDRender
    case minimalism
    case abstract
    case retro
    case geometric
    
    var title: String {
        switch self {
        case .surrealism:
            return "Surrealism"
        case .realism:
            return "Realism"
        case .threeDRender:
            return "3D Render"
        case .minimalism:
            return "Minimalism"
        case .abstract:
            return "abstract"
        case .retro:
            return "retro"
        case .geometric:
            return "geometric"
        }
       
    }
}

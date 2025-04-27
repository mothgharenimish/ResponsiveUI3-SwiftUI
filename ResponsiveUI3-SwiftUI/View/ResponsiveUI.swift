//
//  ResponsiveUI.swift
//  ResponsiveUI3-SwiftUI
//
//  Created by Nimish Mothghare on 27/04/25.
//

import SwiftUI

struct ResponsiveUI<Content: View>:View {
    var content: (Properties) -> Content

    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            let isLandscape = size.width > size.height
            let isiPad = UIDevice.current.userInterfaceIdiom == .pad
            let isiPadPotrait = isiPad && !isLandscape
            
            content(Properties(isLandscape: isLandscape, isiPad: isiPad, isiPadPortrait: isiPadPotrait, size: size))
            
                .frame(width: size.width, height: size.height, alignment: .center)

            
        }
    }
}


struct Properties {
    
    var isLandscape : Bool
    var isiPad : Bool
    var isiPadPortrait: Bool
    var size : CGSize
}

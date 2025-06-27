//
//  Fonts+Utilities.swift
//  Cratox Ai
//
//  Created by Dragos Ivanciuc on 24.06.2025.
//
import SwiftUI

struct Appfonts {
    static let h1Bold = Font.custom("PlusJakartaSans-Bold", size: 48)
    static let h2Bold = Font.custom("PlusJakartaSans-Bold", size: 40)
    static let h3Bold = Font.custom("PlusJakartaSans-Bold", size: 32)
    static let h4Bold = Font.custom("PlusJakartaSans-Bold", size: 24)
    static let h5Bold = Font.custom("PlusJakartaSans-Bold", size: 20)
    static let h6Bold = Font.custom("PlusJakartaSans-Bold", size: 18)
    
    static let h1SemiBold = Font.custom("PlusJakartaSans-SemiBold", size: 48)
    static let h2SemiBold = Font.custom("PlusJakartaSans-SemiBold", size: 40)
    static let h3SemiBold = Font.custom("PlusJakartaSans-SemiBold", size: 32)
    static let h4SemiBold = Font.custom("PlusJakartaSans-SemiBold", size: 24)
    static let h5SemiBold = Font.custom("PlusJakartaSans-SemiBold", size: 20)
    static let h6SemiBold = Font.custom("PlusJakartaSans-SemiBold", size: 18)
    
    static let h1Medium = Font.custom("PlusJakartaSans-Medium", size: 48)
    static let h2Medium = Font.custom("PlusJakartaSans-Medium", size: 40)
    static let h3Medium = Font.custom("PlusJakartaSans-Medium", size: 32)
    static let h4Medium = Font.custom("PlusJakartaSans-Medium", size: 24)
    static let h5Medium = Font.custom("PlusJakartaSans-Medium", size: 20)
    static let h6Medium = Font.custom("PlusJakartaSans-Medium", size: 18)
}

struct FontPreviewView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("H1 Bold").font(Appfonts.h1Bold)
                Text("H2 Bold").font(Appfonts.h2Bold)
                Text("H3 Bold").font(Appfonts.h3Bold)
                Text("H4 Bold").font(Appfonts.h4Bold)
                Text("H5 Bold").font(Appfonts.h5Bold)
                Text("H6 Bold").font(Appfonts.h6Bold)
                
                Divider()
                
                Text("H1 SemiBold").font(Appfonts.h1SemiBold)
                Text("H2 SemiBold").font(Appfonts.h2SemiBold)
                Text("H3 SemiBold").font(Appfonts.h3SemiBold)
                Text("H4 SemiBold").font(Appfonts.h4SemiBold)
                Text("H5 SemiBold").font(Appfonts.h5SemiBold)
                Text("H6 SemiBold").font(Appfonts.h6SemiBold)
                
                Divider()
                
                Text("H1 Medium").font(Appfonts.h1Medium)
                Text("H2 Medium").font(Appfonts.h2Medium)
                Text("H3 Medium").font(Appfonts.h3Medium)
                Text("H4 Medium").font(Appfonts.h4Medium)
                Text("H5 Medium").font(Appfonts.h5Medium)
                Text("H6 Medium").font(Appfonts.h6Medium)
            }
            .padding()
        }
    }
}

struct FontPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        FontPreviewView()
    }
}


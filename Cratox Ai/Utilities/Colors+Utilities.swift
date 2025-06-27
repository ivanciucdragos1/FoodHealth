//
//  Colors+Utilities.swift
//  Cratox Ai
//
//  Created by Dragos Ivanciuc on 24.06.2025.
//
import SwiftUI

struct AppColors {
    static let primaryGreen = Color(red: 111/255, green: 150/255, blue: 118/255)
    static let primaryDarkBlue = Color(red: 25/255, green: 34/255, blue: 76/255)
    static let secondaryWhite = Color(red: 246/255, green: 248/255, blue: 254/255)
    static let successGreen = Color(red: 0/255, green: 197/255, blue: 102/255)
    static let errorRed = Color(red: 229/255, green: 57/255, blue: 53/255)
    static let warningYellow = Color(red: 250/255, green: 204/255, blue: 21/255)
    static let infoBlue = Color(red: 0/255, green: 100/255, blue: 192/255)
    static let additionalWhite = Color(red: 254/255, green: 254/255, blue: 254/255)
    static let lineGray = Color(red: 227/255, green: 231/255, blue: 236/255)
    static let lineDark = Color(red: 74/255, green: 74/255, blue: 101/255)
    static let customBlack = Color(red: 17/255, green: 17/255, blue: 17/255)
    static let grayscale10 = Color(red: 253/255, green: 253/255, blue: 253/255)
    static let grayscale20 = Color(red: 236/255, green: 241/255, blue: 246/255)
    static let grayscale30 = Color(red: 227/255, green: 233/255, blue: 237/255)
    static let grayscale40 = Color(red: 209/255, green: 216/255, blue: 221/255)
    static let grayscale50 = Color(red: 191/255, green: 198/255, blue: 204/255)
    static let grayscale60 = Color(red: 156/255, green: 164/255, blue: 171/255)
    static let grayscale70 = Color(red: 120/255, green: 130/255, blue: 138/255)
    static let grayscale80 = Color(red: 102/255, green: 112/255, blue: 122/255)
    static let grayscale90 = Color(red: 67/255, green: 78/255, blue: 88/255)
    static let grayscale100 = Color(red: 23/255, green: 23/255, blue: 37/255)
}

struct NonGrayscaleColorPreview: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ColorPreviewRow(name: "primaryGreen", color: AppColors.primaryGreen)
                ColorPreviewRow(name: "primaryDarkBlue", color: AppColors.primaryDarkBlue)
                ColorPreviewRow(name: "secondaryWhite", color: AppColors.secondaryWhite)
                ColorPreviewRow(name: "successGreen", color: AppColors.successGreen)
                ColorPreviewRow(name: "errorRed", color: AppColors.errorRed)
                ColorPreviewRow(name: "warningYellow", color: AppColors.warningYellow)
                ColorPreviewRow(name: "infoBlue", color: AppColors.infoBlue)
                ColorPreviewRow(name: "additionalWhite", color: AppColors.additionalWhite)
                ColorPreviewRow(name: "lineGray", color: AppColors.lineGray)
                ColorPreviewRow(name: "lineDark", color: AppColors.lineDark)
                ColorPreviewRow(name: "customBlack", color: AppColors.customBlack)
            }
            .padding()
        }
    }
}

struct ColorPreviewRow: View {
    let name: String
    let color: Color
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(color)
                .frame(width: 50, height: 50)
            Text(name)
                .foregroundColor(.primary)
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct NonGrayscaleColorPreview_Previews: PreviewProvider {
    static var previews: some View {
        NonGrayscaleColorPreview()
    }
}


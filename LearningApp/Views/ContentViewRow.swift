//
//  ContentViewRow.swift
//  LearningApp
//
//  Created by Adam Ress on 6/11/23.
//

import SwiftUI

struct ContentViewRow: View {
    
    @EnvironmentObject var model: ContentModel
    var index: Int
    
    var body: some View {
        
        let lesson = model.currentModule!.content.lessons[index]
        
        ZStack(alignment: .leading){
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 1)
                .frame(height: 66)
            HStack(spacing: 30) {
                Text(String(index + 1))
                    .bold()
                
                VStack(alignment: .leading){
                    Text(lesson.title)
                        .bold()
                    Text(lesson.duration)
                }
            }
            .padding(.horizontal)
        }
    }
}

//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Adam Ress on 6/11/23.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        VStack{
            
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            
            CodeTextView()
            
            
            if(model.hasNextLesson())
            {
                Button {
                    model.nextLesson()
                    
                } label: {
                    ZStack{
                        RectangleCard(color: .green)
                            .frame(height: 48)
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .padding()
                }
                
            }
            else {
                Button {
                    model.currentContentSelected = nil
                    
                } label: {
                    ZStack{
                        RectangleCard(color: .green)
                            .frame(height: 48)
                        Text("Complete")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .padding()
                }
            }
            
        }
        .navigationTitle(lesson?.title ?? "")
        .padding()
        
        
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}

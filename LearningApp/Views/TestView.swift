//
//  TestView.swift
//  LearningApp
//
//  Created by Adam Ress on 6/12/23.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model: ContentModel
    
    
    
    var body: some View {
        
        
        
        if model.currentQuestion != nil {
            VStack{
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                
                CodeTextView()
            }
            .navigationTitle("\(model.currentModule?.category ?? "") Test")
            
        }
        else {
            ProgressView()
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
            .environmentObject(ContentModel())
    }
}

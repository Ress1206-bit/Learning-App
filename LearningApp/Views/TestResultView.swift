//
//  TestResultView.swift
//  LearningApp
//
//  Created by Adam Ress on 6/13/23.
//

import SwiftUI

struct TestResultView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var numCorrect: Int
    
    var resultHeading: String {
        
        guard model.currentModule != nil else {
            return ""
        }
        
        let pct = Double (numCorrect) / Double (model.currentModule!.test.questions.count)
        
        if pct > 0.6 {
            return "Awesome!"
        }
        
        else if pct > 0.4 {
            return "Okay keep pushing"
        }
        
        else {
            return "Uh oh"
        }
    }
    
    var body: some View {
        VStack{
            Spacer()
            Text(resultHeading)
                .font(.title)
                .bold()
            
            Spacer()
            
            Text("You got \(numCorrect) out of \(model.currentModule?.test.questions.count ?? 0) questions")
            
            Spacer()
            
            
            Button() {
                model.currentTestSelected = nil
            } label: {
                ZStack{
                    RectangleCard(color: .green)
                        .frame(height: 48)
                    
                    Text("Complete")
                        .bold()
                        .foregroundColor(.white)
                }
                .padding()
            }

        }
    }
}

struct TestResultView_Previews: PreviewProvider {
    static var previews: some View {
        TestResultView(numCorrect: 6)
            .environmentObject(ContentModel())
    }
}

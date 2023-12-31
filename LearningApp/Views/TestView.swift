//
//  TestView.swift
//  LearningApp
//
//  Created by Adam Ress on 6/12/23.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var selectedAnswerIndex: Int?
    @State var numCorrect = 0
    @State var submitted = false
    
    var buttonText: String {
        if submitted{
            if model.currentQuestionIndex + 1 == model.currentModule!.test.questions.count{
                return "Finish"
            }
            else{
                return "Next"
            }
        }
        else{
            return "Submit"
        }
    }
    
    var body: some View {
        
        if model.currentQuestion != nil {
            VStack(alignment: .leading){
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                    .padding(.leading, 20)
                
                CodeTextView()
                    .padding(.horizontal, 20)
                
                ScrollView{
                    VStack{
                        ForEach(0..<model.currentQuestion!.answers.count, id: \.self){ index in
                            
                            Button {
                                selectedAnswerIndex = index
                                
                            } label: {
                                ZStack{
                                    if !submitted {
                                        RectangleCard(color: index == selectedAnswerIndex ? .gray : .white)
                                            .frame(height: 48)
                                    }
                                    else {
                                        if index == selectedAnswerIndex && index == model.currentQuestion!.correctIndex{
                                            RectangleCard(color: .green)
                                                .frame(height: 48)
                                        }
                                        else if index == selectedAnswerIndex && index != model.currentQuestion!.correctIndex {
                                            RectangleCard(color: .red)
                                                .frame(height: 48)
                                        }
                                        else if index == model.currentQuestion?.correctIndex {
                                            RectangleCard(color: .green)
                                                .frame(height: 48)

                                        }
                                        else {
                                            RectangleCard(color: .white)
                                                .frame(height: 48)
                                        }
                                    }
                                    Text(model.currentQuestion!.answers[index])
                                }
                            }
                            .disabled(submitted)
                            .buttonStyle(CustomButtonStyle())
                        }
                    }
                    .accentColor(.black)
                    .padding()
                }
                
                Button {
                    
                    if submitted == true {
                        model.nextQuestion()
                        
                        submitted = false
                        selectedAnswerIndex = nil
                    }
                    else {
                        submitted = true
                        if selectedAnswerIndex == model.currentQuestion!.correctIndex {
                            numCorrect += 1
                        }         
                    }

                } label: {
                    ZStack{
                        RectangleCard(color: .green)
                            .frame(height: 48)
                        Text(buttonText)
                            .bold()
                            .foregroundColor(.white)
                    }
                    .padding()
                }
                .disabled(selectedAnswerIndex == nil)

            }
            .navigationTitle("\(model.currentModule?.category ?? "") Test")
            
        }
        else {
            TestResultView(numCorrect: numCorrect)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
            .environmentObject(ContentModel())
    }
}


struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 1.0 : 0.8)
    }
}

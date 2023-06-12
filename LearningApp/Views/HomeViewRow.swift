//
//  HomViewRow.swift
//  LearningApp
//
//  Created by Adam Ress on 6/11/23.
//

import SwiftUI

struct HomeViewRow: View {
    
    var image: String
    var title: String
    var description: String
    var count: String
    var time: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .cornerRadius(10)
                .foregroundColor(.white)
                .shadow(radius: 2)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
            
            HStack{
                //Image
                Image(image)
                    .resizable()
                    .frame(width:116, height: 116)
                    .clipShape(Circle())
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 10){
                    //Text
                    Text("\(title)")
                        .bold()
                    
                    //Description
                    Text(description)
                        .padding(.bottom, 20)
                        .font(.caption)
                     
                    //Icons
                    HStack(spacing: 0){
                        //Number of lessons/questions
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .padding(.trailing, 4)
                        Text("\(count) Lessons")
                            .font(Font.system(size: 10))
                            .padding(.trailing, 10)
                        
                        //Time
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .padding(.trailing, 4)
                        Text("\(time)")
                            .font(Font.system(size: 10))

                    }
                    
                }
                .padding(.leading, 20)
                .padding(.trailing, 10)
                
            }
            .padding(.horizontal, 20)
        }
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(image: "swift", title: "Learn Swift", description: "some description", count: "10", time: "2 hours")
            .environmentObject(ContentModel())
    }
}

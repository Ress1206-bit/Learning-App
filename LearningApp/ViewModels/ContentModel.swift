//
//  ContentModel.swift
//  LearningApp
//
//  Created by Adam Ress on 6/10/23.
//

import Foundation

class ContentModel: ObservableObject {
    @Published var modules = [Module]()
    
    var styleData: Data?
    
    init(){
        getLocalData()
    }
    
    func getLocalData() {
        //Get url to json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do{
            // read file into data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // try to decode json into array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            self.modules = modules
        }
        catch {
            print("Couldn't parse local data")
        }
        
        //Parse style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do{
           //Read file into data object
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
        }
        catch {
            print("Couldn't parse style data")
        }
    }
}

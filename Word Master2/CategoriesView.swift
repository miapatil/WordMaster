//
//  ContentView.swift
//  Word Master2
//
//  Created by Mia Patil on 1/20/23.
//

import SwiftUI

struct CategoriesView: View {
    @State var categories: [Category] = []
    //
    //    var body: some View {
    //        if categories.count == 0{
    //            Text("")
    //                .foregroundColor(.purple)
    //                .onAppear(perform: {
    //                    getCategories()
    //                })
    //        } else {
    //            NavigationView{
    //                List (categories){ listedCat in
    //                    NavigationLink(destination: WordInfoView(word: listedWord)){
    //                        Text(listedWord.word)
    //                    }
    //                }
    //            }
    //        }
    //    }
    
    var body: some View {
        if categories.count == 0{
            VStack{
                ProgressView()
                Text("Grabbing data")
                    .foregroundColor(.purple)
                    .onAppear(perform: {
                        getCategories()
                    })
            }
        } else {
            //ScrollView{
                //NavigationView{
                    VStack(spacing:15){
                        NavigationView{
                            ScrollView {
                                ForEach(categories){ listedCat in
                                    CatImageView(category: listedCat)
                                }
                            }
//                        ForEach(categories){ listedCat in
//                            CatImageView(category: listedCat)
//                        }
                    }
               // }
            }
        }
    }
        
        func getCategories(){
            if let apiURL = URL(string: "http://localhost:8080/categories"){
                var request = URLRequest(url: apiURL)
                request.httpMethod = "GET"
                
                URLSession.shared.dataTask(with: request){ (data, response, error) in
                    if error != nil {
                        print("There was an error")
                    } else if data != nil {
                        
                      
                        if let catFromAPI = try? JSONDecoder().decode([Category].self, from: data!){
                            //can't do this previous line why?
                            categories = catFromAPI
                            
                        }
                    }
                }.resume()
            }
        }
    }
    
    ////http://localhost:8080/categories
    struct Category: Codable, Identifiable{
        var id: CLongLong //is this it??
        var name: String
        var createdDate: String
        var image: String
    }
    
    struct WordView_Previews: PreviewProvider {
        static var previews: some View {
            CategoriesView()
        }
    }


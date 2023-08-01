//
//  WordsView.swift
//  Word Master2
//
//  Created by Mia Patil on 1/20/23.
//

import SwiftUI

struct WordsView: View {
    var category: Category
    @State var words: [Word] = []
    
    var body: some View {
        if words.count == 0{
            Text("")
                .foregroundColor(.purple)
                .onAppear(perform: {
                    getWords()
                })
        } else {
            NavigationView{
                List (words){ listedWord in
                    NavigationLink(destination: WordInfoView(word: listedWord)){
                        Text(listedWord.word)
                    }
                }
            }.navigationTitle(category.name.capitalized)
        }
    }
    //category.id
    
    func getWords(){
        if let apiURL = URL(string: "http://localhost:8080/words/\(category.id)"){
            var request = URLRequest(url: apiURL)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request){ (data, response, error) in
                if error != nil {
                    print("There was an error")
                } else if data != nil {
                    if let wordsFromAPI = try? JSONDecoder().decode([Word].self, from: data!){
                        words = wordsFromAPI
                    }
                }
            }.resume()
        }
    }
}

//http://localhost:8080/words/151
struct Word: Codable, Identifiable{
    var id: CLongLong //is this it??
    var word: String
    var meaning: String
    var synonym: String
    var antonym: String
    var usage: String
}

struct WordsView_Previews: PreviewProvider {
    static var previews: some View {
        WordsView(category: Category(id: 5, name: "name", createdDate: "3", image: "h"))
    }
}

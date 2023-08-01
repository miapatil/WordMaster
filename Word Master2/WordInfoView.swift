//
//  WordInfoView.swift
//  Word Master2
//
//  Created by Mia Patil on 1/20/23.
//

import SwiftUI

struct WordInfoView: View {
    var word: Word
    var body: some View {
        VStack{
            Text(word.word)
                .font(.system(size: 50))
                .padding()
            Text("Definition: \(word.meaning)")
          //  Text("Synonym: \(word.synonym)")
          //  Text("Antonym: \(word.antonym)")
            Text("Sentence: \(word.usage)")
        }
    }
}

struct WordInfoView_Previews: PreviewProvider {
    static var previews: some View {
        WordInfoView(word: Word(id: 50, word: "word", meaning: "meaning", synonym: "synonym", antonym: "antonym", usage: "usage"))
    }
}

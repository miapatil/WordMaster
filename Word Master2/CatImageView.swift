//
//  CatImageView.swift
//  Word Master2
//
//  Created by Mia Patil on 1/20/23.
//

import SwiftUI

struct CatImageView: View {
    var category: Category
    var body: some View {
        ZStack{
            NavigationLink(destination: WordsView(category: category)){
                AsyncImage(url: URL(string: category.image)){ phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            //.clipped()
                            .opacity(0.9)
                    default:
                        VStack{
                            Image(systemName: "books.vertical")
                                .font(.largeTitle)
                                .padding(80)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                    }
                }
            }
            .padding(.bottom)
            
//            AsyncImage(url: URL(string: category.image)){ phase in
//                switch phase {
//                case .success(let image):
//                    image
//                        .resizable()
//                        .scaledToFill()
//                        .opacity(0.9)
//
//                default:
//                    VStack{
//                        Image(systemName: "books.vertical")
//                            .font(.largeTitle)
//                            .padding(80)
//                    }
//                    .frame(maxWidth: .infinity)
//                    .background(Color.gray)
//                }
//            }
            
            VStack{
                Spacer()
                HStack{
                    Text(category.name)
                        .bold()
                        .foregroundColor(.white)
                        .padding(5)
                    
                    Spacer()
                }
                .background(.purple.opacity(0.8))
            }
            .padding(.bottom)
        }
    }
}

struct CatImageView_Previews: PreviewProvider {
    static var previews: some View {
        CatImageView(category: Category(id: 50, name: "name", createdDate: "2022-12-29T13:43:00", image: "https://zappycode.com/media/course_images/3840036_f936.jpg"))
    }
}

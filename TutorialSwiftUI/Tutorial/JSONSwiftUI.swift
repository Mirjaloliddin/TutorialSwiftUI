//
//  JSONSwiftUI.swift
//  TutorialSwiftUI
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 03/04/23.
//

import SwiftUI

struct JSONSwiftUI: View {
    
    @State var posts: [Post] = []
    
    var body: some View {
        NavigationView {
            List(posts) { post in
                VStack {
                    Text(post.name)
                        .fontWeight(.bold)
                    Text(post.body)
                }
            } .onAppear() {
                Api().getPost { (posts) in
                    self.posts = posts
                    
                }
            } .navigationBarTitle("Posts")
        }
    }
}

struct Post: Codable, Identifiable {
    let id = UUID()
    var name: String
    var body: String
}

class Api {
    
    func getPost(completion: @escaping ([Post]) -> ()) {
       guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments")
        else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _ ) in
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
                
            }
        }
        .resume()
    }
}

struct JSONSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        JSONSwiftUI()
    }
}

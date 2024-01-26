//
//  ContentView.swift
//  Trash Classifier
//
//  Created by Saravanan Subbiah on 1/20/24.
//

import SwiftUI

struct TrashClassOneView: View {
    var body: some View {
        NavigationView{
            VStack{
                ScreenOneView()
                    .navigationTitle("Trash Classifier")
                
                NavigationLink(destination:TrashClassTwoView(),label: {
                    Text("Information")
                        .font(.title)
                        .fontWeight(.bold)
                })
                NavigationLink(
                    destination:ScreenThreeView(),
                    label: {
                    Text("Scan Waste")
                            .font(.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                })
            }
        }
    }
}
struct TrashClassTwoView: View {
    var body: some View {
        VStack{
            ScreenTwoView()
                .navigationTitle("Information")
        }
    }
}
struct TrashClassThreeView: View {
    var body: some View {
        VStack{
            ScreenThreeView()
                .navigationTitle("Scan Waste")
        }
    }
}

struct ScreenOneView: View {
    var body: some View {
        ZStack {
            VStack {
                Image("Bins")
                    .resizable()
                    .cornerRadius(20)
                    .aspectRatio(contentMode:.fit)
                    .padding(.all)
                    .offset(y:-60)
            }
        }
    }
}
struct ScreenTwoView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Links to Websites for Awarness of Garbage")
            }
        }
    }
}

struct ScreenThreeView: View {
    var body: some View {
        ZStack {
            VStack{
                Text("Camera API")
            }
        }
    }
}
#Preview {
    TrashClassOneView()
}

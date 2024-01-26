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
    @State var isPickerShowing = false
    @State var selectedImage: UIImage?
    
    var body: some View {
        VStack{
            if selectedImage != nil {
                Image(uiImage: selectedImage!)
                    .resizable()
                    .frame(width:200,height:200)
            }
            Button {
                isPickerShowing = true
            } label: {
                Text("Select a Photo")
            }
        }
        .sheet(isPresented: $isPickerShowing, onDismiss: nil, content: {
            // Image picker
            ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
        })
    }
}
#Preview {
    TrashClassOneView()
}

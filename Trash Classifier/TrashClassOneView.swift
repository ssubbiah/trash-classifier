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
                Link("Trash Pollution GOV", destination: URL(string: "https://www.epa.gov/trash-free-waters/what-you-can-do-about-trash-pollution")!)
            }
        }
    }
}

struct ScreenThreeView: View {
    @State var isPickerShowing = false
    @State var selectedImage: UIImage?
    @State var imageResult: ImageResult?
    
    var body: some View {
        VStack{
            if selectedImage != nil {
                Image(uiImage: selectedImage!)
                    .resizable()
                    .frame(width:200,height:200)
            }
            if let result = imageResult {
                Form {
                    Section(header: Text("Analysis Result")) {
                        HStack {
                            Text("Object:")
                            Spacer()
                            Text(result.object)
                                .foregroundColor(.gray)
                        }
                        HStack {
                            Text("Classification:")
                            Spacer()
                            Text(result.classification)
                                .foregroundColor(.gray)
                        }
                        HStack {
                            Text("Reason:")
                            Spacer()
                            Text(result.reason)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            Button {
                isPickerShowing = true
            } label: {
                Text("Select a Photo")
            }
        }
        .sheet(isPresented: $isPickerShowing, onDismiss: nil, content: {
            // Image picker
            ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing, results: $imageResult)
        })
        
    }
}
#Preview {
    TrashClassOneView()
}

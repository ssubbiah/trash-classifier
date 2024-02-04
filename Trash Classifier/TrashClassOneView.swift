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
                    .navigationTitle("Eco-Sorter")
                
                NavigationLink(destination:TrashClassTwoView(),label: {
                    Text("Information")
                        .bold()
                        .font(.title)
                        .frame(width:280,height:50)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(12)
                })
                NavigationLink(
                    destination:ScreenThreeView(),
                    label: {
                    Text("Scan Waste")
                            .bold()
                            .font(.title)
                            .frame(width:280,height:50)
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(12)
                })
            }
        }
    }
}
struct TrashClassTwoView: View {
    var body: some View {
        VStack{
            ScreenTwoView()
            NavigationLink(
                destination:ScreenThreeView(),
                label: {
                Text("Scan Waste")
                        .bold()
                        .frame(width:280,height:50)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(12)
            })
        }
    }
}
struct TrashClassThreeView: View {
    var body: some View {
        VStack{
            ScreenThreeView()
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
                Link(destination: URL(string:"https://www.epa.gov/trash-free-waters/what-you-can-do-about-trash-pollution")!, label:{
                    Text("Trash Pollution GOV")
                        .bold()
                        .frame(width:280,height:50)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(12)
                })
                Link(destination: URL(string:"https://www.unep.org/plastic-pollution#:~:text=Plastic%20pollution%20can%20alter%20habitats,t%20exist%20in%20a%20vacuum")!, label:{
                    Text("Plastic Pollution")
                        .bold()
                        .frame(width:280,height:50)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(12)
                })
                Link(destination: URL(string:"https://www.allcountyrecycling.com/blog/2020/three-negative-effects-our-trash-has-on-the-environment.html#:~:text=It%20Contaminates%20Our%20Water,quality%20of%20the%20surface%20water")!, label:{
                    Text("Negative Effects of Trash")
                        .bold()
                        .frame(width:280,height:50)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(12)
                })
                Link(destination: URL(string:"https://dnr.wisconsin.gov/topic/OpenBurning/Impacts.html#:~:text=Burning%20prohibited%20materials%2C%20such%20as,surface%20water%20and%20on%20plants")!, label:{
                    Text("Environmental and Health Impacts")
                        .bold()
                        .frame(width:280,height:50)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(12)
                })
                Text(" ")
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
                    .bold()
                    .font(.title)
                    .frame(width:280,height:50)
                    .foregroundColor(.blue)
                    .background(Color.green)
                    .cornerRadius(12)
            }
            Text(" ")
            NavigationLink(destination:TrashClassTwoView(),label: {
                Text("Information")
                    .bold()
                    .frame(width:280,height:50)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(12)
            })
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

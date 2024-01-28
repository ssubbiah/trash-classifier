//
//  ChatGPTIntegration.swift
//  Trash Classifier
//
//  Created by Saravanan Subbiah on 1/26/24.
//

import Foundation
import UIKit

class ChatGPT: NSObject {
    
    var parent: ImagePicker
        
    init(_ picker: ImagePicker) {
       self.parent = picker
    }
   
    func convertImageToBase64String(img: UIImage) -> String {
        // Convert UIImage to Data
        //let imageData = img.pngData() // For PNG
        let imageData = img.jpegData(compressionQuality: 1.0) // For JPEG

        // Convert Data to Base64 Encoded String
        let base64String = imageData?.base64EncodedString() ?? ""
        return base64String
    }
    
    func getImageURL() -> String {
        var imageURL = "https://drive.google.com/uc?export=view&id=1ys2vLGcsP-WRDI1xShA9dEPo9mV72Z74"
        guard let image = parent.selectedImage else { return imageURL}
        let imageBase64Str = convertImageToBase64String(img: image)
        imageURL = "data:image/jpeg;base64," + imageBase64Str
        return imageURL
    }
    
    func classifyTrash() {
       
        let imageURL = getImageURL();
        
        let url = URL(string: "https://api.openai.com/v1/chat/completions")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        // Replace 'YourOpenAIKey' with your actual OpenAI API key
        let apiKey = "OPEN_AI_API_KEY"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")

        // "url": "https://drive.google.com/uc?export=view&id=1ys2vLGcsP-WRDI1xShA9dEPo9mV72Z74"
        let json: [String: Any] = [
            "model": "gpt-4-vision-preview",
            "messages": [
                [
                    "role": "user",
                    "content": [
                        [
                            "type": "text",
                            "text": "You are 'Trash Classifier GPT', designed to analyze images and accurately classify objects like plastic, compost, paper, food waste, and glass as recyclable, compostable, or trash. You provide brief, educational explanations in a specific JSON format. If an object's classification is unclear, you state 'unknown'. Focus on materials like plastic, compost, paper, food waste, and glass, ensuring factual accuracy in classification and an educational tone in explanations. The response should be strictly in following JSON format: {object: [object], classification: [Recycle/Compost/Trash], reason: [brief explanation]}." ],
                        [
                            "type": "image_url",
                            "image_url": [
                                "url" : imageURL
                            ]
                        ]
                    ]
                ]
            ],
            "max_tokens": 300
        ]

        let jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])
        request.httpBody = jsonData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error ?? "Unknown error")
                return
            }

            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                if let responseString = String(data: data, encoding: .utf8) {
                    print(responseString)
                    //self.decodeJson(json: responseString)
                }
            } else {
                print("HTTP Error: \(String(describing: response as? HTTPURLResponse))")
            }
        }

        task.resume()

    }
   
    /*
    func decodeJson(json: String) {
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(Response.self, from: json)
            
            // Now you can access the values
            let object = response.object
            let classification = response.classification
            let reason = response.reason
            
            print(object)          // Output: someObject
            print(classification)  // Output: someClassification
            print(reason)          // Output: someReason
            
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
     */
}

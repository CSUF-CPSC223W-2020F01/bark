//
//  EditDogView.swift
//  dog tinder
//
//  Created by Miguel Macias on 12/11/20.
//
import SwiftUI
import Foundation

//This displays the dog's information and allows us to edit the dog's property
struct EditDog: View {
    @ObservedObject var profile: User
    @ObservedObject var dog: Dog
    @State private var showCancelButton: Bool = false
    @State var isShowingImagePicker = false
    
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(uiImage: dog.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding()
            Button(action: {
                self.isShowingImagePicker.toggle()
            }, label: {
                Image(systemName: "pencil")
                    .background(Circle()
                        .fill(Color.white)
                        .frame(width: 50, height: 50)
                    )
                    .foregroundColor(/*@START_MENU_TOKEN@*/ .blue/*@END_MENU_TOKEN@*/)
                    .frame(width: 100, height: 100)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }).sheet(isPresented: $isShowingImagePicker, content: {
                ImagePickerView(isPresented: $isShowingImagePicker, dog: dog)
            })
        }
        Form {
            TextField("Dog Name", text: $dog.name)
            // .textFieldStyle(RoundedBorderTextFieldStyle())
            Picker("Breed", selection: $dog.breed) {
                ForEach(Breed.allCases, id: \.self) { breed in
                    Text(breed.rawValue)
                }
            }

            Picker("Gender", selection: $dog.gender) {
                ForEach(Gender.allCases, id: \.self) { gender in
                    Text(gender.rawValue)
                }
            }
            TextField("Temperament", text: $dog.temperament)

            Picker("Size", selection: $dog.size) {
                ForEach(Size.allCases, id: \.self) { size in
                    Text(size.rawValue)
                }
            }
            TextField("Weight", text: $dog.weight)
                .keyboardType(.numberPad)
            TextField("Description", text: $dog.description)
        }
   
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Edit \(dog.name)")
        
    }
}


//This brings up the actual image view where we can select what image we want to replace
struct ImagePickerView: UIViewControllerRepresentable{
    @Binding var isPresented: Bool
    @ObservedObject var dog: Dog

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIViewController {
        let controller = UIImagePickerController()
        controller.delegate = context.coordinator
        return controller
    }
    
    func makeCoordinator() -> ImagePickerView.Coordinator{
        return Coordinator(parent: self, dog: dog)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
        let parent: ImagePickerView
        @ObservedObject var dog: Dog
        init(parent: ImagePickerView, dog: Dog){
            self.parent = parent
            self.dog = dog
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage{
                dog.image = selectedImage
                
            }
            self.parent.isPresented = false
        }
        
    }
    
    func updateUIViewController(_ uiViewController: ImagePickerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePickerView>) {
        
    }
}

import SwiftUI
import CoreML
import Vision

struct HotdogRecognizerView: View {
    @State private var image: UIImage?
    @State private var isHotdog: Bool = false
    
    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
            }
            
            Button("选择图片") {
                openImagePicker()
            }
            
            Text(isHotdog ? "这是热狗！" : "这不是热狗。")
                .font(.title)
                .foregroundColor(isHotdog ? .green : .red)
                .padding()
            
        }
        .navigationTitle("热狗识别")
        .sheet(isPresented: Binding<Bool>.constant(image != nil), onDismiss: recognizeImage) {
            ImagePicker(image: $image)
        }
    }
    
    func openImagePicker() {
        image = nil
    }
    
    func recognizeImage() {
        if let image = image, let ciImage = CIImage(image: image) {
            do {
                let model = try VNCoreMLModel(for: HotdogClassifier().model)
                let request = VNCoreMLRequest(model: model, completionHandler: handleClassification)
                let handler = VNImageRequestHandler(ciImage: ciImage)
                try handler.perform([request])
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func handleClassification(request: VNRequest, error: Error?) {
        if let results = request.results as? [VNClassificationObservation], let firstResult = results.first {
            isHotdog = firstResult.identifier.contains("hotdog")
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.image = image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}


import FirebaseFirestore
import Foundation

final class ImplMediaRepository: MediaRepository {
    func fetchMedias() async -> [MediaModel] {
        await withCheckedContinuation { continuation in
            Firestore.firestore().collection("medias").getDocuments { snapshot, error in
                guard
                    let documents = snapshot?.documents,
                    error == nil
                else { fatalError("Error al leer Firestore: \(error?.localizedDescription ?? "Desconocido")") }

                let items: [MediaModel] = documents.compactMap { document in
                    let data = document.data()

                    guard
                        let title = data["title"] as? String,
                        let imageRawValue = data["image"] as? String,
                        let image = URL(string: imageRawValue),
                        let categoryRawValue = data["category"] as? String,
                        let category = CategoryKind(rawValue: categoryRawValue)
                    else { return nil }

                    let description = data["description"] as? String
                    let videoRawValue = data["video"] as? String
                    let video = videoRawValue.flatMap(URL.init(string:))

                    return MediaModel(title: title, description: description, image: image, video: video, category: category)
                }

                continuation.resume(returning: items)
            }
        }
    }
}

import Foundation

public enum NetworkingProvider {
  public enum APIError: Error {
    case networkError(Error)
    case dataNotFound
    case jsonParsingError(Error)
    case invalidStatusCode(Int)
    case badURL(String)
  }

  public enum Result<T> {
    case success(T)
    case failure(APIError)
  }

  public static func dataRequest<T: Decodable>(
    with url: String,
    objectType: T.Type,
    completion: @escaping (Result<T>) -> Void
  ) {

    guard let dataURL = URL(string: url) else {
      completion(.failure(APIError.badURL(url)))
      return
    }

    let session = URLSession.shared
    let request = URLRequest(url: dataURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
    let task = session.dataTask(with: request, completionHandler: { data, response, error in

      guard error == nil else {
        completion(Result.failure(APIError.networkError(error!)))
        return
      }

      guard let data = data else {
        completion(Result.failure(APIError.dataNotFound))
        return
      }

      do {
        let decodedObject = try JSONDecoder().decode(objectType.self, from: data)
        completion(Result.success(decodedObject))
      } catch let error {
        completion(Result.failure(APIError.jsonParsingError(error as! DecodingError)))
      }
    })
    task.resume()
  }
}

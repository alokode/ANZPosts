//
//  Network.swift
//  ANZPosts
//
//  Created by Alok Sagar on 16/10/25.
//
import Foundation

class NetworkService:NetworkServiceProtocol {
    
    func fetch<T>(_ type: T.Type, from endpoint: APIEndpoint) async throws -> T where T : Decodable, T : Encodable {
        guard let url = URL.init(string: endpoint.url),
              var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        else { throw ANZApiError.invalidURL}
        if endpoint.method == .get, let parameters = endpoint.parameters {
            urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        if let headers = endpoint.headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        if endpoint.method != .get, let parameters = endpoint.parameters {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw ANZApiError.invalidResponse
        }
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
                throw ANZApiError.invalidData
            }
    }
}

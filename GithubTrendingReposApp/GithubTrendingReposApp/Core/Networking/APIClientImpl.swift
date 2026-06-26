//
//  APIClientImpl.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import Foundation
import Combine

final class APIClientImpl: APIClient {
    
    private let session: URLSession
    
    private let decoder: JSONDecoder
    
    init(_ session: URLSession = .shared, _ decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }
    
    func request<T>(
        for endpoint: any Endpoint
    ) -> AnyPublisher<
        T,
        NetworkError
    > where T : Decodable {
        do {
            let request = try RequestBuilder.build(for: endpoint)
            
            return session
                .dataTaskPublisher(for: request)
                .tryMap { output in
                    try Self.validate(response: output.response)
                    return output.data
                }
                .decode(type: T.self, decoder: decoder)
                .mapError { Self.mapError($0)}
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: NetworkError.invalidURL)
                .eraseToAnyPublisher()
        }
    }
}

private extension APIClientImpl {
    static func validate(
        response: URLResponse
    ) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        switch httpResponse.statusCode {
        case 200...299: return
        case 401:
            throw NetworkError.unauthorized
        case 500: throw NetworkError.serverError
            
        default:
            throw NetworkError.unknown
        }
    }
    
    static func mapError(_ error: Error) -> NetworkError {
        switch error {
        case let networkError as NetworkError:
            return networkError
        case is DecodingError:
            return .decodingError
        case let urlError as URLError:
            switch urlError.code {
            case .notConnectedToInternet, .timedOut:
                return .noInternet
            default:
                return .unknown
            }
        default:
            return .unknown
        }
    }
}

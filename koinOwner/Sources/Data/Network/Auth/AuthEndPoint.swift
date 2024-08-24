//
//  AuthEndPoint.swift
//  koinOwner
//
//  Created by 김나훈 on 8/20/24.
//

import Foundation
import Moya

enum AuthEndpoint {
    case reissueToken(request: TokenRequest)
}

extension AuthEndpoint: TargetType {
    var baseURL: URL {
        return Bundle.main.baseURL
    }
    
    var path: String {
        switch self {
        case .reissueToken:
            return "user/refresh"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .reissueToken: return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case let .reissueToken(request):
            return .requestJSONEncodable(request)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return ["Content-Type": "application/json"]
        }
    }

    var validationType: ValidationType { .successCodes }
}

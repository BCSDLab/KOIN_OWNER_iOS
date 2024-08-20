//
//  RegisterEndPoint.swift
//  koinOwner
//
//  Created by 김나훈 on 8/19/24.
//

import Foundation
import Moya

enum RegisterEndPoint {
    case sendSms(VerificationSmsRequest)
    case checkCode(VerificationCodeRequest)
    case fetchShops
    case uploadFile
    case tryRegister(OwnerRegisterRequest)
}

extension RegisterEndPoint: TargetType {
    var baseURL: URL {
        URL(fileURLWithPath: "")
    }
    
    var path: String {
        switch self {
        case .sendSms: return "/owners/verification/sms"
        case .checkCode: return "/owners/verification/code/sms"
        case .fetchShops: return "/shops"
        case .uploadFile: return "/owners/upload/file"
        case .tryRegister: return "/owners/register/phone"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .sendSms, .checkCode, .uploadFile, .tryRegister : return .post
        case .fetchShops: return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case let .sendSms(request):
            return .requestJSONEncodable(request)
        case let .checkCode(request):
            return .requestJSONEncodable(request)
        case .fetchShops:
            return .requestPlain
        case let .uploadFile(request):
            return .requestJSONEncodable(request)
        case let .tryRegister(request):
            return .requestJSONEncodable(request)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .uploadFile: return [:]
        default: return ["Content-Type": "application/json"]
        }
    }
    
}

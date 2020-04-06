import Foundation

final class AuthStore {
    static var auth: AuthResponse?
    static var token: String {
        return auth?.token ?? "" 
    }
}

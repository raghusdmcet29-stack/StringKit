//
//  StringKit.swift
//  A powerful String & Text Utilities library
//
//  Created by Anussha & Raghavendra
//

import Foundation

public struct StringKit {
    
    // MARK: - Validation
    
    /// Check if string is a valid email
    public static func isValidEmail(_ email: String) -> Bool {
        let pattern = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        return email.range(of: pattern, options: .regularExpression) != nil
    }
    
    /// Check if string is a valid phone number
    public static func isValidPhone(_ phone: String) -> Bool {
        let pattern = #"^\+?[0-9]{7,15}$"#
        return phone.range(of: pattern, options: .regularExpression) != nil
    }
    
    /// Check if string is a valid URL
    public static func isValidURL(_ urlString: String) -> Bool {
        return URL(string: urlString) != nil
    }
    
    /// Check if string contains only numbers
    public static func isNumeric(_ text: String) -> Bool {
        return text.allSatisfy { $0.isNumber }
    }
    
    /// Check if string is empty or whitespace
    public static func isBlank(_ text: String) -> Bool {
        return text.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    // MARK: - Formatting
    
    /// Capitalize first letter only
    public static func capitalizeFirst(_ text: String) -> String {
        guard let first = text.first else { return text }
        return first.uppercased() + text.dropFirst()
    }
    
    /// Convert to camelCase
    public static func toCamelCase(_ text: String) -> String {
        let words = text.components(separatedBy: CharacterSet.alphanumerics.inverted)
        let first = words.first?.lowercased() ?? ""
        let rest = words.dropFirst().map { $0.capitalized }
        return ([first] + rest).joined()
    }
    
    /// Convert to snake_case
    public static func toSnakeCase(_ text: String) -> String {
        return text
            .components(separatedBy: .whitespaces)
            .joined(separator: "_")
            .lowercased()
    }
    
    /// Truncate string with ellipsis
    public static func truncate(_ text: String, limit: Int) -> String {
        if text.count <= limit { return text }
        return String(text.prefix(limit)) + "..."
    }
    
    /// Remove all whitespace
    public static func removeSpaces(_ text: String) -> String {
        return text.replacingOccurrences(of: " ", with: "")
    }
    
    /// Repeat a string N times
    public static func repeatString(_ text: String, times: Int) -> String {
        return String(repeating: text, count: times)
    }
    
    // MARK: - Counting
    
    /// Count words in a string
    public static func wordCount(_ text: String) -> Int {
        let words = text.components(separatedBy: .whitespacesAndNewlines)
        return words.filter { !$0.isEmpty }.count
    }
    
    /// Count occurrences of a substring
    public static func countOccurrences(of substring: String, in text: String) -> Int {
        var count = 0
        var searchRange = text.startIndex..<text.endIndex
        while let range = text.range(of: substring, range: searchRange) {
            count += 1
            searchRange = range.upperBound..<text.endIndex
        }
        return count
    }
    
    // MARK: - Transformation
    
    /// Reverse a string
    public static func reverse(_ text: String) -> String {
        return String(text.reversed())
    }
    
    /// Check if string is a palindrome
    public static func isPalindrome(_ text: String) -> Bool {
        let cleaned = text.lowercased().filter { $0.isLetter }
        return cleaned == String(cleaned.reversed())
    }
    
    /// Extract numbers from string
    public static func extractNumbers(_ text: String) -> String {
        return text.filter { $0.isNumber }
    }
    
    /// Extract letters from string
    public static func extractLetters(_ text: String) -> String {
        return text.filter { $0.isLetter }
    }
    
    /// Mask a string (useful for passwords, card numbers)
    public static func mask(_ text: String, visibleLast: Int = 4, maskChar: Character = "*") -> String {
        guard text.count > visibleLast else { return text }
        let masked = String(repeating: maskChar, count: text.count - visibleLast)
        let visible = String(text.suffix(visibleLast))
        return masked + visible
    }
    
    // MARK: - Conversion
    
    /// Convert string to Int safely
    public static func toInt(_ text: String) -> Int? {
        return Int(text)
    }
    
    /// Convert string to Double safely
    public static func toDouble(_ text: String) -> Double? {
        return Double(text)
    }
    
    /// Convert string to Bool
    public static func toBool(_ text: String) -> Bool {
        return ["true", "yes", "1"].contains(text.lowercased())
    }
}

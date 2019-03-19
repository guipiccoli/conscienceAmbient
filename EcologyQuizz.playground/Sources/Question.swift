import Foundation

public struct Question {
    public let image: String
    public let questionText: String
    public let optionA : (choice: String, value: Float)
    public let optionB : (choice: String, value: Float)
    public let optionC : (choice: String, value: Float)
    public let optionD : (choice: String, value: Float)
}


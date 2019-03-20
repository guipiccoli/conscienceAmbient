import Foundation

public class QuestionBank{
    public var list = [Question]()
    public init() {
        list.append(Question.init(image: "trash", questionText:"Pergunta testePergunta teste:Pergunta teste:Pergunta teste:Pergunta teste:Pergunta teste:Pergunta teste:Pergunta tesergunta testePergunta teste:Pergunta teste:Pergunta teste:Perguntaeste:Pergunta teste::", optionA:(choice: "A - teste", 0.50), optionB: (choice: "B - Teste", value: 0.25), optionC: (choice: "C - Teste", value: 0.25), optionD: (choice: "D - Teste", value: 0)))
            
        list.append(Question.init(image: "trash", questionText:"Pergunta teste - 2 :", optionA:(choice: "A - tete2es te2estste2", 0.50), optionB: (choice: "B - Tese2", value: 0.25), optionC: (choice: "C - Teste2", value: 0.25), optionD: (choice: "D - Teste2", value: 0)))
        
        list.append(Question.init(image: "trash", questionText:"Pergunta teste - 2 :", optionA:(choice: "A - teste2", 0.50), optionB: (choice: "B - Teste2", value: 0.25), optionC: (choice: "C - Teste2", value: 0.25), optionD: (choice: "D - Teste2", value: 0)))
  
    
    }
}

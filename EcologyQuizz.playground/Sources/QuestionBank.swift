import Foundation

public class QuestionBank{
    public var list = [Question]()
    public init() {
        list.append(Question.init(image: "trash", questionText:"Pergunta testePergunta teste:Pergunta teste:Pergunta teste:Pergunta teste:Pergunta teste:Pergunta teste:Pergunta tesergunta testePergunta teste:Pergunta teste:Pergunta teste:Perguntaeste:Pergunta teste::", boolImageOption: false,  optionA:(choice: "A - teste", 0.50), optionB: (choice: "B - Teste", value: 0.25), optionC: (choice: "C - Teste", value: 0.25), optionD: (choice: "D - Teste", value: 0)))
            
        list.append(Question.init(image: "trash", questionText:"Pergunta teste - 2 :",boolImageOption: false, optionA:(choice: "A - tete2es te2ests aaste2", 0.50), optionB: (choice: "B - Tese2", value: 0.25), optionC: (choice: "C - Teste2", value: 0.25), optionD: (choice: "D - Teste2", value: 0)))
        
        list.append(Question.init(image: "trash", questionText:"Pergunta teste - 2 :",boolImageOption: false, optionA:(choice: "A - teste2", 0.50), optionB: (choice: "B - Teste2", value: 0.25), optionC: (choice: "C - Teste2", value: 0.25), optionD: (choice: "D - Teste2", value: 0)))
  
        
        list.append(Question.init(image: "battery.png", questionText:"Pergunta teste - 2 :",boolImageOption: true, optionA:(choice: "plastic.png", 0.50), optionB: (choice: "paper.png", value: 0.25), optionC: (choice: "glass.png", value: 0.25), optionD: (choice: "e-waste.png", value: 0)))
        
    
    }
}

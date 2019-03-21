import Foundation

public class QuestionBank{
    public var list = [Question]()
    public init() {
        
        list.append(Question.init(image: "fun-earth.png",
                                  questionText:"Why is developing renewable energy important to life on Earth?",
                                  boolImageOption: false,
                                  optionA: "It's not important, most of the energy produced is not renewable",
                                  optionB: "Renewable energy produces less pollution",
                                  optionC:"Renewable energy is the most used nowadays",
                                  optionD: "Oil and diesel are still good choices for powering vehicles",
                                  answer: 1))

        list.append(Question.init(image: "icon-economize-1.png",
                                  questionText:"Which of the following is an example of a renewable energy source?",
                                  boolImageOption: false,
                                  optionA:"Natural Gas",
                                  optionB:"Fossil Fuels",
                                  optionC:"Solar Power",
                                  optionD:"Coal",
                                  answer: 2))
        
        list.append(Question.init(image: "3R.png",
                                  questionText:"What is the meaning of the 3R's?",
                                  boolImageOption: false,
                                  optionA:"Reduce, Reuse, Recycle",
                                  optionB:"Reduce, Remove, Recycle",
                                  optionC:"Reuse, Recycle, Reproduce",
                                  optionD:"Reproduce, Rebuild, Reuse ",
                                  answer: 0))
        
  
        list.append(Question.init(image: "battery.png",
                                  questionText:"In which garbage bin should this go?",
                                  boolImageOption: true,
                                  optionA:"plastic.png",
                                  optionB:"paper.png",
                                  optionC:"glass.png",
                                  optionD:"e-waste.png",
                                  answer: 3))
        
        list.append(Question.init(image: "trash.png",
                                  questionText:"What is recycling?",
                                  boolImageOption: false,
                                  optionA:"Process to transform used materials to new products for consume",
                                  optionB:"falsa",
                                  optionC:"falsa",
                                  optionD:"falsa",
                                  answer: 0))
        
        list.append(Question.init(image: "trash.png",
                                  questionText:"Can trash be used to create energy?",
                                  boolImageOption: false,
                                  optionA:"No, it can't be used",
                                  optionB:"Only if the materials is recyclable",
                                  optionC:"Only if the materials is non recyclable",
                                  optionD:"It can always be used",
                                  answer: 3))
        
        list.append(Question.init(image: "trash.png",
                                  questionText:"What ways can you help save the planet?",
                                  boolImageOption: false,
                                  optionA:"Recycle",
                                  optionB:"Reduce the amount of waste you produce",
                                  optionC:"Reuse your plastic bottles and bags",
                                  optionD:"All of them!",
                                  answer: 3))
        
        list.append(Question.init(image: "trash.png",
                                  questionText:"What is the best way to preserve tree and florests?",
                                  boolImageOption: false,
                                  optionA:"Reuse metals and glasses",
                                  optionB:"Going more times to the park",
                                  optionC:"Recycling papers, newspapers and magazines",
                                  optionD:"falsa",
                                  answer: 2))
        
    
    }
}

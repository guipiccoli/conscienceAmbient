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
                                  answer: 101))

        list.append(Question.init(image: "icon-economize-1.png",
                                  questionText:"Which of the following is an example of a renewable energy source?",
                                  boolImageOption: false,
                                  optionA:"Natural Gas",
                                  optionB:"Fossil Fuels",
                                  optionC:"Solar Power",
                                  optionD:"Coal",
                                  answer: 102))
        
        list.append(Question.init(image: "3R.png",
                                  questionText:"What is the meaning of the 3R's?",
                                  boolImageOption: false,
                                  optionA:"Reduce, Reuse, Recycle",
                                  optionB:"Reduce, Remove, Recycle",
                                  optionC:"Reuse, Recycle, Reproduce",
                                  optionD:"Reproduce, Rebuild, Reuse ",
                                  answer: 100))
        
  
        list.append(Question.init(image: "battery.png",
                                  questionText:"In which garbage bin should this go?",
                                  boolImageOption: true,
                                  optionA:"plastic.png",
                                  optionB:"paper.png",
                                  optionC:"glass.png",
                                  optionD:"e-waste.png",
                                  answer: 103))
        
        list.append(Question.init(image: "recycle.png",
                                  questionText:"What is recycling?",
                                  boolImageOption: false,
                                  optionA:"Process of transforming used materials to new products for consume",
                                  optionB:"Planting Trees",
                                  optionC:"The act of using renewable energys",
                                  optionD:"Commuting by clean transportion",
                                  answer: 100))
        
        list.append(Question.init(image: "energy1.png",
                                  questionText:"Can trash be used to create energy?",
                                  boolImageOption: false,
                                  optionA:"No, it can't be used",
                                  optionB:"Only if the materials are recyclable",
                                  optionC:"Only if the materials are non recyclable",
                                  optionD:"It can always be used",
                                  answer: 103))
        
        list.append(Question.init(image: "tree.png",
                                  questionText:"What is the best way to save tree and forests?",
                                  boolImageOption: false,
                                  optionA:"Reusing metallic and glass material",
                                  optionB:"Going more times to the park",
                                  optionC:"Recycling papers, newspapers and magazines",
                                  optionD:"Preventing water waste",
                                  answer: 102))
        
        list.append(Question.init(image: "earth.png",
                                  questionText:"About how much of the Earth surface is water-covered?",
                                  boolImageOption: false,
                                  optionA:"90%",
                                  optionB:"60%",
                                  optionC:"70%",
                                  optionD:"40%",
                                  answer: 102))
        
        list.append(Question.init(image: "ecology.png",
                                  questionText:"In what ways can you help save the planet?",
                                  boolImageOption: false,
                                  optionA:"Recycle",
                                  optionB:"Reduce the amount of waste you produce",
                                  optionC:"Reuse your plastic bottles and bags",
                                  optionD:"All of them!",
                                  answer: 103))

        
    }
}

import Foundation

public class CuriosityBank{
    public var list = [Curiosity]()
    
    public init() {
        
        list.append(Curiosity.init(image: "3R.png", curiosityTitle: "Reduce, Reuse, Recycle", curiosityText: "Reduce: Reducing the amount of waste you produce is the best way to help the environment \n Reuse: Instead of throwing things away, try to find ways to use them again! \n Recycle: Recycled items are put through a process that makes it possible to create new products out of the materials from the old ones"))
        
        list.append(Curiosity(image: "recycle2.png", curiosityTitle: "Recycling", curiosityText: "Recycling is good for the environment, since we are saving resources and are sending less trash to the landfills, it helps in reducing air and water pollution"))
        
        list.append(Curiosity(image: "freshWater.png", curiosityTitle: "Fresh Water", curiosityText:  "While nearly 70 percent of the world is covered by water, only 2.5 percent of it is fresh. The rest is saline and ocean-based. Even then, just 1 percent of our freshwater is easily accessible, with much of it trapped in glaciers and snowfields."))
        
        list.append(Curiosity.init(image: "phone.png", curiosityTitle: "Did you know?", curiosityText: "Every year, around 4,500 tons of cell phones, telephone and fax machines are dumped. This quantity can be compared to the weight of nearly 600 African elephants"))

        list.append(Curiosity.init(image: "sun.png", curiosityTitle: "Did you know?", curiosityText: "If you could harness the energy from all the sunlight that falls on the Earth in one hour, you would have enough energy to supply the world for a year."))
       
        list.append(Curiosity(image: "truck.png", curiosityTitle: "Did you know?", curiosityText: "Brazil produces about 76 million tons of garbage a year, 30% of it have recycling potential, but only 3% are actually reused."))
        
        list.append(Curiosity(image: "turtle.png", curiosityTitle: "Did you know?", curiosityText: "Sea turtles and other marine creatures mistake plastics and other garbage as food (such as jellyfish) and ingest it. This mistake causes blockages within their digestive system"))
    }
    
}

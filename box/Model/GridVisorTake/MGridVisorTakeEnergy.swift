import Foundation

class MGridVisorTakeEnergy:MGridVisorTakeProtocol
{
    class func factory() -> MGridVisorTakeEnergy
    {
        let energyLevel:MGridVisorTakeEnergy
        
        let random:UInt32 = arc4random_uniform(10)
        
        switch random
        {
        case 1:
            
            energyLevel = MGridVisorTakeEnergy20()
            
            break
            
        default:
            
            energyLevel = MGridVisorTakeEnergy15()
            
            break
        }
        
        return energyLevel
    }
    
    //MARK: visorTake protocol
    
    var descr:NSAttributedString
    {
        get
        {
            return NSAttributedString()
        }
    }
    
    func apply(controller:CGridVisorTake)
    {
        
    }
}
import Cocoa

indirect enum FamilyTree{
    case noParent
    case oneParent(name:String,ancestors:FamilyTree)
    case twoParent(fatherName:String,fatherAncestors:FamilyTree,motherName:String,motherAncestors:FamilyTree)
    
}
let annilqAncestors=FamilyTree.twoParent(fatherName: "llg", fatherAncestors: .noParent, motherName: "ggl", motherAncestors: .noParent)


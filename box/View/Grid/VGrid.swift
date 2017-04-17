import UIKit

class VGrid:VView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private weak var controller:CGrid!
    private weak var spinner:VSpinner!
    private weak var collectionView:VCollection!
    private let kBarHeight:CGFloat = 60
    private let kCellHeight:CGFloat = 120
    
    override init(controller:CController)
    {
        super.init(controller:controller)
        self.controller = controller as? CGrid
     
        let viewBar:VGridBar = VGridBar(
            controller:self.controller)
        
        let spinner:VSpinner = VSpinner()
        self.spinner = spinner
        
        let collectionView:VCollection = VCollection()
        collectionView.alwaysBounceVertical = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(cell:VGridCell.self)
        self.collectionView = collectionView
        
        addSubview(viewBar)
        addSubview(spinner)
        
        NSLayoutConstraint.equals(
            view:spinner,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:kBarHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func modelAtIndex(index:IndexPath) -> MGridItem
    {
        let item:MGridItem = controller.model.items[index.item]
        
        return item
    }
    
    //MARK: public
    
    func refresh()
    {
        collectionView.reloadData()
    }
    
    //MARK: collectionView delegate
    
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        let width:CGFloat = collectionView.bounds.maxX
        let size:CGSize = CGSize(width:width, height:kCellHeight)
        
        return size
    }
    
    func numberOfSections(in collectionView:UICollectionView) -> Int
    {
        let count:Int
        
        if controller.modelAlgo.items.count > 0
        {
            count = 1
        }
        else
        {
            count = 0
        }
        
        return count
    }
    
    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = controller.model.items.count
        
        return count
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MGridItem = modelAtIndex(index:indexPath)
        let cell:VGridCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            VGridCell.reusableIdentifier,
            for:indexPath) as! VGridCell
        cell.config(model:item)
        
        return cell
    }
}
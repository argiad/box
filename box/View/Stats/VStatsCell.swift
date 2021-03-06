import UIKit

class VStatsCell:UICollectionViewCell
{
    private weak var imageView:UIImageView!
    private weak var labelTitle:UILabel!
    private weak var labelCount:UILabel!
    private let kImageWidth:CGFloat = 110
    private let kImageMarginVertical:CGFloat = 20
    private let kTitleHeight:CGFloat = 25
    private let kCountLeft:CGFloat = -20
    private let kCountWidth:CGFloat = 180
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        isUserInteractionEnabled = false
        
        let imageView:UIImageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        imageView.isUserInteractionEnabled = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView = imageView
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.font = UIFont.regular(size:12)
        labelTitle.textColor = UIColor(white:1, alpha:0.7)
        labelTitle.textAlignment = NSTextAlignment.center
        self.labelTitle = labelTitle
        
        let labelCount:UILabel = UILabel()
        labelCount.backgroundColor = UIColor.clear
        labelCount.translatesAutoresizingMaskIntoConstraints = false
        labelCount.isUserInteractionEnabled = false
        labelCount.font = UIFont.numeric(size:22)
        labelCount.textColor = UIColor.white
        self.labelCount = labelCount
        
        addSubview(imageView)
        addSubview(labelTitle)
        addSubview(labelCount)
        
        NSLayoutConstraint.equalsVertical(
            view:imageView,
            toView:self,
            margin:kImageMarginVertical)
        NSLayoutConstraint.leftToLeft(
            view:imageView,
            toView:self)
        NSLayoutConstraint.width(
            view:imageView,
            constant:kImageWidth)
        
        NSLayoutConstraint.height(
            view:labelTitle,
            constant:kTitleHeight)
        NSLayoutConstraint.bottomToBottom(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.width(
            view:labelTitle,
            constant:kImageWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:labelCount,
            toView:self)
        NSLayoutConstraint.leftToRight(
            view:labelCount,
            toView:imageView,
            constant:kCountLeft)
        NSLayoutConstraint.width(
            view:labelCount,
            constant:kCountWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: public
    
    func config(model:MStatsItem)
    {
        imageView.image = model.image
        labelTitle.text = model.title
        labelCount.text = model.countString
    }
}

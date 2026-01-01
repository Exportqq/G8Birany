import UIKit

class ProductCard: UIView {
        
    private let СardBackground: UIView = {
        let background = UIView()
        background.backgroundColor = .customGrey
        background.layer.cornerRadius = 10
        return background
    }()
    
    private let productImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    private let CardBlock: UIView = {
        let block = UIView()
        block.backgroundColor = .clear // Убираем фон
        block.layer.cornerRadius = 10
        block.layer.borderWidth = 1     // Толщина обводки
        block.layer.borderColor = UIColor.white.cgColor // Цвет обводки
        return block
    }()
    
    private let CardTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(image: UIImage?, title: String) {
        productImage.image = image
        CardTitle.text = title
    }
    
    private func setupUI() {
        addSubview(СardBackground)
        addSubview(CardBlock)
        addSubview(productImage)
        addSubview(CardTitle)
    }
    
    private func setupConstrains() {
        [productImage, СardBackground, CardBlock, CardTitle].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            СardBackground.topAnchor.constraint(equalTo: self.topAnchor),
            СardBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            СardBackground.widthAnchor.constraint(equalToConstant: 170),
            СardBackground.heightAnchor.constraint(equalToConstant: 250),
            
            CardBlock.topAnchor.constraint(equalTo: СardBackground.topAnchor, constant: 10),
            CardBlock.leadingAnchor.constraint(equalTo: СardBackground.leadingAnchor,constant: 10),
            CardBlock.widthAnchor.constraint(equalToConstant: 150),
            CardBlock.heightAnchor.constraint(equalToConstant: 150),
            
            productImage.topAnchor.constraint(equalTo: СardBackground.topAnchor, constant: 5),
            productImage.centerXAnchor.constraint(equalTo: СardBackground.centerXAnchor),
            productImage.widthAnchor.constraint(equalToConstant: 159),
            
            CardTitle.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 5),
            CardTitle.leadingAnchor.constraint(equalTo: СardBackground.leadingAnchor, constant: 10)
        ])
    }
}

import UIKit

final class NextViewController: UIViewController {

    private let productCard = ProductCard()
    
    private let bannerView: UIView = {
        let view = UIView()
        view.backgroundColor = .bannerClr
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let bannerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "banner_food")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let bannerTitle: UILabel = {
        let label = UILabel()
        label.text = "50% OFF"
        label.font = UIFont(name: "MulishRoman-Black", size: 40)
        label.textColor = .white
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping

        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .catalogClr
        
        setupProductCard()
        SetupUI()
        setupConstraints()
        
    }
    
    private func setupProductCard() {
        // view.addSubview(productCard)
        
        // productCard.configure(image: UIImage(named: "food1"), title: "Product Name")
        
    }
    
    private func SetupUI() {
        view.addSubview(bannerView)
        bannerView.addSubview(bannerImage)
        bannerView.addSubview(bannerTitle)
        
    }
    
    private func setupConstraints() {
        [productCard, bannerView, bannerImage, bannerTitle].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 125),
            bannerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bannerView.widthAnchor.constraint(equalToConstant: 360),
            bannerView.heightAnchor.constraint(equalToConstant: 100),
            
            bannerImage.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: 10),
            bannerImage.centerYAnchor.constraint(equalTo: bannerView.centerYAnchor),
            
            bannerTitle.centerYAnchor.constraint(equalTo: bannerView.centerYAnchor),
            bannerTitle.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor, constant: -25),
            bannerTitle.widthAnchor.constraint(equalToConstant: 87),
            bannerTitle.heightAnchor.constraint(equalToConstant: 110),
            
                
        ])
        
    }
}

import UIKit

final class NextViewController: UIViewController {

    private let productCard = ProductCard()
    private let productCardTwo = ProductCard()
    private let productCardThree = ProductCard()
    private let productCardFour = ProductCard()
    private let productCardFive = ProductCard()
    private let productCardSix = ProductCard()
    
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
    
    private let Text: UILabel = {
        let label = UILabel()
        label.text = "Biryani"
        label.font = UIFont(name: "MulishRoman-ExtraBold", size: 30)
        label.textColor = .customGrey
        
        return label
    }()
    
    private let TextTwo: UILabel = {
        let label = UILabel()
        label.text = "70 Offers"
        label.font = UIFont(name: "MulishRoman-Regular", size: 24)
        label.textColor = .customGrey
        
        return label
    }()
    
    private let Hashtag: UILabel = {
        let label = UILabel()
        label.text = "#Veg"
        label.textColor = .hashtagBlue
        label.font = UIFont(name: "MulishRoman-Bold", size: 24)
        return label
    }()
    
    private let HashtagTwo: UILabel = {
        let label = UILabel()
        label.text = "#Non-Veg"
        label.textColor = .hashtagOrange
        label.font = UIFont(name: "MulishRoman-Bold", size: 24)
        return label
    }()
    
    private let cardBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .cardBckg
        view.layer.cornerRadius = 50
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [productCard, productCardTwo])
        stack.axis = .horizontal
        stack.spacing = 16
        return stack
    }()
    
    private lazy var stackTwo: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [productCardThree, productCardFour])
        stack.axis = .horizontal
        stack.spacing = 16
        return stack
    }()
    
    private lazy var stackThree: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [productCardFive, productCardSix])
        stack.axis = .horizontal
        stack.spacing = 16
        return stack
    }()
    
    private lazy var stackVertical: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [stack, stackTwo, stackThree])
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupProductCard()
        SetupUI()
        setupConstraints()
        
    }
    
    private func setupProductCard() {
        
        productCard.configure(image: UIImage(named: "food1"), title: "Product Name")
        productCardTwo.configure(image: UIImage(named: "food1"), title: "Product Name")
        productCardThree.configure(image: UIImage(named: "food1"), title: "Product Name")
        productCardFour.configure(image: UIImage(named: "food1"), title: "Product Name")
        productCardFive.configure(image: UIImage(named: "food1"), title: "Product Name")
        productCardSix.configure(image: UIImage(named: "food1"), title: "Product Name")
    }
    
    private func SetupUI() {
        view.addSubview(bannerView)
        bannerView.addSubview(bannerImage)
        bannerView.addSubview(bannerTitle)
        
        view.addSubview(Text)
        view.addSubview(TextTwo)
        
        view.addSubview(Hashtag)
        view.addSubview(HashtagTwo)
        
        view.addSubview(cardBackground)
        
        cardBackground.addSubview(scrollView)
        scrollView.addSubview(stackVertical)
    }
    
    private func setupConstraints() {
        [productCard, bannerView, bannerImage, bannerTitle, Text, TextTwo, Hashtag, HashtagTwo, cardBackground, stackVertical,scrollView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [productCard, productCardTwo, productCardThree, productCardFour, productCardFive,  productCardSix].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.heightAnchor.constraint(equalToConstant: 250).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 170).isActive = true
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
            
            Text.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 23),
            Text.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            Text.widthAnchor.constraint(equalToConstant: 105),
            Text.heightAnchor.constraint(equalToConstant: 28),
            
            TextTwo.topAnchor.constraint(equalTo: Text.bottomAnchor, constant: 11),
            TextTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            TextTwo.widthAnchor.constraint(equalToConstant: 103),
            TextTwo.heightAnchor.constraint(equalToConstant: 23),
            
            Hashtag.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 23),
            Hashtag.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            Hashtag.widthAnchor.constraint(equalToConstant: 59),
            Hashtag.heightAnchor.constraint(equalToConstant: 28),
            
            HashtagTwo.topAnchor.constraint(equalTo: Hashtag.bottomAnchor, constant: 11),
            HashtagTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            HashtagTwo.widthAnchor.constraint(equalToConstant: 115),
            HashtagTwo.heightAnchor.constraint(equalToConstant: 28),
            
            cardBackground.topAnchor.constraint(equalTo: TextTwo.bottomAnchor, constant: 15),
            cardBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cardBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cardBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollView.topAnchor.constraint(equalTo: cardBackground.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: cardBackground.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: cardBackground.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: cardBackground.bottomAnchor),
            
            stackVertical.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 25),
            stackVertical.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackVertical.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        
    }
}

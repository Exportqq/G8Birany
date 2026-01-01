import UIKit

final class MainPage: UIViewController {


    private let logo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let imageFood: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "food")
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Cooking"
        label.font = UIFont(name: "BigShoulders-ExtraBold", size: 80)
        label.textColor = UIColor(named: "customPink")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let titleTwoLabel: UILabel = {
        let label = UILabel()
        label.text = "experience"
        label.font = UIFont(name: "BigShoulders-ExtraBold", size: 80)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let titleThreeLabel: UILabel = {
        let label = UILabel()
        label.text = "like a chef"
        label.font = UIFont(name: "BigShoulders-ExtraBold", size: 80)
        label.textColor = UIColor(named: "customPink")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let radioButton: ActionButton = {
        let button = ActionButton(
            title: "Get Started",
            gradientColors: [.pinkGradientBlack, .pinkGradientWhite],
            circleColor: .white,
            arrowColor: .black,
            textColor: .white,
            cornerRadius: 60,
            width: 320,
            height: 120
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupActions()
    }


    private func setupView() {
        view.backgroundColor = UIColor(named: "mainClr")
        view.addSubview(logo)
        view.addSubview(imageFood)
        view.addSubview(titleLabel)
        view.addSubview(titleTwoLabel)
        view.addSubview(titleThreeLabel)
        view.addSubview(radioButton)
    }

    private func setupActions() {
        radioButton.addTarget(self, action: #selector(getStartedTapped), for: .primaryActionTriggered)
    }

    @objc private func getStartedTapped() {
        print("Button tapped!")
        let nextVC = NextViewController() // экран, на который переходим
        navigationController?.pushViewController(nextVC, animated: true)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: view.topAnchor, constant: 66),
            logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            logo.widthAnchor.constraint(equalToConstant: 107),
            logo.heightAnchor.constraint(equalToConstant: 20),

            imageFood.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 15),
            imageFood.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageFood.widthAnchor.constraint(equalToConstant: 378),
            imageFood.heightAnchor.constraint(equalToConstant: 326),

            titleLabel.topAnchor.constraint(equalTo: imageFood.bottomAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.heightAnchor.constraint(equalToConstant: 92),

            titleTwoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -15),
            titleTwoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleTwoLabel.heightAnchor.constraint(equalToConstant: 80),

            titleThreeLabel.topAnchor.constraint(equalTo: titleTwoLabel.bottomAnchor),
            titleThreeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleThreeLabel.heightAnchor.constraint(equalToConstant: 80),

            radioButton.topAnchor.constraint(equalTo: titleThreeLabel.bottomAnchor, constant: 20),
            radioButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

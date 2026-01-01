import UIKit

final class ActionButton: UIControl {


    private let gradientLayer = CAGradientLayer()

    private let circleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let arrowImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "arrow")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    private var circleLeadingConstraint: NSLayoutConstraint!
    private var widthConstraint: NSLayoutConstraint!
    private var heightConstraint: NSLayoutConstraint!


    private let initialLeading: CGFloat = 12
    private var panStartX: CGFloat = 0

    private var cornerRadius: CGFloat
    private var buttonWidth: CGFloat
    private var buttonHeight: CGFloat


    init(
        title: String,
        gradientColors: [UIColor],
        circleColor: UIColor,
        arrowColor: UIColor,
        textColor: UIColor,
        cornerRadius: CGFloat,
        width: CGFloat,
        height: CGFloat
    ) {
        self.cornerRadius = cornerRadius
        self.buttonWidth = width
        self.buttonHeight = height
        super.init(frame: .zero)

        setupUI()
        setupConstraints()
        setupGesture()
        configure(
            title: title,
            gradientColors: gradientColors,
            circleColor: circleColor,
            arrowColor: arrowColor,
            textColor: textColor
        )
    }

    required init?(coder: NSCoder) {
        fatalError("Use init(...)")
    }


    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = cornerRadius
        layer.cornerRadius = cornerRadius
        circleView.layer.cornerRadius = circleView.bounds.height / 2
    }


    private func setupUI() {
        layer.insertSublayer(gradientLayer, at: 0)

        addSubview(titleLabel)
        addSubview(circleView)
        circleView.addSubview(arrowImage)

        circleView.layer.zPosition = 2
    }

    private func setupConstraints() {
        circleLeadingConstraint = circleView.leadingAnchor.constraint(
            equalTo: leadingAnchor,
            constant: initialLeading
        )

        widthConstraint = widthAnchor.constraint(equalToConstant: buttonWidth)
        heightConstraint = heightAnchor.constraint(equalToConstant: buttonHeight)

        NSLayoutConstraint.activate([
            widthConstraint,
            heightConstraint,

            circleLeadingConstraint,
            circleView.centerYAnchor.constraint(equalTo: centerYAnchor),
            circleView.widthAnchor.constraint(equalToConstant: 100),
            circleView.heightAnchor.constraint(equalToConstant: 100),

            arrowImage.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            arrowImage.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            arrowImage.widthAnchor.constraint(equalToConstant: 100),
            arrowImage.heightAnchor.constraint(equalToConstant: 100),

            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
        ])
    }

    private func setupGesture() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        circleView.addGestureRecognizer(pan)
        circleView.isUserInteractionEnabled = true
    }


    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {
        switch gesture.state {

        case .began:
            panStartX = circleLeadingConstraint.constant

        case .changed:
            let translation = gesture.translation(in: self)
            let maxLeading = bounds.width - circleView.bounds.width - initialLeading
            var newLeading = panStartX + translation.x
            newLeading = min(max(initialLeading, newLeading), maxLeading)
            circleLeadingConstraint.constant = newLeading

            let circleRight = circleView.frame.maxX
            let titleLeft = titleLabel.frame.minX
            let fadeRange: CGFloat = 40

            let distance = titleLeft - circleRight
            let alpha = min(max(distance / fadeRange, 0), 1)
            titleLabel.alpha = alpha

        case .ended, .cancelled:
            let maxLeading = bounds.width - circleView.bounds.width - initialLeading

            if circleLeadingConstraint.constant >= maxLeading {
                sendActions(for: .primaryActionTriggered)
            }

            UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut) {
                self.circleLeadingConstraint.constant = self.initialLeading
                self.titleLabel.alpha = 1
                self.layoutIfNeeded()
            }

        default:
            break
        }
    }

    private func configure(
        title: String,
        gradientColors: [UIColor],
        circleColor: UIColor,
        arrowColor: UIColor,
        textColor: UIColor
    ) {
        titleLabel.text = title
        titleLabel.textColor = textColor

        circleView.backgroundColor = circleColor
        arrowImage.tintColor = arrowColor

        gradientLayer.colors = gradientColors.map { $0.cgColor }
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
    }
}

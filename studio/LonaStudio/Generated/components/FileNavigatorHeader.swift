import AppKit
import Foundation

// MARK: - FileNavigatorHeader

public class FileNavigatorHeader: NSBox {

  // MARK: Lifecycle

  public init(_ parameters: Parameters) {
    self.parameters = parameters

    super.init(frame: .zero)

    setUpViews()
    setUpConstraints()

    update()
  }

  public convenience init(titleText: String, dividerColor: NSColor, fileIcon: NSImage) {
    self.init(Parameters(titleText: titleText, dividerColor: dividerColor, fileIcon: fileIcon))
  }

  public convenience init() {
    self.init(Parameters())
  }

  public required init?(coder aDecoder: NSCoder) {
    self.parameters = Parameters()

    super.init(coder: aDecoder)

    setUpViews()
    setUpConstraints()

    update()
  }

  // MARK: Public

  public var titleText: String {
    get { return parameters.titleText }
    set {
      if parameters.titleText != newValue {
        parameters.titleText = newValue
      }
    }
  }

  public var dividerColor: NSColor {
    get { return parameters.dividerColor }
    set {
      if parameters.dividerColor != newValue {
        parameters.dividerColor = newValue
      }
    }
  }

  public var fileIcon: NSImage {
    get { return parameters.fileIcon }
    set {
      if parameters.fileIcon != newValue {
        parameters.fileIcon = newValue
      }
    }
  }

  public var parameters: Parameters {
    didSet {
      if parameters != oldValue {
        update()
      }
    }
  }

  // MARK: Private

  private var innerView = NSBox()
  private var imageView = LNAImageView()
  private var titleView = LNATextField(labelWithString: "")
  private var dividerView = NSBox()

  private var titleViewTextStyle = TextStyles.regular

  private func setUpViews() {
    boxType = .custom
    borderType = .noBorder
    contentViewMargins = .zero
    innerView.boxType = .custom
    innerView.borderType = .noBorder
    innerView.contentViewMargins = .zero
    dividerView.boxType = .custom
    dividerView.borderType = .noBorder
    dividerView.contentViewMargins = .zero
    titleView.lineBreakMode = .byWordWrapping

    addSubview(innerView)
    addSubview(dividerView)
    innerView.addSubview(imageView)
    innerView.addSubview(titleView)

    fillColor = Colors.headerBackground
    titleViewTextStyle = TextStyles.regular
    titleView.attributedStringValue = titleViewTextStyle.apply(to: titleView.attributedStringValue)
  }

  private func setUpConstraints() {
    translatesAutoresizingMaskIntoConstraints = false
    innerView.translatesAutoresizingMaskIntoConstraints = false
    dividerView.translatesAutoresizingMaskIntoConstraints = false
    imageView.translatesAutoresizingMaskIntoConstraints = false
    titleView.translatesAutoresizingMaskIntoConstraints = false

    let heightAnchorConstraint = heightAnchor.constraint(equalToConstant: 38)
    let innerViewTopAnchorConstraint = innerView.topAnchor.constraint(equalTo: topAnchor)
    let innerViewLeadingAnchorConstraint = innerView.leadingAnchor.constraint(equalTo: leadingAnchor)
    let innerViewTrailingAnchorConstraint = innerView.trailingAnchor.constraint(equalTo: trailingAnchor)
    let dividerViewBottomAnchorConstraint = dividerView.bottomAnchor.constraint(equalTo: bottomAnchor)
    let dividerViewTopAnchorConstraint = dividerView.topAnchor.constraint(equalTo: innerView.bottomAnchor)
    let dividerViewLeadingAnchorConstraint = dividerView.leadingAnchor.constraint(equalTo: leadingAnchor)
    let dividerViewTrailingAnchorConstraint = dividerView.trailingAnchor.constraint(equalTo: trailingAnchor)
    let imageViewLeadingAnchorConstraint = imageView
      .leadingAnchor
      .constraint(equalTo: innerView.leadingAnchor, constant: 12)
    let imageViewCenterYAnchorConstraint = imageView.centerYAnchor.constraint(equalTo: innerView.centerYAnchor)
    let titleViewLeadingAnchorConstraint = titleView
      .leadingAnchor
      .constraint(equalTo: imageView.trailingAnchor, constant: 6)
    let titleViewTopAnchorConstraint = titleView.topAnchor.constraint(greaterThanOrEqualTo: innerView.topAnchor)
    let titleViewCenterYAnchorConstraint = titleView.centerYAnchor.constraint(equalTo: innerView.centerYAnchor)
    let titleViewBottomAnchorConstraint = titleView.bottomAnchor.constraint(lessThanOrEqualTo: innerView.bottomAnchor)
    let dividerViewHeightAnchorConstraint = dividerView.heightAnchor.constraint(equalToConstant: 1)
    let imageViewHeightAnchorConstraint = imageView.heightAnchor.constraint(equalToConstant: 20)
    let imageViewWidthAnchorConstraint = imageView.widthAnchor.constraint(equalToConstant: 20)

    NSLayoutConstraint.activate([
      heightAnchorConstraint,
      innerViewTopAnchorConstraint,
      innerViewLeadingAnchorConstraint,
      innerViewTrailingAnchorConstraint,
      dividerViewBottomAnchorConstraint,
      dividerViewTopAnchorConstraint,
      dividerViewLeadingAnchorConstraint,
      dividerViewTrailingAnchorConstraint,
      imageViewLeadingAnchorConstraint,
      imageViewCenterYAnchorConstraint,
      titleViewLeadingAnchorConstraint,
      titleViewTopAnchorConstraint,
      titleViewCenterYAnchorConstraint,
      titleViewBottomAnchorConstraint,
      dividerViewHeightAnchorConstraint,
      imageViewHeightAnchorConstraint,
      imageViewWidthAnchorConstraint
    ])
  }

  private func update() {
    dividerView.fillColor = dividerColor
    titleView.attributedStringValue = titleViewTextStyle.apply(to: titleText)
    imageView.image = fileIcon
  }
}

// MARK: - Parameters

extension FileNavigatorHeader {
  public struct Parameters: Equatable {
    public var titleText: String
    public var dividerColor: NSColor
    public var fileIcon: NSImage

    public init(titleText: String, dividerColor: NSColor, fileIcon: NSImage) {
      self.titleText = titleText
      self.dividerColor = dividerColor
      self.fileIcon = fileIcon
    }

    public init() {
      self.init(titleText: "", dividerColor: NSColor.clear, fileIcon: NSImage())
    }

    public static func ==(lhs: Parameters, rhs: Parameters) -> Bool {
      return lhs.titleText == rhs.titleText && lhs.dividerColor == rhs.dividerColor && lhs.fileIcon == rhs.fileIcon
    }
  }
}

// MARK: - Model

extension FileNavigatorHeader {
  public struct Model: LonaViewModel, Equatable {
    public var id: String?
    public var parameters: Parameters
    public var type: String {
      return "FileNavigatorHeader"
    }

    public init(id: String? = nil, parameters: Parameters) {
      self.id = id
      self.parameters = parameters
    }

    public init(_ parameters: Parameters) {
      self.parameters = parameters
    }

    public init(titleText: String, dividerColor: NSColor, fileIcon: NSImage) {
      self.init(Parameters(titleText: titleText, dividerColor: dividerColor, fileIcon: fileIcon))
    }

    public init() {
      self.init(titleText: "", dividerColor: NSColor.clear, fileIcon: NSImage())
    }
  }
}

//
//  File.swift
//  
//
//  Created by Vladislav Lidiaev on 25.02.2023.
//

import UIKit
import LayoutHelpers

protocol HomeScreenView {
  var controller: HomeScreenInternalController? { set get }
  func update(model: HomeScreenModel)
}

final class HomeScreenViewImpl: UIViewController, HomeScreenView {
  weak var controller: HomeScreenInternalController?

  private var newsModel: NewsModel?

  private lazy var tableView = makeTableView()
  private lazy var activityIndicatorView = makeActivityIndicatorView()
  private lazy var errorView = makeErrorView()
  private var subviews: [UIView] {[
      tableView,
      activityIndicatorView,
      errorView
  ]}

  init() {
    super.init(nibName: nil, bundle: nil)
    setup()
  }

  @available(*, unavailable)
  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  func update(model: HomeScreenModel) {
    switch model {
    case .idle:
      break
    case .presenting(let viewController):
      viewController.present(self, animated: false)
      controller?.handle(.presented)
    case .loading:
      hideSubviews(excluding: activityIndicatorView)
      activityIndicatorView.startAnimating()
    case .data(let newsModel):
      hideSubviews(excluding: tableView)
      self.newsModel = newsModel
      tableView.reloadData()
    case .error:
      hideSubviews(excluding: errorView)
    }
  }

  private func setup() {
    modalPresentationStyle = .fullScreen
    view.backgroundColor = .white
  }

  private func setupUI() {
    view.addSubview(tableView)
    tableView.pinEdgesToSuperview()

    view.addSubview(activityIndicatorView)
    activityIndicatorView.pinEdgesToSuperview()

    view.addSubview(errorView)
    errorView.pinEdgesToSuperview()

    hideSubviews()
  }

  private func hideSubviews(excluding: UIView? = nil) {
    excluding?.isHidden = false
    subviews.forEach {
      if $0 !== excluding {
        $0.isHidden = true
      }
    }
  }

  private func makeTableView() -> UITableView {
    let tableView = UITableView().autoLayout()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.delegate = self
    tableView.dataSource = self
    return tableView
  }

  private func makeActivityIndicatorView() -> UIActivityIndicatorView {
    let activityIndicatorView = UIActivityIndicatorView().autoLayout()
    activityIndicatorView.hidesWhenStopped = true
    return activityIndicatorView
  }

  private func makeErrorView() -> UILabel {
    let label = UILabel().autoLayout()
    label.text = "ERROR"
    return label
  }
}

extension HomeScreenViewImpl: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let newsModel else { return .zero }
    return newsModel.articles.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

    guard let article = newsModel?.articles[indexPath.row] else { return cell }
    cell.textLabel?.text = article.title
    return cell
  }
}

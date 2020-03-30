//
//  ViewController.swift
//  Parallax
//
//  Created by Khurram on 30/03/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

struct Item {
let image: UIImage
let contributerName: String
}

final class ViewController: UIViewController {

@IBOutlet weak var tableView: UITableView!
private var viewHeight: CGFloat = 0
private let minimumConstraint: CGFloat = 20
private let constraintRange: CGFloat = 100
private let items = [
  Item(image: #imageLiteral(resourceName: "nadine-shaabana.jpg"), contributerName: "Nadine Shaabana"),
  Item(image: #imageLiteral(resourceName: "yucel-moran.jpg"), contributerName: "Yucel Moran"),
  Item(image: #imageLiteral(resourceName: "bosco-shots.jpg"), contributerName: "Bosco Shots"),
  Item(image: #imageLiteral(resourceName: "charles-deluvio.jpg"), contributerName: "Charles Deluvio"),
  Item(image: #imageLiteral(resourceName: "jason-leung.jpg"), contributerName: "Jason Leung"),
  Item(image: #imageLiteral(resourceName: "harley-davidson.jpg"), contributerName: "Harley-Davidson"),
  Item(image: #imageLiteral(resourceName: "annie-spratt.jpg"), contributerName: "Annie Spratt"),
  Item(image: #imageLiteral(resourceName: "robert-gomez.jpg"), contributerName: "Robert Gomez"),
  Item(image: #imageLiteral(resourceName: "dave-weatherall.jpg"), contributerName: "Dave Weatherall"),
  Item(image: #imageLiteral(resourceName: "adomas-aleno.jpg"), contributerName: "Adomas Aleno")
]

override func viewWillAppear(_ animated: Bool) {
  super.viewWillAppear(animated)
  viewHeight = view.bounds.height
}
override func viewDidAppear(_ animated: Bool) {
  super.viewDidAppear(animated)
  updateVisibleLabelPositions()
}
}

extension ViewController: UITableViewDataSource {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  items.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
  if let tableViewCell = cell as? TableViewCell {
    configure(tableViewCell, indexPath: indexPath)
  }
  return cell
}
  
}

extension ViewController: UITableViewDelegate {

func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
  guard  let tableViewCell = cell as? TableViewCell else { return }
  updateLabelPosition(tableViewCell)
}
func scrollViewDidScroll(_ scrollView: UIScrollView) {
  updateVisibleLabelPositions()
}
  
}

extension ViewController {
private func updateVisibleLabelPositions() {
  guard let cells = tableView.visibleCells as? [TableViewCell] else { return }
  for cell in cells {
    updateLabelPosition(cell)
  }
}
private func updateLabelPosition(_ cell: TableViewCell) {
  let point = view.convert(cell.contributerNameLabel.frame.origin, from: cell.contentView)
  let ratio = point.y / viewHeight
  
  let updatedConstraint = (ratio * constraintRange) + minimumConstraint
  cell.nameLabelTopConstraint.constant = updatedConstraint
}
private func configure(_ cell: TableViewCell, indexPath: IndexPath) {
  cell.featureImageView.image = items[indexPath.row].image
  cell.contributerNameLabel.text = items[indexPath.row].contributerName
}
}

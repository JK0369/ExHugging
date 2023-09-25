//
//  ViewController.swift
//  ExHugging
//
//  Created by 김종권 on 2023/09/26.
//

import UIKit

class ViewController: UIViewController {
    private let stackView = {
        let view = UIStackView()
        view.spacing = 8
        return view
    }()
    private let leftLabel = {
        let label = UILabel()
        label.text = "왼쪽"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.backgroundColor = .lightGray
        return label
    }()
    private let centerView = SomeView()
    private let rightLabel = {
        let label = UILabel()
        label.text = "오른쪽"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.backgroundColor = .blue.withAlphaComponent(0.3)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        [leftLabel, centerView, rightLabel]
            .forEach(stackView.addArrangedSubview(_:))
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        // 1. 뷰에 hugging
        centerView.setContentHuggingPriority(.required, for: .horizontal)
        
//        // 2. label에 hugging
//        centerView.label.setContentHuggingPriority(.required, for: .horizontal)
    }
}

final class SomeView: UIView {
    let label = {
        let label = UILabel()
        label.text = "예제 라벨"
        label.textColor = .black
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .brown
        label.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

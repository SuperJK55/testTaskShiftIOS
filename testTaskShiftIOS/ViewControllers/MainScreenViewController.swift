//
//  MainScreenViewController.swift
//  testTaskShiftIOS
//
//  Created by Stepan Kolenkin on 04.08.2025.
//

import UIKit

class MainScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let productViewModel: ProductViewModel
    
    init(productViewModel: ProductViewModel){
        self.productViewModel = productViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private lazy var helloButton: UIButton = {
        let button = CustomBlueButton()
        button.setTitle("Приветствие", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productViewModel.onDataUpdated = { [weak self] in
            self?.tableView.reloadData()
        }
        productViewModel.fetchProductData()
        
        setupUI()
    }
    
    private func setupUI() {
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backgroundView.addSubview(tableView)
        tableView.frame = view.bounds
        
        backgroundView.addSubview(helloButton)
        helloButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(helloButton.snp.top).offset(-16)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productViewModel.getProductCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let item = productViewModel.getProduct(at: indexPath.row) {
            cell.textLabel?.text = "\(item.title) - \(item.price) $"
        }
        
        cell.textLabel?.numberOfLines = 2
        return cell
    }
    
}

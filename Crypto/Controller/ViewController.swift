//
//  ViewController.swift
//  Crypto
//
//  Created by Andrew on 15/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var symbolLbl: UILabel!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var logoImgVw: UIImageView!
    
    @IBOutlet weak var usdLbl: UILabel!
    
    @IBOutlet weak var percentLbl: UILabel!
    
    @IBOutlet weak var filterBtnOutl: UIButton!
    
    @IBOutlet weak var searchBarOutl: UISearchBar!
    
    
    lazy var detailsVM: DetailsVM = {
        
        return DetailsVM()
    }()
    
    var noDataLabel =  UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        uI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touch = touches.first
        if touch?.view == self.view {
            dismiss(animated: true, completion: nil)
            view.endEditing(true)
        }
    }
    
    func uI(){
        filterBtnOutl.titleLabel?.textColor = UIColor.clear
        detailsVM.getDetails()
        detailsVM.bind = {
            self.detailsVM.getLogo(self.detailsVM.ids)
            self.detailsVM.bindToView = {
                self.updateUI()
            }
        }
    }
    
    func updateUI(){
        DispatchQueue.main.async {
            self.topView()
            self.tableView.reloadData()
        }
    }
    
    func topView(){
        if detailsVM.responseModel?.data?.count ?? 0 > 0 {
            symbolLbl.text = detailsVM.responseModel?.data?[0].symbol
            nameLbl.text = detailsVM.responseModel?.data?[0].name
            let mmm = detailsVM.logoModel?.data?[arrrr[0]]
            logoImgVw.imageFromUrl(urlString: (mmm?.logo)!)
            usdLbl.text = "$\(detailsVM.responseModel?.data?[0].quote?.uSD?.price?.rounded(toPlaces: 2) ?? 0.0) USD"
            percentLbl.text = "\(detailsVM.responseModel?.data?[0].quote?.uSD?.percent_change_1h?.rounded(toPlaces: 3) ?? 0.0)"
        }else{
            symbolLbl.text = "-"
            nameLbl.text = "-"
            logoImgVw.image = UIImage(systemName: "person.crop.circle.fill")
            percentLbl.text = "-"
            usdLbl.text = "-"
        }
    }
    
    @IBAction func filterBtn(_ sender: UIButton) {
        actionSheet()
    }
    
    func actionSheet() {
        let actionsheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        actionsheet.addAction(UIAlertAction(title: "Sort by price", style: UIAlertAction.Style.default, handler: { (action) -> Void in
            var sorted = self.detailsVM.responseModel?.data?.sorted(by: {$0.quote?.uSD?.price ?? 0>$1.quote?.uSD?.price ?? 0})
            self.detailsVM.responseModel?.data? = sorted ?? [Data]()
            self.updateUI()
        }))
        
        actionsheet.addAction(UIAlertAction(title: "Sort by volume_24h", style: UIAlertAction.Style.default, handler: { (action) -> Void in
            var sorted = self.detailsVM.responseModel?.data?.sorted(by: {$0.quote?.uSD?.volume_24h ?? 0>$1.quote?.uSD?.volume_24h ?? 0})
            self.detailsVM.responseModel?.data? = sorted ?? [Data]()
            
            self.updateUI()
        }))
        
        actionsheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { (action) -> Void in
        }))
        
        self.present(actionsheet, animated: true, completion:{
            actionsheet.view.superview?.isUserInteractionEnabled = true
        })
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if detailsVM.responseModel?.data?.count ?? 0 > 0{
            return (detailsVM.responseModel?.data?.count ?? 0)-1
        }else{
           
            return 1
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = (tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell)!
        if detailsVM.responseModel?.data?.count ?? 0 > 0 {
            cell.noResultLbl.isHidden = true
            cell.nameLbl.text = detailsVM.responseModel?.data?[indexPath.row+1].name
            cell.symbolLbl.text = detailsVM.responseModel?.data?[indexPath.row+1].symbol
            cell.usdLbl.text = "$\(detailsVM.responseModel?.data?[indexPath.row+1].quote?.uSD?.price?.rounded(toPlaces: 2) ?? 0.0) USD"
            cell.percentLbl.textColor = detailsVM.responseModel?.data?[indexPath.row+1].quote?.uSD?.percent_change_1h ?? 0.00 >= 0.00 ? UIColor(named: "Color") : UIColor.red
            cell.percentLbl.text = "\(detailsVM.responseModel?.data?[indexPath.row+1].quote?.uSD?.percent_change_1h?.rounded(toPlaces: 3) ?? 0.0)"
            cell.graphImgVw.image = detailsVM.responseModel?.data?[indexPath.row+1].quote?.uSD?.percent_change_1h ?? 0.00 >= 0.00 ? UIImage(named: "Image 13") : UIImage(named: "Image 12")
            
            let mmm = detailsVM.logoModel?.data?[arrrr[indexPath.row+1]]
            
            cell.logoImgVw.imageFromUrl(urlString: (mmm?.logo)!)
        }else{
            cell.noResultLbl.isHidden = false
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if detailsVM.responseModel?.data?.count ?? 0 > 0 {
            return 60
        }else{
            return tableView.frame.height
        }
    }
    
}

extension ViewController : UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBarOutl.text != "" {
            var filteredData = detailsVM.duplModel?.data?.filter{$0.name?.localizedCaseInsensitiveContains(searchBarOutl.text ?? "") ?? false || $0.symbol?.localizedCaseInsensitiveContains(searchBarOutl.text ?? "") ?? false}
            detailsVM.responseModel?.data = filteredData
            print(detailsVM.duplModel?.data?.count)
            updateUI()
        }else{
            self.viewWillAppear(true)
        }
        dismiss(animated: true, completion: nil)
        view.endEditing(true)
            searchBar.resignFirstResponder()
        }
}



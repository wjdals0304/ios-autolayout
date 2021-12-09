//
//  SelfSizingViewController.swift
//  AutolayoutCode
//
//  Created by 김정민 on 2021/12/09.
//

import UIKit

class SelfSizingViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter
            .default
            .addObserver(forName: NSNotification.Name("layoutCell")
                        , object: nil, queue: OperationQueue.main) { (noti) in
                        self.tableView.beginUpdates()
                        self.tableView.endUpdates()
        }
    }
    

}

extension SelfSizingViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        guard let customCell = cell as? CustomTableViewCell else {
            return cell
            
        }
        
        customCell.textLabel?.text = indexPath.description
        customCell.detailTextLabel?.text = """
               asdfasdfasfdsadfsafddsafsadfasfsaf
            asdfasdfasdfasdfasdfsadfasfsdafsadf
            asdfasdfasdfasdfasdfasdf

            """
        customCell.detailTextLabel?.numberOfLines = 0 
        
        return cell
    }
    
    
}



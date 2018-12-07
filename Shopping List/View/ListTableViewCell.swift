//
//  ListTableViewCell.swift
//  Shopping List
//
//  Created by Greg Hughes on 12/7/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

import UIKit

protocol ListTableViewCellDelegate: class {
    func cellButtonTapped(_ cell: ListTableViewCell)
}

class ListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var isCompleteButton: UIButton!
    
    weak var delegate: ListTableViewCellDelegate?
    
    var list : List? {
        didSet {
            updateViews()
        }
    }
    
 
   
    @IBAction func isCompleteButtonTapped(_ sender: Any) {
        
        delegate?.cellButtonTapped(self)
        print("hit")
        
       
        updateViews()
    }
    
    
    
    

   

    func updateViews(){
        
        if let list = list{
            itemLabel.text = list.item
        }
        
        if list?.isComplete == true{
            list?.isComplete = false
            isCompleteButton.setBackgroundImage(#imageLiteral(resourceName: "incomplete"), for: .normal)
        } else {
            list?.isComplete = true
            isCompleteButton.setBackgroundImage(#imageLiteral(resourceName: "complete"), for: .normal)
        }
        
    }
}

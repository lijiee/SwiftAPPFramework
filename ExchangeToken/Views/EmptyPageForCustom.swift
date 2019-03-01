//
//  EmptyPageForCustom.swif
//  OPTC
//
//  Created by fmkj on 2018/12/4.
//  Copyright © 2018 fmkj. All rights reserved.
//


import UIKit
import EmptyPage

class EmptyPageForCustom: UIView,EmptyPageContentViewProtocol {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var btn2: UIButton!
    
    @IBOutlet weak var label2: UILabel!
    var block: (()->())?
    @IBAction func btn2TapEvent(_ sender: UIButton) {
        block?()
    }
    
    class var initFromNib: EmptyPageForCustom {
        return Bundle.main.loadNibNamed(String(describing: self),
                                        owner: nil,
                                        options: nil)?.first! as! EmptyPageForCustom
    }
    
}

//
//  AnalyzeViewController.swift
//  assignment1
//
//  Created by sora on 28/9/14.
//  Copyright (c) 2014年 sora. All rights reserved.
//

import UIKit

class AnalyzeViewController: UIViewController {
    
    @IBOutlet weak var resultTextView: UITextView!
    var result = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resultTextView.text = "***********\nScore: \(result)\n***********"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

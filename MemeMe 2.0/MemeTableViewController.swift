//
//  MemeTableViewController.swift
//  MemeMe 2.0
//
//  Created by Long Wang on 2015-12-31.
//  Copyright © 2015 Long Wang. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController {
    var memes:[Meme]! {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @IBAction func addMeme(sender: AnyObject) {
        let memeEditorController = storyboard!.instantiateViewControllerWithIdentifier("MemeEditor") as! MemeEditorViewController
        
        self.presentViewController(memeEditorController, animated: true, completion: nil)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeTableViewCell", forIndexPath: indexPath) as! MemeTableViewCell
        let meme = self.memes[indexPath.row]
        
        // Set the Text Lab name and image
        
        cell.memeLabel.text = meme.topText + "...." + meme.bottomText
        cell.memeImageView?.image = meme.memedImage
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = self.memes[indexPath.row]
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }


}

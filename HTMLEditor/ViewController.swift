//
//  ViewController.swift
//  HTMLEditor
//
//  Created by VyacheslavKrivoi on 5/8/19.
//  Copyright © 2019 VyacheslavKrivoi. All rights reserved.
//
import MobileCoreServices
import UIKit
import WebKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITableViewDragDelegate {
   
    
    @IBAction func btnSave(_ sender: UIBarButtonItem) {
      // textViewField.text = getText.saveFile()
        getText.saveFile(textSave: textViewField.text)
    }
    @IBOutlet weak var tagsTableView: UITableView!
    @IBOutlet weak var textViewField: UITextView!

    var getText = OperationsWithData()
    var tagItems =  ["<h1>Large</h1>", "<b>Создает жирный текст</b>", "<i>Создает наклонный текст</i>",
                     "<font size=6>Устанавливает размер текста </font>", "<ul> </ul>", "<table></table>",
                     "<font color=?></font>","<title></title>" ]
    //[String](repeating: "Tags", count: 20)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
        textViewField.backgroundColor = UIColor.lightGray
        tagsTableView.dragDelegate = self
       // tagsTableView.dropDelegate = self
        tagsTableView.dragInteractionEnabled = true
        tagsTableView.dataSource = self
        
        tagsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        textViewField.text = getText.readFile()
     
    }
    
    
    func applicationWillTerminate(application: UIApplication) {
      getText.saveFile(textSave: textViewField.text)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return tagItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if tableView == tagsTableView {
            cell.textLabel?.text = tagItems[indexPath.row]
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "WebViewController") {
            let vc = segue.destination as! WebViewController
            vc.segue_in = textViewField.text
        }
    }
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let string = tagItems[indexPath.row]
        guard let data = string.data(using: .utf8) else { return [] }
        let itemProvider = NSItemProvider(item: data as NSData, typeIdentifier: kUTTypePlainText as String)
        return [UIDragItem(itemProvider: itemProvider)]
    }
    
}

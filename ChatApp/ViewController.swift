//
//  ViewController.swift
//  ChatApp
//
//  Created by Mahfooz0123 on 11/30/25.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var ref: DatabaseReference!

    @IBOutlet weak var txtChatText: UITextField!
    var UserName:String?
    @IBOutlet weak var laChatList: UITableView!
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        loginAnony()
            // Initialize Firebase Database reference
            self.ref = Database.database().reference()
        
            laChatList.delegate = self
            laChatList.dataSource = self
            
        }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfChatInfo.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellChat:TVCChat = tableView.dequeueReusableCell(withIdentifier: "cellChat", for: indexPath) as! TVCChat
        cellChat.setChat(chat: listOfChatInfo[indexPath.row])
        return cellChat
    }
    
    var listOfChatInfo = [Chat]()
    func loadChatRoom(){
        self.ref.child("chat").queryOrdered(byChild: "postDate").observe(.value, with:
        { ( snapshot ) in
            //
            self.listOfChatInfo.removeAll()
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot]{
                for snap in snapshot {
                    if let postData = snap.value as? [String:AnyObject]{
                        let username = postData["name"] as? String
                        let text = postData["text"] as? String
                        
                        var postDate:CLong?
                        if let postdateIn = postData["postDate"] as? CLong {
                            postDate = postdateIn
                        }
                        
                        self.listOfChatInfo.append(Chat(userName: username!, text: text!, datePost: "\(postDate)"))
                    }
                }
                self.laChatList.reloadData()
                let indexpath = IndexPath(row: self.listOfChatInfo.count-1, section: 0)
                self.laChatList.scrollToRow(at: indexpath, at: .bottom, animated: true)
            }
        })
    }

        func loginAnony() {
            Auth.auth().signInAnonymously { (authResult, error) in
                if let error = error {
                    print("Cannot login: \(error.localizedDescription)")
                } else {
                    print("User UID: \(authResult?.user.uid ?? "No UID")")
                    self.loadChatRoom()
                }
            }
        }
    @IBAction func buSendToRoom(_ sender: Any) {
        let dic = ["text" : txtChatText.text,
                   "name" : UserName!,
                   "postDate" : ServerValue.timestamp()] as [String : Any]
        self.ref.child("chat").childByAutoId().setValue(dic)
    }
    
    }


//
//  ViewController.swift
//  RealmCafecomJava
//
//  Created by Joel Backschat on 4/3/16.
//  Copyright © 2016 Joel Backschat. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    
    @IBOutlet weak var lblLabel: UILabel!
    var token:NotificationToken = NotificationToken()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        do{
            let realm:Realm = try! Realm()
            self.token = realm.addNotificationBlock { notification, realm in
                print("fui notificado")
            }
            let fake = realm.objectForPrimaryKey(FakeObject.self, key: 1)
            self.lblLabel.text = fake!.nome
        }catch{
            
        }
        
        
        do{
            let realm:Realm = try! Realm()
            let fakes = realm.objects(FakeObject).sorte
            if fakes.count < 1{
                let fake1 = FakeObject()
                fake1.id = 1
                fake1.nome = "cafe com java"
                try realm.write{
                    realm.add(fake1)
                }
            }
        }catch{
            fatalError("Erro ao criar o object \(error)")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func btnClicked(sender: AnyObject) {
        do{
            let realm:Realm = try Realm()
            let fake        = realm.objectForPrimaryKey(FakeObject.self, key: 1)
            try realm.write{
                fake!.nome         = "nome alterado"
                self.lblLabel.text =  fake!.nome
            }
        }catch{
            
        }
    }
}


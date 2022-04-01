//
//  HomeViewController.swift
//  CSview
//
//  Created by Shohjahon Numonovich on 3/29/22.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    let numberOfColumns: CGFloat = 2
    var items: Array<Post> = Array()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        inters()
        
    }
    // Mark: Method
    
    func inters (){
        addnavigation()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCell")
        if let flowlayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            let screnSize: CGRect = UIScreen.main.bounds
            let cellwidth = screnSize.width / numberOfColumns - 15
            flowlayout.itemSize = CGSize(width: cellwidth, height: cellwidth)
        }
        items.append(Post(name: "Macbook 13 Pro", image: "img_mac"))
        items.append(Post(name: "Samsung S8", image: "img_phone"))
        items.append(Post(name: "Macbook 13 Pro", image: "img_mac"))
        items.append(Post(name: "Samsung S8", image: "img_phone"))
        items.append(Post(name: "Macbook 13 Pro", image: "img_mac"))
        items.append(Post(name: "Samsung S8", image: "img_phone"))
        items.append(Post(name: "Macbook 13 Pro", image: "img_mac"))
        items.append(Post(name: "Samsung S8", image: "img_phone"))
        items.append(Post(name: "Macbook 13 Pro", image: "img_mac"))
        items.append(Post(name: "Samsung S8", image: "img_phone"))
        items.append(Post(name: "Macbook 13 Pro", image: "img_mac"))
        items.append(Post(name: "Samsung S8", image: "img_phone"))


    }
    
    func addnavigation (){
        let scroll = UIImage(named: "ic_scroll")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: scroll, style: .plain, target: self, action: #selector(scrollTapped))
        title = "Collection View"
    }
    
    func CallScrollController(){
        let vc = ScrollViewController(nibName: "ScrollViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func scrollTapped(){
        CallScrollController()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as!
        CollectionViewCell
        cell.proname.text = item.name
        cell.proimage.image = UIImage(named: item.image!)
        return cell
    }



}

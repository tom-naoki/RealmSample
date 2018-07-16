//
//  TimeLineViewController.swift
//  RealmSumple
//
//  Created by 倉富直城 on 2018/07/17.
//  Copyright © 2018年 com.kuratomi. All rights reserved.
//

import UIKit
import RealmSwift

class TimeLineViewController: UITableViewController {
    
    /*
     StoryboardからViewControllerがロードされた後に呼ばれる。
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // ツイートをRealmに追加する。
        let realm = try! Realm()
        try! realm.write {
            // JSONオブジェクトからTweetモデルを生成する。
            let tweet = Tweet(value: TwitterJSON.tweet)
            
            /*
             TweetモデルをRealmに追加する。
             TweetモデルはprimaryKeyがあり、重複して追加される可能性もあるため、
             updateをtrueにします。
             */
            realm.add(tweet, update: true)
        }
    }
    
    /*
     viewがロードされた後に呼ばれる。
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // cellの高さをAutoLayoutで構築するための設定。
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // MARK: - Table view data source
    
    /*
     tableViewの行(row)の数を返す。
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    /*
     特定のセクションと行(IndexPath)のcellを返す。
     */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TweetCell
        
        // Realmからツイートを取得する。
        let realm = try! Realm()
        let tweet = realm.object(ofType: Tweet.self,
                                 forPrimaryKey: TwitterJSON.tweetID)!
        cell.configure(tweet: tweet)
        
        return cell
    }
    
}

//
//  Tweet.swift
//  RealmSumple
//
//  Created by 倉富直城 on 2018/07/17.
//  Copyright © 2018年 com.kuratomi. All rights reserved.
//

import Foundation
import RealmSwift

/**
 ツイートモデル。
 公式ドキュメント: https://dev.twitter.com/overview/api/tweets
 */
class Tweet: Object {
    
    @objc dynamic var id = 0 // 一意のID
    @objc dynamic var created_at = "" // 作成された日付
    @objc dynamic var text = "" // 本文
    @objc dynamic var user: User? // ツイートを投稿したユーザ。ユーザモデルへの1対1の関連。
    
    /**
     読みやすいフォーマットに変更した日付文字列を返す。
     */
    var date: String {
        // created_atをDate型に変換する。
        let date = TwitterDateFormatter.api.date(from: created_at)!
        // dateを日本語のロケールで、読みやすいフォーマットに変更した日付文字列を返す。
        return TwitterDateFormatter.absolute.string(from: date)
    }
    
    /**
     プライマリキーとするプロパティ名を返す。
     */
    override class func primaryKey() -> String? {
        return "id" // idをプライマリキーに指定する
    }
    
}

//
//  Restaurant.swift
//  FoodPin
//
//  Created by NDHU_CSIE on 2020/11/19.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//

import UIKit
import CoreData

class Restaurant {
    var name: String
    var type: String
    var location: String
    var phone: String
    var summary: String
    var image: String
    var isVisited: Bool
    var rating: String
    
    init(name: String, type: String, location: String, phone: String, summary: String, image: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.phone = phone
        self.summary = summary
        self.image = image
        self.isVisited = isVisited
        self.rating = ""
    }
    
    static func writeRestaurantFromBegin() {
        
        let sourceArray: [Restaurant] = [
            Restaurant(name: "成旅晶贊飯店‧花蓮假期", type: "Fancy", location: "970台湾花蓮縣花蓮市中華路231號", phone: "+88638360099", summary: "在這裡，旅客可輕鬆前往市區內各大旅遊、購物、餐飲地點。 住宿位置優越讓旅客前往市區內的熱門景點變得方便快捷。 \n\n成旅晶贊飯店‧花蓮假期的一流設施和優質服務能確保客人住宿愉快。 住宿提供的服務，包括所有房型皆附免費WiFi, 每日客房清潔服務, 自助洗衣設備, 代客叫車服務, 24小時前台服務。", image: "成旅晶贊飯店‧花蓮假期.jpg", isVisited: false),
            Restaurant(name: "回然慢時旅居", type: "Cheap", location: "970台湾花蓮縣花蓮市國聯一路201號", phone: "+88638361116", summary: "無論您是因為出差或度假而造訪花蓮縣，回然慢時旅居都會是您的最佳住宿選擇。在這裡，旅客可輕鬆前往市區內各大旅遊、購物、餐飲地點。 中山公園, 花蓮市立圖書館, Hualien Railway Cultural Area也近在咫尺。", image: "回然慢時旅居.jpg", isVisited: false),
            Restaurant(name: "璽賓行旅", type: "Vacation", location: "970台湾花蓮縣花蓮市民權路2-6號", phone: "+88638316631", summary: "璽賓行旅的一流設施和優質服務能確保客人住宿愉快。 住宿擁有一系列獨具特色的服務，例如：所有房型皆附免費WiFi, 代客叫車服務, 可代收包裹, 專人辦理入住/退房服務, 每日客房清潔服務。 \n\n在這裡，您能真切的感受最極致的舒適住宿體驗，部分客房提供平面電視, 清潔用品, 開放式衣櫥, 免費即溶咖啡, 免費茶包，給住客更完整的服務。 住宿的娛樂設施豐富多樣，包括室外游泳池等。 專業的服務與豐富的特色活動盡在璽賓行旅。", image: "璽賓行旅.jpg", isVisited: false),
            Restaurant(name: "花蓮秧悅美地度假酒店", type: "Vacation", location: "973台湾花蓮縣吉安鄉干城二街100號", phone: "+88638129168", summary: "位於花蓮縣的絕佳享受自然，觀光地段，花蓮秧悦美地度假酒店提供最好的環境，讓您遠離塵囂。離市中心僅10KM的路程，能確保旅客快捷地前往當地的旅遊景點。住宿位置優越讓旅客前往市區內的熱門景點變得方便快捷。", image: "花蓮秧悅美地度假酒店.jpg", isVisited: false),
            Restaurant(name: "花蓮福康飯店", type: "Vacation", location: "970台湾花蓮縣花蓮市公園路5號", phone: "+88638337988", summary: "花蓮福康飯店坐落於花蓮市的中心地帶，是遊覽花蓮縣的最佳住宿選擇。 在這裡，旅客可輕鬆前往市區內各大旅遊、購物、餐飲地點。 住宿位置優越讓旅客前往市區內的熱門景點變得方便快捷。 \n\n花蓮福康飯店提供優質貼心的服務和方便實用的設施，贏得了客人的普遍好評。 住宿為了確保每位客人住宿期間都能獲得便利的服務，提供了所有房型皆附免費WiFi, 每日客房清潔服務, 紀念禮品店, 可代收包裹, 郵寄服務等設施和服務。", image: "花蓮福康飯店.jpg", isVisited: false),
            Restaurant(name: "遠雄悅來大飯店", type: "Vacation", location: "974台湾花蓮縣壽豐鄉山嶺18號", phone: "+88638123999", summary: "當您來訪花蓮縣時，遠雄悅來大飯店所提供的優質服務與高品質住宿將帶給您賓至如歸的享受。 離市中心僅10km的路程，能確保旅客快捷地前往當地的旅遊景點。 對於喜歡冒險的旅客來說，花東縱谷國家風景區, 東部海岸國家風景區, 花蓮海洋公園再合適不過了。", image: "遠雄悅來大飯店.jpg", isVisited: false),
            Restaurant(name: "承億文旅花蓮山知道飯店", type: "Vacation", location: "970台湾花蓮縣花蓮市國聯一路39號", phone: "+88638333111", summary: "位於花蓮縣的絕佳享受自然，觀光地段，花蓮秧悦美地度假酒店提供最好的環境，讓您遠離塵囂。離市中心僅10KM的路程，能確保旅客快捷地前往當地的旅遊景點。住宿位置優越讓旅客前往市區內的熱門景點變得方便快捷。", image: "承億文旅花蓮山知道飯店.jpg", isVisited: false),
            Restaurant(name: "煙波大飯店花蓮館", type: "Vacation", location: "970台湾花蓮縣花蓮市中美路142號", phone: "+88638222666", summary: "煙波大飯店花蓮館為商務和休閒旅遊遊客而設計，位於得天獨厚的花蓮地區，是本市最受歡迎的飯店之一。 在這裡，旅客們可輕鬆前往市區內各大旅遊、購物、餐飲地點。 飯店的客人能在遊覽花蓮縣石雕博物館, 松園別館, 美崙山生態公園等經典景點中愉悅身心。", image: "煙波大飯店花蓮館.jpg", isVisited: false)
        
        ]
        
        var restaurant: RestaurantMO!
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            for i in 0..<sourceArray.count {
                restaurant = RestaurantMO(context: appDelegate.persistentContainer.viewContext)
                restaurant.name = sourceArray[i].name
                restaurant.type = sourceArray[i].type
                restaurant.location = sourceArray[i].location
                restaurant.phone = sourceArray[i].phone
                restaurant.summary = sourceArray[i].summary
                restaurant.isVisited = false
                restaurant.rating = nil
                restaurant.image = UIImage(named: sourceArray[i].image)!.pngData()
            }
            appDelegate.saveContext() //write once for all new restauranrs
        }
    }
    
}


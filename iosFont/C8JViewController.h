//
//  C8JViewController.h
//  iosFont
//
//  Created by liulei on 2/13/13.
//  Copyright (c) 2013 cool8jay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface C8JViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    NSMutableArray *listOfItems; //声明一个NSMutableArray类型的变量。
    NSArray *titleFamilyNames;  //声名family names group的名字
    UITableView *tableView;
    
}

@end

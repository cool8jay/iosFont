//
//  C8JViewController.m
//  iosFont
//
//  Created by liulei on 2/13/13.
//  Copyright (c) 2013 cool8jay. All rights reserved.
//

#import "C8JViewController.h"

@implementation C8JViewController

#pragma mark -
#pragma mark View lifecycle

- (id)init{
    self = [super init];
    if(self){

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    tableView = [[[UITableView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height) style:UITableViewStyleGrouped] autorelease];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;

    listOfItems = [[NSMutableArray alloc] init];
    
    titleFamilyNames = [[UIFont familyNames] retain];
    for (NSString *familyName in titleFamilyNames) {
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        NSDictionary *fontNameDic = [NSDictionary dictionaryWithObject:fontNames forKey:@"Font family"];
        [listOfItems addObject:fontNameDic];
    }
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [listOfItems count];
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dictionary = [listOfItems objectAtIndex:section];
    NSArray *array = [dictionary objectForKey:@"Font family"];
    return [array count];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:CellIdentifier] autorelease];
    }
    
    NSDictionary *dictionary = [listOfItems objectAtIndex:indexPath.section];
    NSArray *array = [dictionary objectForKey:@"Font family"];
    NSString *cellValue = [array objectAtIndex:indexPath.row];
    [cell.textLabel setText:cellValue];
    [cell.textLabel setFont:[UIFont fontWithName:cellValue size:16]];
    
    return cell;
}

- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView
             accessoryForRowWithIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellAccessoryDisclosureIndicator;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *groupTitle = [titleFamilyNames objectAtIndex:section];
    
    return groupTitle;
}

- (void)dealloc {
    [titleFamilyNames release];
    [listOfItems release];
    [super dealloc];
}
@end

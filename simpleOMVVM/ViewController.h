//
//  ViewController.h
//  simpleOMVVM
//
//  Created by Muhammad Fawwaz Mayda on 01/09/21.
//

#import <UIKit/UIKit.h>
#import "ViewModel.h"

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong,nonatomic) UICollectionView *collectionView;
@property (strong,nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIView *containerView;
@property (strong, nonatomic) ViewModel *viewModel;

-(void)setupUI;
-(void)setupConstraint;

@end


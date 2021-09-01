//
//  ViewController.m
//  simpleOMVVM
//
//  Created by Muhammad Fawwaz Mayda on 01/09/21.
//

#import "ViewController.h"
#import "ViewModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
    [self setupConstraint];
}

-(void)setupUI {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(8, 8, 8, 8);
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.collectionView registerClass:UICollectionViewCell.class forCellWithReuseIdentifier:@"cell"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    
    self.containerView = [[UIView alloc] initWithFrame:CGRectZero];
    self.containerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.containerView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    //setup ViewModel
    
    _viewModel = [[ViewModel alloc] init];
    _viewModel.tableViewCallback = ^(NSIndexPath* indexPath) {
        NSLog(@"Should update table at: %ld",(long)indexPath.row);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    };
    
    _viewModel.collectionViewCallback = ^(NSIndexPath* indexPath) {
        NSLog(@"Should update collection at: %ld",indexPath.row);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
    };
    
}

-(void)setupConstraint {
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.collectionView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:20.0].active = YES;
    [self.collectionView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20.0].active = YES;
    [self.collectionView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-20.0].active = YES;
    [self.collectionView.heightAnchor constraintEqualToConstant:150.0].active = YES;
    
    self.containerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.containerView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:20.0].active = YES;
    [self.containerView.topAnchor constraintEqualToAnchor:self.collectionView.bottomAnchor constant:20.0].active = YES;
    [self.containerView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-20.0].active = YES;
    [self.containerView.bottomAnchor constraintEqualToAnchor:self.tableView.topAnchor constant:-20.0].active = YES;
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:20.0].active = YES;
    [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-20.0].active = YES;
    [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-20.0].active = YES;
    [self.tableView.heightAnchor constraintEqualToConstant:300.0].active = YES;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.stringArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.viewModel.stringArray[indexPath.row];
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.viewModel.colorArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Table Clicked at %ld",indexPath.row);
    [self.viewModel changeTableViewCellAt:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = self.viewModel.colorArray[indexPath.row];
    cell.layer.cornerRadius = 6.0;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Collection Clicked at %ld",indexPath.row);
    [self.viewModel changeCollectionViewCellAt:indexPath];
}

@end

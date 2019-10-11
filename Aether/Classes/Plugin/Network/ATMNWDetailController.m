//
//  ATMNWDetailController.m
//  Aether
//
//  Created by Felix on 2019/10/10.
//

#import "ATMNWDetailController.h"
#import "ATMNWDetailCell.h"
#import "ATMNWRecord.h"

@interface ATMNWDetailController ()

@property (nonatomic, strong) NSMutableArray<NSDictionary<NSString *, NSString *> *> *valueList;

@end

@implementation ATMNWDetailController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    self.collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.collectionView.alwaysBounceVertical = true;
    
    // Register cell classes
    [self.collectionView registerClass:[ATMNWDetailCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:[NSURL URLWithString:self.record.url].lastPathComponent];
    
    [self processData];
}

- (void)processData {
    
    if (self.record.requestHeader) {
        [self.valueList addObject:@{ATMNWKey: @"Request-Header",
                                    ATMNWValue: self.record.requestHeader}];
        
        
    }
    if (self.record.query) {
        [self.valueList addObject:@{ATMNWKey: @"Query",
                                    ATMNWValue: self.record.query}];
        
        
    }
    if (self.record.requestBody) {
        
        [self.valueList addObject:@{ATMNWKey: @"RequestBody",
                                    ATMNWValue: self.record.requestBody}];
    }
    if (self.record.response) {
        
        [self.valueList addObject:@{ATMNWKey: @"Response",
                                    ATMNWValue: self.record.response}];
    }
    
    [self.collectionView reloadData];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.valueList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ATMNWDetailCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    [cell config:self.valueList[indexPath.row]];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [[UIPasteboard generalPasteboard] setString:self.valueList[indexPath.row][ATMNWValue]];
}

/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
 return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
 return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
 
 }
 */

#pragma mark - Getter

- (NSMutableArray<NSDictionary<NSString *,NSString *> *> *)valueList {
    if (!_valueList) {
        _valueList = [NSMutableArray<NSDictionary<NSString *, NSString *> *> arrayWithCapacity:10];
    }
    return _valueList;
}

@end

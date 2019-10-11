//
//  ATMViewController.m
//  Aether
//
//  Created by Felix on 2019/10/8.
//

#import "ATMViewController.h"
#import "ATMViewCell.h"
#import "ATManager.h"

@interface ATMViewController ()
@property (nonatomic, strong) UIButton *sun;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ATMViewController

static NSString * const reuseIdentifier = @"Cell";
static CGFloat margin = 10.0f;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    self.view.backgroundColor = [UIColor clearColor];
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.hidden = true;
    self.collectionView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7f];
    self.collectionView.alwaysBounceVertical = true;
    [self.collectionView registerClass:[ATMViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    [self.view addSubview:self.sun];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(refreshStatus) userInfo:nil repeats:true];
}

- (void)refreshStatus {
    [self.collectionView reloadData];
}

- (void)togglePannel:(UIButton *)sender {
    
    self.collectionView.hidden = !self.collectionView.hidden;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [ATManager manager].plugins.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ATMViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    [cell configCell:[ATManager manager].plugins[indexPath.row]];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    id<ATMPluginProtocol> plugin = [ATManager manager].plugins[indexPath.row];
    if ([plugin respondsToSelector:@selector(performSelect:)]) {
        [plugin performSelector:@selector(performSelect:) withObject:self];
    }
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


/// handlerThePoint?
/// @param point point
- (BOOL)shouldHandlerPoint:(CGPoint)point {
    BOOL isHandler = false;
    
    if (CGRectContainsPoint(self.sun.frame, point)) return true;
    if (!self.collectionView.hidden) return true;
    
    return isHandler;
}

- (void)buttonChangePosition:(UIPanGestureRecognizer *)ges {
    
    CGPoint point = [ges locationInView:self.sun];
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGRect originFrame = self.sun.frame;

    if (originFrame.origin.x >= 0 &&
        originFrame.origin.x + originFrame.size.width <= screenSize.width) {
        originFrame.origin.x += point.x;
    }
    if (originFrame.origin.y >= 0 &&
        originFrame.origin.y + originFrame.size.height <= screenSize.height) {
        originFrame.origin.y += point.y;
    }

    if (UIGestureRecognizerStateBegan == ges.state) {

        self.sun.enabled = false;

    } else if (UIGestureRecognizerStateChanged == ges.state) {
        
        self.sun.center = [ges locationInView:self.view];
        
    } else {

        CGRect frame = self.sun.frame;
        CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
        BOOL overFlow = false;
        BOOL notAside = false;
        
        if (frame.origin.x < margin) {
            frame.origin.x = margin;
            overFlow = true;
        }
        if (frame.origin.x + frame.size.width + margin > screenSize.width) {
            frame.origin.x = screenSize.width - frame.size.width - margin;
            overFlow = true;
        }
        if (frame.origin.y < statusBarFrame.size.height) {
            frame.origin.y = statusBarFrame.size.height + margin;
            overFlow = true;
        }
        if (frame.origin.y + frame.size.height > screenSize.height) {
            frame.origin.y = screenSize.height - frame.size.height;
            overFlow = true;
        }
        
        if (frame.origin.x != margin && (frame.origin.x + frame.size.width + margin != screenSize.width)) {
            frame.origin.x = (frame.origin.x + frame.size.width/2 > screenSize.width/2)?(screenSize.width - margin - frame.size.width):margin;
            notAside = true;
        }
        
        
        if (overFlow || notAside) {
            [UIView animateWithDuration:0.3 animations:^{
                self.sun.frame = frame;
            }];
        }
        self.sun.enabled = true;
    }
}

#pragma mark - Getter

- (UIButton *)sun {
    if (!_sun) {
        _sun = [[UIButton alloc] initWithFrame:CGRectMake(margin, 100, 44, 44)];
        _sun.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        _sun.layer.shadowColor = [UIColor grayColor].CGColor;
        _sun.layer.cornerRadius = 5;
        _sun.layer.shadowRadius = 5;
        _sun.layer.shadowOffset = CGSizeZero;
        _sun.layer.shadowOpacity = .7;
        
        [_sun setBackgroundColor:[UIColor redColor]];
        [_sun setTitle:@"^O^" forState:UIControlStateNormal];
        [_sun addTarget:self action:@selector(togglePannel:) forControlEvents:UIControlEventTouchUpInside];
        
        UIPanGestureRecognizer *ges = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(buttonChangePosition:)];
        [_sun addGestureRecognizer:ges];
    }
    return _sun;
}

@end

//
//  ATMNWCell.m
//  Aether
//
//  Created by Felix on 2019/10/10.
//

#import "ATMNWCell.h"
#import "ATMNWRecord.h"

static CGFloat ATMMargin = 10.0f;

@interface ATMNWCell ()
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *valueLabel;
@end

@implementation ATMNWCell


- (void)config:(ATMNWRecord *)record {
    
    [self.titleLabel setText:record.method];
    [self.valueLabel setText:record.url];

}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self.contentView addSubview:self.bgView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.valueLabel];
        
        self.bgView.translatesAutoresizingMaskIntoConstraints = false;
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false;
        self.valueLabel.translatesAutoresizingMaskIntoConstraints = false;
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.bgView
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1
                                                                      constant:ATMMargin]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.bgView
                                                                     attribute:NSLayoutAttributeLeft
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeLeft
                                                                    multiplier:1
                                                                      constant:ATMMargin]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.bgView
                                                                     attribute:NSLayoutAttributeBottom
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeBottom
                                                                    multiplier:1
                                                                      constant:-ATMMargin]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.bgView
                                                                     attribute:NSLayoutAttributeRight
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeRight
                                                                    multiplier:1
                                                                      constant:-ATMMargin]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                     attribute:NSLayoutAttributeLeft
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeLeft
                                                                    multiplier:1
                                                                      constant:ATMMargin * 2]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                     attribute:NSLayoutAttributeRight
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeRight
                                                                    multiplier:1
                                                                      constant:-ATMMargin * 2]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1
                                                                      constant:ATMMargin]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                     attribute:NSLayoutAttributeHeight
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.valueLabel
                                                                     attribute:NSLayoutAttributeHeight
                                                                    multiplier:1
                                                                      constant:0]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.valueLabel
                                                                     attribute:NSLayoutAttributeLeft
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.titleLabel
                                                                     attribute:NSLayoutAttributeLeft
                                                                    multiplier:1
                                                                      constant:0]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.valueLabel
                                                                     attribute:NSLayoutAttributeRight
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.titleLabel
                                                                     attribute:NSLayoutAttributeRight
                                                                    multiplier:1
                                                                      constant:0]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.valueLabel
                                                                     attribute:NSLayoutAttributeBottom
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeBottom
                                                                    multiplier:1
                                                                      constant:-ATMMargin]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.valueLabel
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.titleLabel
                                                                     attribute:NSLayoutAttributeBottom
                                                                    multiplier:1
                                                                      constant:0]];

    }
    return self;
}

#pragma mark - Getter

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.layer.shadowColor = [UIColor grayColor].CGColor;
        _bgView.layer.shadowRadius = 15;
        _bgView.layer.shadowOffset = CGSizeZero;
        _bgView.layer.shadowOpacity = .7;
        _bgView.layer.cornerRadius = 15;
    }
    return _bgView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = [UIFont boldSystemFontOfSize:19];
        _titleLabel.textAlignment = NSTextAlignmentCenter;;
    }
    return _titleLabel;
}

- (UILabel *)valueLabel {
    if (!_valueLabel) {
        _valueLabel = [UILabel new];
        _valueLabel.numberOfLines = 0;
        _valueLabel.font = [UIFont systemFontOfSize:13];
        _valueLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _valueLabel;
}

@end

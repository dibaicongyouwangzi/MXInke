


//
//  MXLiveChatViewController.m
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/15.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "MXLiveChatViewController.h"
#import "MXLive.h"
#import <UIImageView+WebCache.h>
#import <YYKit.h>

@interface MXLiveChatViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *peopleCount;
@property (weak, nonatomic) IBOutlet UIImageView *shareImageView;
@property (nonatomic, strong) CAEmitterLayer *emitter;


@end

@implementation MXLiveChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.iconView.layer.cornerRadius = 15;
    self.iconView.layer.masksToBounds = YES;
    
    [self createEmitter];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.emitter removeFromSuperlayer];
}


- (void)createEmitter {
    CAEmitterLayer *emitter = [[CAEmitterLayer alloc] init];
    self.emitter = emitter;
    self.emitter.emitterPosition = CGPointMake(SCREEN_WIDTH - 80, SCREEN_HEIGHT - 30);
    self.emitter.preservesDepth = YES;

    CAEmitterCell *cell1 = [self createDifferentCell:@"heart_1"];
    CAEmitterCell *cell2 = [self createDifferentCell:@"heart_2"];
    CAEmitterCell *cell3 = [self createDifferentCell:@"heart_3"];
    CAEmitterCell *cell4 = [self createDifferentCell:@"heart_4"];
    CAEmitterCell *cell5 = [self createDifferentCell:@"heart_5"];
    self.emitter.emitterCells = @[cell1, cell2, cell3, cell4, cell5];
    [self.view.layer addSublayer:self.emitter];
}

- (CAEmitterCell *)createDifferentCell:(NSString *)imageName {
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.birthRate = 1;
    cell.lifetime = 5;
    cell.lifetimeRange = 2;
    cell.scale = 0.7;
    cell.scaleRange = 0.2;
    cell.emissionLongitude = -M_PI_2;
    cell.emissionRange = M_PI_2/6;
    cell.velocity = 70;
    cell.velocityRange = 50;
    cell.contents = (__bridge id _Nullable)([UIImage imageNamed:imageName].CGImage);
    cell.spin = 1.0;
    cell.spinRange = 0.8;
    return cell;
}


- (void)setLive:(MXLive *)live {
    _live = live;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:live.creator.portrait] placeholderImage:[UIImage imageNamed:@"default_room"]];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        self.peopleCount.text = [@(arc4random_uniform(10000)) stringValue];
    }];
}

@end

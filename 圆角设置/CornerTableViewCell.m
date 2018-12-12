//
//  CornerTableViewCell.m
//  圆角设置
//
//  Created by 处光夫 on 2018/12/7.
//  Copyright © 2018 处光夫. All rights reserved.
//

#import "CornerTableViewCell.h"
#import <YYKit.h>
#import "UIImageView+loadImage.h"

@implementation CornerTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatSubView];
    }
    return self;
}

-(void)creatSubView {
    self.imgV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 5, 80, 38.2)];
    
    NSURL *url = [NSURL URLWithString:@"https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png"];
    
    [self.imgV yulin_setImageWithUrl:url radius:40];
    
    self.imgV.backgroundColor = [UIColor redColor];
    [self addSubview:self.imgV];
}

@end

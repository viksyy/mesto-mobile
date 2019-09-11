//
//  LocationView.h
//  Mesto
//
//  Created by x on 4/1/19.
//  Copyright © 2019 x. All rights reserved.
//

#import "BaseView.h"

@interface LocationView : BaseView

@property (weak, nonatomic) IBOutlet UIButton *allowButton;
@property (weak, nonatomic) IBOutlet UIButton *denyButton;
@property (nonatomic, strong) void (^didTapAllow)(void);
- (IBAction)allowAction:(UIButton *)sender;
- (IBAction)denyAction:(UIButton *)sender;

@end

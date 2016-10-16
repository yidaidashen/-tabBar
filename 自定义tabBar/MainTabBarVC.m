//
//  MainTabBarVC.m
//  自定义tabBar
//
//  Created by shh on 16/8/29.
//  Copyright © 2016年 shh. All rights reserved.
//

#import "MainTabBarVC.h"
#import "VC01.h"
#import "VC02.h"
#import "VC03.h"

@interface MainTabBarVC ()

@property (nonatomic,weak) UIViewController *vc01;

@end

@implementation MainTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpAllVC];
    [self setUpAllTarBarButton];
    [self setUpTabBarBackgroundImage];
    [self addCameraButton];
    
    _vc01 = self.childViewControllers.firstObject;
    
    // Do any additional setup after loading the view.
}

//添加视频采集按钮
- (void)addCameraButton
{
    
    UIButton *cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
    [cameraBtn setImage:[UIImage imageNamed:@"tab_room"] forState:UIControlStateNormal];
    [cameraBtn setImage:[UIImage imageNamed:@"tab_room_p"] forState:UIControlStateHighlighted];
    
    //自适应,自动根据按钮图片和文字计算按钮尺寸
    [cameraBtn sizeToFit];
    
    cameraBtn.center = CGPointMake(self.tabBar.frame.size.width * 0.5, self.tabBar.frame.size.height * 0.5 + 5);
    [cameraBtn addTarget:self action:@selector(clickCameraBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [self.tabBar addSubview:cameraBtn];
    
}

- (void)clickCameraBtn
{
    
    VC03 *cameraVc = [[VC03 alloc] init];
    //[self presentViewController:cameraVc animated:YES completion:nil];
    [self.navigationController pushViewController:cameraVc animated:YES];
    
}

//设置tabBar背景图片
- (void)setUpTabBarBackgroundImage
{
    UIImage *image = [UIImage imageNamed:@"tab_bg"];
    CGFloat top = 40;
    CGFloat bottom = 40;
    CGFloat left = 100;
    CGFloat right = 100;
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    UIImage *tabBarImage = [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    
    self.tabBar.backgroundImage = tabBarImage;
    
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
}

//自定义TabBar高度
- (void)viewWillLayoutSubviews
{
    CGRect tabFrame = self.tabBar.frame;
    tabFrame.size.height = 60;
    tabFrame.origin.y = self.view.frame.size.height - 60;
    self.tabBar.frame = tabFrame;
}

//设置tabBar上的按钮
- (void)setUpAllTarBarButton
{
    VC01 *vc01 = self.childViewControllers[0];
    vc01.tabBarItem.image = [UIImage imageNamed:@"tab_live"];
    vc01.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_live_p"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    VC02 *cameraVC = self.childViewControllers[1];
    cameraVC.tabBarItem.enabled = NO;
    
    VC03 *vc03 = self.childViewControllers[2];
    vc03.tabBarItem.image = [UIImage imageNamed:@"tab_me"];
    vc03.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_me_p"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //调整TabBarItem位置
    UIEdgeInsets insets = UIEdgeInsetsMake(10, 0, -10, 0);
    UIEdgeInsets cameraInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    vc01.tabBarItem.imageInsets = insets;
    vc03.tabBarItem.imageInsets = insets;
    cameraVC.tabBarItem.imageInsets = cameraInsets;
    
    //隐藏阴影线
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
}

//添加子控制器
- (void)setUpAllVC
{
    VC01 *vc01 = [[VC01 alloc] init];
    UINavigationController *n01 = [[UINavigationController alloc] initWithRootViewController:vc01];
    [self addChildViewController:n01];
    VC02 *vc02 = [[VC02 alloc] init];
    UINavigationController *n02 = [[UINavigationController alloc] initWithRootViewController:vc02];
    [self addChildViewController:n02];
    VC03 *vc03 = [[VC03 alloc] init];
    UINavigationController *n03 = [[UINavigationController alloc] initWithRootViewController:vc03];
    [self addChildViewController:n03];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

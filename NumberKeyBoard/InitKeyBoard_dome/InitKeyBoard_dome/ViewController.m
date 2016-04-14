//
//  ViewController.m
//  InitKeyBoard_dome
//
//  Created by lf on 16/4/12.
//  Copyright (c) 2016年 lf. All rights reserved.
//

#import "ViewController.h"
#import "XFG_KeyBoard.h"
#define kScreenWidth   [UIScreen mainScreen].bounds.size.width
#define kScreenHeight  [UIScreen mainScreen].bounds.size.height


@interface ViewController ()<UITextFieldDelegate, XFG_KeyBoardDelegate>

@property (nonatomic, strong) XFG_KeyBoard *xfg_keyboard;
@property (nonatomic, strong) UITextField *textField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"小飞哥键盘";
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 168, kScreenWidth - 100, 50)];
    self.textField.delegate = self;
    self.textField.backgroundColor = [UIColor greenColor];
    self.textField.placeholder = @"(默认系统键盘)";
    
    [self.view addSubview:self.textField];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidenKeyBoard)];
    [self.view addGestureRecognizer:tap];
    
    UISegmentedControl *segment = [[UISegmentedControl alloc]  initWithItems:@[@"键盘1",@"键盘2",@"键盘3",@"系统键盘"]];
    segment.frame = CGRectMake(0, 100, kScreenWidth, 50);
    [segment addTarget:self action:@selector(keyBoardTypeAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segment];
    
}

- (void)keyBoardTypeAction:(id )sender
{
    UISegmentedControl *seg = (UISegmentedControl *)sender;
    NSLog(@"intage = %ld", (long)seg.selectedSegmentIndex);
    
    if (seg.selectedSegmentIndex == 0) {
        self.xfg_keyboard = [[XFG_KeyBoard alloc] initWithNumber:@1];
        self.textField.inputView = self.xfg_keyboard;
        self.xfg_keyboard.delegate = self;
        [self.textField reloadInputViews];
    }
    if (seg.selectedSegmentIndex == 1) {
        self.xfg_keyboard = [[XFG_KeyBoard alloc] initWithNumber:@2];
        self.textField.inputView = self.xfg_keyboard;
        self.xfg_keyboard.delegate = self;
        [self.textField reloadInputViews];
    
    }
    
    if (seg.selectedSegmentIndex == 2) {
        self.xfg_keyboard = [[XFG_KeyBoard alloc] initWithNumber:@3];
        self.textField.inputView = self.xfg_keyboard;
        self.xfg_keyboard.delegate = self;
        [self.textField reloadInputViews];
    }
    
    if (seg.selectedSegmentIndex == 3) {
        self.textField.inputView = nil;
        [self.textField reloadInputViews];
    }
   
}

- (void)hidenKeyBoard
{
    NSLog(@"键盘隐藏");
    [self.textField resignFirstResponder];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"显示键盘");
}

- (void)numberKeyBoard:(NSInteger)number
{
    NSString *str = self.textField.text;
    self.textField.text = [NSString stringWithFormat:@"%@%ld",str,(long)number];
}

- (void)cancelKeyBoard
{
    
    NSMutableString *muStr = [[NSMutableString alloc] initWithString:self.textField.text];
    if (muStr.length <= 0) {
        return;
    }
    [muStr deleteCharactersInRange:NSMakeRange([muStr length] - 1, 1)];
    self.textField.text = muStr;
}

#pragma 输入点
-(void)periodKeyBoard{
    
    if ([self.textField.text isEqualToString:@""]) {
        return;
    }
    
    //判断当前时候存在一个点
    if ([self.textField.text rangeOfString:@"."].location == NSNotFound) {
        //输入中没有点
        NSMutableString  *mutableString=[[NSMutableString alloc]initWithFormat:@"%@%@",self.textField.text,@"."];
        self.textField.text=mutableString;
    }
}

-(void)changeKeyBoard{
    
    self.textField.inputView = nil;
    [self.textField reloadInputViews];
}

-(void)finishKeyBoard{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

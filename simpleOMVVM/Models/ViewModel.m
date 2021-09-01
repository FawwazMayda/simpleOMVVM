//
//  ViewModel.m
//  simpleOMVVM
//
//  Created by Muhammad Fawwaz Mayda on 01/09/21.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ViewModel.h"

@interface ViewModel()

@end

@implementation ViewModel

-(instancetype)init {
    
    _colorArray = [[NSMutableArray alloc] init];
    _stringArray = [[NSMutableArray alloc] init];
    for(int i=0;i<50;i++) {
        CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
        CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
        CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
        UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
        [_colorArray addObject:color];
        
        NSString *str = [NSString stringWithFormat:@"Countryballs #%u", arc4random_uniform(500)];
        [_stringArray addObject:str];
    }
    return self;
}

-(void)changeCollectionViewCellAt:(NSIndexPath *)indexPath {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    self.colorArray[indexPath.row] = color;
    self.collectionViewCallback(indexPath);
}

-(void)changeTableViewCellAt:(NSIndexPath *)indexPath {
    NSString *str = [NSString stringWithFormat:@"Countryballs #%u", arc4random_uniform(500)];
    self.stringArray[indexPath.row] = str;
    self.tableViewCallback(indexPath);
}

@end

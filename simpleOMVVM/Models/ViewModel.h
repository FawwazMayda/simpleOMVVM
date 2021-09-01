//
//  ViewModel.h
//  simpleOMVVM
//
//  Created by Muhammad Fawwaz Mayda on 01/09/21.
//

#ifndef ViewModel_h
#define ViewModel_h


#endif /* ViewModel_h */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^CallbackUpdate)(NSIndexPath *);

@interface ViewModel : NSObject

@property (strong,nonatomic) NSMutableArray *colorArray;
@property (strong,nonatomic) NSMutableArray *stringArray;
@property (copy) CallbackUpdate tableViewCallback;
@property (copy) CallbackUpdate collectionViewCallback;

-(instancetype)init;
-(void)changeCollectionViewCellAt:(NSIndexPath*)indexPath;
-(void)changeTableViewCellAt:(NSIndexPath*)indexPath;

@end

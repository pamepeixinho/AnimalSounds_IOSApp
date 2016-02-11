//
//  TesteCollectionViewCell.m
//  collectionView
//
//  Created by Pamela Iupi Peixinho on 2/11/16.
//  Copyright © 2016 PamelaPeixinho. All rights reserved.
//

#import "TesteCollectionViewCell.h"

@implementation TesteCollectionViewCell

-(void) awakeFromNib{
    //standart background
//    UIView *bgView = [[UIView alloc]initWithFrame:self.bounds];
//    self.backgroundView = bgView;
//    self.backgroundView.backgroundColor = [UIColor blueColor];
    
    //selected background
    UIView *selectedView = [[UIView alloc] initWithFrame:self.bounds];
    self.selectedBackgroundView = selectedView;
    self.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:210/255.0 green:209/255.0 blue:255/255.0 alpha:0.5f];
    
}

@end

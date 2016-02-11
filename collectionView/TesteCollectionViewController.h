//
//  TesteCollectionViewController.h
//  collectionView
//
//  Created by Pamela Iupi Peixinho on 2/11/16.
//  Copyright © 2016 PamelaPeixinho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface TesteCollectionViewController : UICollectionViewController <UICollectionViewDelegateFlowLayout>{
    SystemSoundID soundCatID;
    SystemSoundID soundDogID;
    SystemSoundID soundDolphinID;
    SystemSoundID soundElephantID;
    SystemSoundID soundLionID;
    SystemSoundID soundSheepID;
}

@property (strong, nonatomic) NSArray *iconNamesArray;
@property (strong, nonatomic) NSMutableArray *soundsIDs;

@end

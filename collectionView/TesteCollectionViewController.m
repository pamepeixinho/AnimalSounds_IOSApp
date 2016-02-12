//
//  TesteCollectionViewController.m
//  collectionView
//
//  Created by Pamela Iupi Peixinho on 2/11/16.
//  Copyright © 2016 PamelaPeixinho. All rights reserved.
//

#import "TesteCollectionViewController.h"
#import "TesteCollectionViewCell.h"
#import "ViewController.h"
#import "Animal.h"


@interface TesteCollectionViewController ()

@end

@implementation TesteCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // EVIL: Register cell classes
//     [self.collectionView registerClass:[TesteCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    _iconNamesArray = [NSArray arrayWithObjects:@"cat1",
                                                @"dog",
                                                @"dolphin",
                                                @"elephant",
                                                @"lion",
                                                @"sheep",nil];
    
    NSURL *catURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"catmeow" ofType:@"wav"]];
    NSURL *dogURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"dogbark" ofType:@"wav"]];
    NSURL *dolphinURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"dolphin" ofType:@"wav"]];
    NSURL *elephantURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Elephant bellows" ofType:@"wav"]];
    NSURL *lionURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"lion" ofType:@"wav"]];
    NSURL *sheepURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sheep" ofType:@"wav"]];
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)catURL, &soundCatID);
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)dogURL, &soundDogID);
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)dolphinURL, &soundDolphinID);
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)elephantURL, &soundElephantID);
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)lionURL, &soundLionID);
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)sheepURL, &soundSheepID);

//    _soundsIDs = [NSArray arrayWithObjects: soundCatID, soundDogID, soundDolphinID, soundElephantID, soundLionID, soundSheepID, nil];
    self.collectionView.allowsMultipleSelection = NO;
//    self.collectionView.allowsSelection = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"showDetail"]){
        ViewController *detailView = [segue destinationViewController];
        NSIndexPath *indexPath = [self.collectionView.indexPathsForSelectedItems lastObject];
        detailView.name = [_iconNamesArray objectAtIndex:indexPath.row];
    }
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _iconNamesArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TesteCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    cell.imageViewCell.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[_iconNamesArray objectAtIndex:indexPath.row]]];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    switch (indexPath.row) {
        case 0:
            AudioServicesPlaySystemSound(soundCatID);
            break;
        case 1:
            AudioServicesPlaySystemSound(soundDogID);
            break;
        case 2:
            AudioServicesPlaySystemSound(soundDolphinID);
            break;
        case 3:
            AudioServicesPlaySystemSound(soundElephantID);
            break;
        case 4:
            AudioServicesPlaySystemSound(soundLionID);
            break;
        case 5:
            AudioServicesPlaySystemSound(soundSheepID);
            break;
            
            
        default:
            break;
    }
}

// Uncomment this method to specify if the specified item should be highlighted during tracking
//    self.collectionView.allowsSelection = YES; ou funcao:
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}


#pragma mark <UICollectionDelegateFlowLayout>

-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    float cellWidth = (screenWidth-14)/ 2.0; //Replace the divisor with the column count requirement.
    CGSize size = CGSizeMake(cellWidth, cellWidth);
    
    return size;
}


/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end

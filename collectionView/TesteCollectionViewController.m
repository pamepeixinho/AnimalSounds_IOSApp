//
//  TesteCollectionViewController.m
//  collectionView
//
//  Created by Pamela Iupi Peixinho on 2/11/16.
//  Copyright © 2016 PamelaPeixinho. All rights reserved.
//

#import "TesteCollectionViewController.h"
#import "TesteCollectionViewCell.h"

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
    
    _iconNamesArray = [NSArray arrayWithObjects:@"cat.png",
                                                @"dog.png",
                                                @"dolphin.png",
                                                @"elephant.png",
                                                @"lion.png",
                                                @"sheep.png",
                                                @"cat.png",
                                                @"dog.png",
                                                @"dolphin.png",
                                                @"elephant.png",
                                                @"sheep.png",nil];
    
//    self.collectionView.allowsMultipleSelection = YES;
//    self.collectionView.allowsSelection = YES;

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
    cell.imageViewCell.image = [UIImage imageNamed:[_iconNamesArray objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>


// Uncomment this method to specify if the specified item should be highlighted during tracking
//    self.collectionView.allowsSelection = YES; ou funcao:
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
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

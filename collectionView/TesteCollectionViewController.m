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
#import <AFNetworking.h>
#import <UIImageView+AFNetworking.h>


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

    _animalsArray = [[NSMutableArray alloc] init];
    
    [self makeAnimalsRequest];
    
    self.collectionView.allowsMultipleSelection = NO;
//    self.collectionView.allowsSelection = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) makeAnimalsRequest{
    NSURL *url = [NSURL URLWithString:@"http://pamepeixinho.github.io/AnimalsSounds_IOSApp/Animals.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *jsonArray = (NSArray*) responseObject;
        for(NSDictionary *dic in jsonArray){
            Animal *animal = [[Animal alloc] initWithDictionary:dic];
            [_animalsArray addObject:animal];
        }
        
        [self.collectionView reloadData];
        
    }failure:^(AFHTTPRequestOperation * operation, NSError *error) {
        
        NSLog(@"error = %@", error);
    }];

    
    [operation start];
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
    return _animalsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TesteCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    [cell.layer setCornerRadius:15.5f];
    [cell.imageViewCell setImageWithURL:[NSURL URLWithString:[[_animalsArray objectAtIndex:indexPath.row]iconPath]]];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    AudioServicesPlaySystemSound([[_animalsArray objectAtIndex:indexPath.row] soundID]);
    
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
    float cellWidth = (screenWidth-20)/ 2.0; //Replace the divisor with the column count requirement.
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

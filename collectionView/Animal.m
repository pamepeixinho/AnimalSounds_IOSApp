//
//  Animal.m
//  collectionView
//
//  Created by Pamela Iupi Peixinho on 2/11/16.
//  Copyright © 2016 PamelaPeixinho. All rights reserved.
//

#import "Animal.h"

@implementation Animal

@synthesize typeAnimal;
@synthesize soundID;
@synthesize iconPath;
@synthesize imagePath;
@synthesize descriptionAnimal;

- (id)initWithtypeAnimal:(NSString *)aTypeAnimal
                iconPath:(NSString *)aIconPath
               imagePath:(NSString *)aImagePath
       descriptionAnimal:(NSString *)aDescriptionAnimal{
    
    self = [super init];
    
    if(self){
        self.typeAnimal = aTypeAnimal;
        self.iconPath = aIconPath;
        self.imagePath = aImagePath;
        self.descriptionAnimal = aDescriptionAnimal;
    }

    return self;
}

- (id)initWithDictionary:(NSDictionary *)dic{
    self = [self initWithtypeAnimal:dic[@"type"] iconPath:dic[@"iconPath"] imagePath:dic[@"imagePath"] descriptionAnimal:dic[@"descriptionAnimal"]];
    return self;
}



@end

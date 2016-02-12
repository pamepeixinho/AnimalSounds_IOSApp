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

- (id)initWithtypeAnimal:(NSString *)aTypeAnimal
                iconPath:(NSString *)aIconPath
                soundID:(NSURL *)aURL{
    
    self = [super init];
    
    if(self){
        self.typeAnimal = aTypeAnimal;
        self.iconPath = aIconPath;
        
    }

    return self;
}

- (id)initWithDictionary:(NSDictionary *)dic{
//    self = [self initWithtypeAnimal:dic[@"type"] iconPath:dic[@"iconPath"] imagePath:dic[@"imagePath"] descriptionAnimal:dic[@"descriptionAnimal"]];
    return self;
}



@end

//
//  Animal.m
//  collectionView
//
//  Created by Pamela Iupi Peixinho on 2/11/16.
//  Copyright © 2016 PamelaPeixinho. All rights reserved.
//

#import "Animal.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation Animal

@synthesize typeAnimal;
@synthesize soundID;
@synthesize iconPath;
@synthesize nameSound;
@synthesize typeSound;

- (id)initWithtypeAnimal:(NSString *)aTypeAnimal
                iconPath:(NSString *)aIconPath
               nameSound:(NSString *)aNameSound
               typeSound:(NSString *)aTypeSound{
    
    self = [super init];
    
    if(self){
        self.typeAnimal = aTypeAnimal;
        self.iconPath = aIconPath;
        self.nameSound = aNameSound;
        self.typeSound = aTypeSound;
        self.url = [NSURL fileURLWithPath: [[NSBundle mainBundle] pathForResource:self.nameSound ofType:typeSound]];
        SystemSoundID temp;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)self.url, &temp);
        self.soundID = temp;
    }

    return self;
}

- (id)initWithDictionary:(NSDictionary *)dic{
//    self = [self initWithtypeAnimal:dic[@"type"] iconPath:dic[@"iconPath"] imagePath:dic[@"imagePath"] descriptionAnimal:dic[@"descriptionAnimal"]];
    self = [self initWithtypeAnimal:dic[@"type"] iconPath:dic[@"iconPath"] nameSound:dic[@"soundPath"] typeSound:dic[@"soundType"]];
    return self;
}



@end

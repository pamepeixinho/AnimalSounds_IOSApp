//
//  Animal.h
//  collectionView
//
//  Created by Pamela Iupi Peixinho on 2/11/16.
//  Copyright © 2016 PamelaPeixinho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface Animal : NSObject

@property (strong, nonatomic) NSString *typeAnimal;
@property SystemSoundID *soundID;
@property (strong, nonatomic) NSString *iconPath;
@property (strong, nonatomic) NSString *imagePath;
@property (strong, nonatomic) NSString *descriptionAnimal;

- (id)initWithtypeAnimal:(NSString *)aTypeAnimal
                iconPath:(NSString *)aIconPath
                imagePath:(NSString *)aImagePath
                descriptionAnimal:(NSString *)aDescriptionAnimal;

- (id)initWithDictionary:(NSDictionary *)dic;

@end

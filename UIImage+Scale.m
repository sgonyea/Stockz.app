//
//  UIImage+Scale.m
//  Stockz
//
//  Created by Scott Gonyea on 4/29/12.
//  Copyright (c) 2012 sgonyea inc. All rights reserved.
//

#import "UIImage+Scale.h"

@implementation UIImage (scale)

-(UIImage*)scaleToSize:(CGSize)size {
  // Create a bitmap graphics context
  // This will also set it as the current context
  UIGraphicsBeginImageContext(size);

  // Draw the scaled image in the current context
  [self drawInRect:CGRectMake(0, 0, size.width, size.height)];

  // Create a new image from current context
  UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();

  // Pop the current context from the stack
  UIGraphicsEndImageContext();

  // Return our new scaled image
  return scaledImage;
}

@end

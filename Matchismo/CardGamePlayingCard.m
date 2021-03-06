//
//  CardGamePlayingCard.m
//  Matchismo
//
//  Created by in5630 on 05.11.14.
//  Copyright (c) 2014 zhurbenko inc. All rights reserved.
//

#import "CardGamePlayingCard.h"

@implementation CardGamePlayingCard

- (NSString *)contents
{
    NSLog(@"content card suit %@", self.suit);
    NSLog(@"content card rank %d", self.rank);
    NSArray *rankStrings = [CardGamePlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

- (int)match:(NSArray *)otherCards;
{
    int score = 0;
    if ([otherCards count] == 1) {
        CardGamePlayingCard *otherCard = [otherCards firstObject];
        if (otherCard.rank == self.rank) {
            score = 4;
        } else if ([otherCard.suit isEqualToString:self.suit]) {
            score = 1;
        }
    } else if ([otherCards count] == 2) {
        NSLog(@"matching third card");
    }
    return score;
}

+ (NSArray *) validSuits
{
    //return nil;
    return @[@"♠️",@"♣️",@"♥️",@"♦️"];
}

+ (NSArray *) rankStrings
{
    //return nil;
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger) maxRank { return [[self rankStrings] count]-1; }

- (void)setSuit:(NSString *)suit
{
    if ([[CardGamePlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [CardGamePlayingCard maxRank]) {
        _rank = rank;
    }
}

@end

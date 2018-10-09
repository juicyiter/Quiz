//
//  JITQuizViewController.m
//  Quiz
//
//  Created by JuicyITer on 06/10/2018.
//  Copyright © 2018 JuicyITer. All rights reserved.
//

#import "JITQuizViewController.h"

@interface JITQuizViewController ()

@property (nonatomic) int currentQuestionIndex;
@property (nonatomic) int flag; // whether or not the initial start

@property (nonatomic, copy) NSArray *questions; // These arrays are needed to be created right after the QuizViewController
@property (nonatomic, copy) NSArray *answers;   // to make sure that they are ready to go at the same time that the QuizViewController
                                               // appears to the users.

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
// This code gives every instance of JITQuizeController an outlet
// named questionLabel, which can be used to point to a UILabel object.
// The IBOutlet keyword tells the Xcode that you will set this outlet
// using Interface Builder
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation JITQuizViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // Call the init method implemented by the superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        // create two arrays filled with questions and answers
        // and make the pointers point to them
        self.questions = @[@"From what is cognac made?",
                          @"What is 7+7?",
                          @"What is the captical of China?"];
        
        self.answers = @[@"Grapes",
                        @"14",
                        @"Beijing"];
    }
    
    // return the address of the new object
    return self;
}

- (IBAction) showQuestion :(id)sender
{
    // The IBAction tells the Xcode that you'll make connections in the
    // Interface Builder.
    
    // Step to the next question
    self.currentQuestionIndex++;
    self.flag = 1;
    // Am I the last question?
    if(self.currentQuestionIndex == [self.questions count]){
        // Go back to the first question
        self.currentQuestionIndex = 0;
    }
    
    // Get the string at the index of the questions array
    NSString *question = self.questions[self.currentQuestionIndex];
    
    // Display the string in the question label
    self.questionLabel.text = question;
    
    // Reset the answer label (from the last answer)
    self.answerLabel.text = @"???";
}

- (IBAction) showAnswer :(id)sender
{
    if(self.flag){
        // What is the answer to the current question?
        NSString *answer = self.answers[self.currentQuestionIndex];
    
        // Display the answer in the answer label
        self.answerLabel.text = answer;
    }
    else{
        self.answerLabel.text = @"The question is not shown!";
    }
}
@end

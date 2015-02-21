// SSKSunsetParser.h
//
// Copyright (c) 2015 Shintaro Kaneko
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <Cocoa/Cocoa.h>

// Respect for the redcarpet.
typedef NS_ENUM(NSUInteger, SSKSunsetMarkdownExtensions) {
    SSKSunsetMarkdown_None,
    
    SSKSunsetMarkdown_NO_INTRA_EMPHASIS,
    SSKSunsetMarkdown_TABLES,
    SSKSunsetMarkdown_FENCED_CODE,
    SSKSunsetMarkdown_AUTOLINK,
    SSKSunsetMarkdown_STRIKETHROUGH,
    SSKSunsetMarkdown_UNDERLINE,
    SSKSunsetMarkdown_SPACE_HEADERS,
    SSKSunsetMarkdown_SUPERSCRIPT,
    SSKSunsetMarkdown_LAX_SPACING,
    SSKSunsetMarkdown_DISABLE_INDENTED_CODE,
    SSKSunsetMarkdown_HIGHLIGHT,
    SSKSunsetMarkdown_FOOTNOTES,
    SSKSunsetMarkdown_QUOTE,
};

@interface SSKSunsetParser : NSObject
@property (assign) SSKSunsetMarkdownExtensions extensions;
@property (strong) NSString *text;

- (instancetype)initWithText:(NSString *)text;
- (NSString *)toHTML;
@end

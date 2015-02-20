// SSKSunsetParser.m
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

#import "SSKSunsetParser.h"

#include "markdown.h"
#include "html.h"
#include "buffer.h"

#define READ_UNIT 1024
#define OUTPUT_UNIT 64

@interface SSKSunsetParser ()
@property (strong) NSString *text;
@end

@implementation SSKSunsetParser

- (instancetype)initWithText:(NSString *)text {
    self = [self init];
    if (self) {
        self.text = text;
    }
    return self;
}

- (NSString *)toHTML {
    const uint8_t *data = (uint8_t *)[self.text.copy UTF8String];
    uint32_t size = (uint32_t)[self.text lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
    struct buf *ob;
    struct sd_callbacks callbacks;
    struct html_renderopt options;
    struct sd_markdown *markdown;

    /* performing markdown parsing */
    ob = bufnew(OUTPUT_UNIT);
    sdhtml_renderer(&callbacks, &options, 0);
    markdown = sd_markdown_new(0, 16, &callbacks, &options);
    sd_markdown_render(ob, data, 2 * size, markdown);
    sd_markdown_free(markdown);

    NSString *html = [NSString stringWithUTF8String:(const char *)ob->data];

    /* cleanup */
    bufrelease(ob);
    return html;
}

@end

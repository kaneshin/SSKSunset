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
- (uint32_t)markdownExtensions;
@end

@implementation SSKSunsetParser {
    struct sd_callbacks callbacks;
    struct html_renderopt options;
    struct buf *ob;
    struct sd_markdown *markdown;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.extensions = SSKSunsetMarkdown_None;
        ob = bufnew(OUTPUT_UNIT);
        sdhtml_renderer(&callbacks, &options, 0);
    }
    return self;
}

- (instancetype)initWithText:(NSString *)text {
    self = [self init];
    if (self) {
        self.text = text;
    }
    return self;
}

- (void)dealloc {
    /* cleanup */
    bufrelease(ob);
}

- (NSString *)toHTML {
    const uint8_t *data = (uint8_t *)[self.text.copy UTF8String];
    uint32_t size = (uint32_t)[self.text lengthOfBytesUsingEncoding:NSUTF8StringEncoding];

    /* performing markdown parsing */
    markdown = sd_markdown_new(self.markdownExtensions, 16, &callbacks, &options);
    sd_markdown_render(ob, data, size, markdown);
    sd_markdown_free(markdown);

    return [NSString stringWithUTF8String:(const char *)ob->data];
}

- (uint32_t)markdownExtensions {
    uint32_t ext = 0;
    if (self.extensions & SSKSunsetMarkdown_NO_INTRA_EMPHASIS) {
        ext |= MKDEXT_NO_INTRA_EMPHASIS;
    }
    if (self.extensions & SSKSunsetMarkdown_TABLES) {
        ext |= MKDEXT_TABLES;
    }
    if (self.extensions & SSKSunsetMarkdown_FENCED_CODE) {
        ext |= MKDEXT_FENCED_CODE;
    }
    if (self.extensions & SSKSunsetMarkdown_AUTOLINK) {
        ext |= MKDEXT_AUTOLINK;
    }
    if (self.extensions & SSKSunsetMarkdown_STRIKETHROUGH) {
        ext |= MKDEXT_STRIKETHROUGH;
    }
    if (self.extensions & SSKSunsetMarkdown_UNDERLINE) {
        ext |= MKDEXT_UNDERLINE;
    }
    if (self.extensions & SSKSunsetMarkdown_SPACE_HEADERS) {
        ext |= MKDEXT_SPACE_HEADERS;
    }
    if (self.extensions & SSKSunsetMarkdown_SUPERSCRIPT) {
        ext |= MKDEXT_SUPERSCRIPT;
    }
    if (self.extensions & SSKSunsetMarkdown_LAX_SPACING) {
        ext |= MKDEXT_LAX_SPACING;
    }
    if (self.extensions & SSKSunsetMarkdown_DISABLE_INDENTED_CODE) {
        ext |= MKDEXT_DISABLE_INDENTED_CODE;
    }
    if (self.extensions & SSKSunsetMarkdown_HIGHLIGHT) {
        ext |= MKDEXT_HIGHLIGHT;
    }
    if (self.extensions & SSKSunsetMarkdown_FOOTNOTES) {
        ext |= MKDEXT_FOOTNOTES;
    }
    if (self.extensions & SSKSunsetMarkdown_QUOTE) {
        ext |= MKDEXT_QUOTE;
    }
    return ext;
}

@end

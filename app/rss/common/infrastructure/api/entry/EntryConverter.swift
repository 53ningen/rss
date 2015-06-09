//
//  EntryConverter.swift
//  rss
//
//  Copyright (c) 2015年 gomi_ningen. All rights reserved.
//

import Foundation

public class EntryConverter: NSObject, NSXMLParserDelegate {
    
    private var token: String = ""
    private var entries: [Entry] = []
    private var stack: [String] = []
    
    public func parseInputStream(s: NSInputStream) -> [Entry] {
        NSXMLParser(stream: s).parse()
        return entries
    }
    
    public func parseString(s: NSString) -> [Entry]? {
        let data: NSData? = s.dataUsingEncoding(NSUTF8StringEncoding)
        if let d = data {
            return parseData(d)
        }
        return Optional.None
    }
    
    public func parseData(d: NSData) -> [Entry]? {
        NSXMLParser(data: d).parse()
        return entries
    }
    
    public func parseContent(url: NSURL) -> [Entry] {
        NSXMLParser(contentsOfURL: url)?.parse()
        return entries
    }
    
    func initConverter() {
        token = ""
        entries = []
        stack = []
    }
    
    public func parserDidStartDocument(parser: NSXMLParser) {
        initConverter()
    }

    public func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject]) {
        stack.append(elementName)
    }
    
    public func parser(parser: NSXMLParser, foundAttributeDeclarationWithName attributeName: String, forElement elementName: String, type: String?, defaultValue: String?) {
    }

    
    public func parser(parser: NSXMLParser, foundCharacters string: String?) {
        if let s = string {
            token = token + s
        }
    }
    
    public func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        token = ""
        stack.removeLast()
    }
    
    public func parserDidEndDocument(parser: NSXMLParser) {
    }

}

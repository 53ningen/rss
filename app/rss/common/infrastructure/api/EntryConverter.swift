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
    private var builder: EntryBuilder?
    
    private static let ENTRY_ELEMENT = "entry"
    private static let ID_ELEMENT = "id"
    private static let PUBLISHED_ELEMENT = "published"
    private static let UPDATED_ELEMENT = "updated"
    private static let URL_ELEMENT = "url"
    private static let TITLE_ELEMENT = "title"
    private static let AUTHOR_ELEMENT = "author"
    private static let CONTENT_ELEMENT = "content"
    private static let NAME_ELEMENT = "name"
    
    override private init() {
    }

    public class func parseInputStream(s: NSInputStream) -> [Entry] {
        let conveter = EntryConverter()
        let parser = NSXMLParser(stream: s)
        parser.delegate = conveter
        parser.parse()
        return conveter.entries
    }
    
    public class func parseString(s: NSString) -> [Entry]? {
        let data: NSData? = s.dataUsingEncoding(NSUTF8StringEncoding)
        if let d = data {
            return parseData(d)
        }
        return Optional.None
    }
    
    public class func parseData(d: NSData) -> [Entry]? {
        let converter = EntryConverter()
        let parser = NSXMLParser(data: d)
        parser.delegate = converter
        parser.parse()
        return converter.entries
    }
    
    public class func parseContent(url: NSURL) -> [Entry] {
        let converter = EntryConverter()
        let parser = NSXMLParser(contentsOfURL: url)
        parser?.delegate = converter
        parser?.parse()
        return converter.entries
    }
    
    func initConverter() {
        token = ""
        entries = []
        stack = []
        builder = EntryBuilder()
    }
    
    public func parserDidStartDocument(parser: NSXMLParser) {
        initConverter()
    }

    public func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject]) {
        token = ""
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
        switch elementName {
        case EntryConverter.ENTRY_ELEMENT:
            if let entry = builder?.build() {
                entries.append(entry)
            }
        case EntryConverter.ID_ELEMENT:
            builder?.id = token
        case EntryConverter.PUBLISHED_ELEMENT:
            builder?.published = token
        case EntryConverter.UPDATED_ELEMENT:
            builder?.updated = token
        case EntryConverter.URL_ELEMENT:
            builder?.url = NSURL(string: token)
        case EntryConverter.TITLE_ELEMENT:
            builder?.title = token
        case EntryConverter.CONTENT_ELEMENT:
            break
        case EntryConverter.AUTHOR_ELEMENT:
            break
        case EntryConverter.NAME_ELEMENT:
            builder?.author = token
        default:
            break
        }
        stack.removeLast()
    }
    
    public func parserDidEndDocument(parser: NSXMLParser) {
    }

}

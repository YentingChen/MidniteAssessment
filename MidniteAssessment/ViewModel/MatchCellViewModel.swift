//
//  MatchCellViewModel.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/14.
//

import Foundation

extension Match: MatchCellViewModel {
    
    static func startDate(from time: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        return formatter.date(from: time) ?? Date()
    }
    
    static func startTimeString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    
    static func startDayString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.doesRelativeDateFormatting = true
        return formatter.string(from: date)
    }
    
    var competitionLabelText: String? {
        
        return self.competitionName
        
    }
    
    var timeLabelText: String? {
        guard let startTime = startTime else { return nil }
        let date = Match.startDate(from: startTime)
        let timeString = Match.startTimeString(from: date)
        let dayString = Match.startDayString(from: date)
        return "\(timeString) \n\(dayString)"
    }
    
    var dayLabelText: String? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let date: Date? = dateFormatter.date(from: self.startTime ?? "")
        return date?.formatted()
    }
    
    var homeLabelText: String? {
        
        return homeTeam
    }
    
    var awayLabelText: String? {
        
        return awayTeam
    }
    
    var homeImageUrl: URL? {
        
        if let urlString = homeImageURL, let url = URL(string: urlString) {
            return url
        } else {
            return nil
        }
    }
    
    var awayImageUrl: URL? {
        
        if let urlString = awayImageURL, let url = URL(string: urlString) {
            return url
        } else {
            return nil
        }
    }
    
    
}

protocol MatchCellViewModel {
    
    var competitionLabelText: String? { get }
    
    var homeImageUrl: URL? { get }
    
    var awayImageUrl: URL? { get }
    
    var homeLabelText: String? { get }
    
    var awayLabelText: String? { get }
    
    var timeLabelText: String? { get }
    
    var dayLabelText: String? { get }
    
}

